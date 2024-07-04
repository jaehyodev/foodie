package com.smhrd.foodie.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.smhrd.foodie.mapper.CartMapper;
import com.smhrd.foodie.model.Cart;
import com.smhrd.foodie.model.Member;

@Controller
public class CartController {

	@Autowired
	CartMapper mapper;

	// 아임포트 apiKey
	private String apiKey = "8423303430847585";
	// 아임포트 secretKey
	private String secretKey = "pBQPOHyX2RaZqMQxEi6RVrSuzhGTt67X74zw0qNwUAEndxNq1IWhadr3Ucjzkyraebw5LTB5qeQO7keb";

	// 장바구니 목록 출력 메서드
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartList(Model model, HttpSession session) {

		Cart cart = new Cart();
		Member member = (Member) session.getAttribute("member");								// 로그인 된 user 가져오기
		model.addAttribute("member", member);													// user 저장

		if (member != null) {
			cart.setMem_id(member.getMem_id());
			// 장바구니 목록 저장
			List<Cart> cartList = mapper.list(cart);
			model.addAttribute("cartList", cartList);
			
			// 상품 총액
			int sum = 0;
			for (int i = 0; i < cartList.size(); i++) {											// 재료 단가 * 재료 수량
				sum += cartList.get(i).getIngre_price() * cartList.get(i).getIngre_cnt();
			}
			// 총액 저장
			model.addAttribute("sum", sum);
		}

		return "shopping-cart";
	}

	// 장바구니 목록 삭제
	@RequestMapping(value = "/delete-selected-items.do", method = RequestMethod.GET)
	public @ResponseBody String deleteSelectedItems(@RequestParam("ingreIdxs") List<Integer> ingreIdxs,
													@RequestParam("memIds") List<String> memIds) {
		
		for (int i = 0; i < ingreIdxs.size(); i++) {
			int ingre_idx = ingreIdxs.get(i);													// 재료 index
			String mem_id = memIds.get(i);														// 재료 수량

			Cart cart = new Cart();
			cart.setMem_id(mem_id);
			cart.setIngre_idx(ingre_idx);

			mapper.deleteItem(cart);
		}

		return "success";
	}

	// 장바구니 목록 수정
	@RequestMapping(value = "/update-cart.do", method = RequestMethod.GET)
	public ResponseEntity<String> updateItem(@RequestParam("cartValues") int[] cartValues,
											 @RequestParam("basketValues") int[] basketValues) {

		Cart cart = new Cart();

		for (int i = 0; i < cartValues.length; i++) {
			cart.setIngre_cnt(cartValues[i]); 	 												// ingre_cnt(재료 수량)
			cart.setBasket_idx(basketValues[i]); 												// basket_idx(장바구니 index)
			mapper.updateItem(cart);
		}

		return ResponseEntity.ok().body("{}");													// 빈 JSON 객체를 반환
	}

	// 결제창 장바구니 목록 출력
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkoutCartList(Model model, HttpSession session) {

		Cart cart = new Cart();
		// session의 user정보 가져오기
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);

		if (member != null) {
			cart.setMem_id(member.getMem_id());
			
			// 장바구니 목록 저장
			List<Cart> cartList = mapper.list(cart);
			model.addAttribute("cartList", cartList);
			
			// 결제 총액
			int sum = 0;
			for (int i = 0; i < cartList.size(); i++) {
				sum += cartList.get(i).getIngre_price() * cartList.get(i).getIngre_cnt();
			}
			// 총액, user 저장
			model.addAttribute("sum", sum);														// 결제 총액
			member = mapper.checkoutInfo(member.getMem_id());
			model.addAttribute("member", member);												// user
		}

		return "checkout";
	}

	// 결제 완료 정보(주문번호,주소,총액,재료,수량)저장
	@RequestMapping(value = "/checkout-success.do", method = RequestMethod.GET)
	public void checkoutSuccess(@RequestParam("merchant_uid") String merchant_uid,
								@RequestParam("userAddr") String userAddr,
								@RequestParam("userSum") int userSum,
								@RequestParam("ingreidxValues") String[] ingreidxValues,
								@RequestParam("countValues") String[] countValues, HttpSession session) {

		Cart cart = new Cart();
		Member member = (Member) session.getAttribute("member");
		
		// 결제 완료 페이지
		cart.setOrder_idx(Integer.parseInt(merchant_uid));										// 주문번호
		cart.setMem_id(member.getMem_id());														// 아이디
		cart.setTotal_amount(userSum);															// 총액
		cart.setOrder_addr(userAddr);															// 주소

		mapper.checkoutSuccess(cart);
		// order_detail_info저장
		for (int i = 0; i < ingreidxValues.length; i++) {
			cart.setOrder_idx(Integer.parseInt(merchant_uid));									// 주문번호
			cart.setIngre_idx(Integer.parseInt(ingreidxValues[i]));								// 재료index
			cart.setOrder_cnt(Integer.parseInt(countValues[i]));								// 재료 수량
			mapper.checkoutCart(cart);
		}
	}

	// 주문 내역 출력(장바구니 삭제)
	@RequestMapping(value = "/success/{merchant_uid}", method = RequestMethod.GET)
	public String success(@PathVariable("merchant_uid") int merchant_uid, Model model, HttpSession session) {

		Cart cart = mapper.orderInfo(merchant_uid);
		model.addAttribute("cart", cart);
		
		Member member = (Member) session.getAttribute("member");								// session의 user정보 가져오기
		cart.setMem_id(member.getMem_id());
		mapper.deleteCart(cart);

		return "checkout-success";
	}

	// 아임포트에 결제취소 요청하기
	@RequestMapping(value = "/delete-order", method = RequestMethod.GET)
	public @ResponseBody String refundRequest(@RequestParam("merchant_uid") String merchant_uid,
											  @RequestParam("reason") String reason) throws IOException {
		
		String access_token = getToken(apiKey, secretKey);

		URL url = new URL("https://api.iamport.kr/payments/cancel");							//아임포트에 취소 요청할 URL
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");															// 요청 방식 POST

		// 요청의 Content-Type, Accept, Authorization 헤더 설정
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);

		conn.setDoOutput(true);																	// 해당 연결을 출력 스트림(요청)으로 사용

		// JSON 객체에 해당 API가 필요로하는 데이터 추가.
		JsonObject json = new JsonObject();
		json.addProperty("merchant_uid", merchant_uid);
		json.addProperty("reason", reason);

		// 출력 스트림으로 해당 conn에 요청
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(json.toString());																// JSON 객체를 문자열 형태로 HTTP 요청 본문에 추가
		bw.flush();																				// BufferedWriter 비우기
		bw.close();																				// BufferedWriter 종료

		// 입력 스트림으로 conn 요청에 대한 응답 반환
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		br.close();																				// BufferedReader 종료
		
		conn.disconnect();																		// 연결 종료

		// 데이터베이스 삭제
		mapper.deleteOrder(merchant_uid);
		mapper.deleteOrderDetail(merchant_uid);

		return "success";
	}

	// 아임포트에서 결제취소에 필요한 token 값 가져오기
	public String getToken(String apiKey, String secretKey) throws IOException {
		
		URL url = new URL("https://api.iamport.kr/users/getToken");
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");															// 요청 방식 POST

		// 요청의 Content-Type과 Accept 헤더 설정
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");

		conn.setDoOutput(true);																	// 해당 연결을 출력 스트림(요청)으로 사용

		// JSON 객체에 해당 API가 필요로하는 데이터 추가.
		JsonObject json = new JsonObject();
		json.addProperty("imp_key", apiKey);
		json.addProperty("imp_secret", secretKey);

		// 출력 스트림으로 해당 conn에 요청
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(json.toString());  															// JSON 객체를 문자열 형태로 HTTP 요청 본문에 추가
		bw.flush(); 			    															// BufferedWriter 비우기
		bw.close(); 			    															// BufferedWriter 종료

		// 입력 스트림으로 conn 요청에 대한 응답 반환
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		Gson gson = new Gson(); 																// 응답 데이터를 자바 객체로 변환
		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		String accessToken = gson.fromJson(response, Map.class).get("access_token").toString();
		br.close();             																// BufferedReader 종료

		conn.disconnect();      																// 연결 종료

		return accessToken;
	}

}