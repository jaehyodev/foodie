package com.smhrd.foodie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.AllergyInfo;
import com.smhrd.foodie.model.DislikeInfo;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.MemberAllergy;
import com.smhrd.foodie.model.MemberDislike;
import com.smhrd.foodie.model.OrderDetail;
import com.smhrd.foodie.model.OrderInfo;

@Controller
public class MemberController {

	@Autowired
	MemberMapper mapper;

	// 회원 정보 수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(HttpSession session, @RequestParam("mem_name") String mem_name,
			@RequestParam("mem_email") String mem_email, @RequestParam("mem_phone") String mem_phone,
			@RequestParam("mem_addr") String mem_addr, @RequestParam("mem_extraAddr") String mem_extraAddr, RedirectAttributes ra) {

		// session에 저장되어 있는 사용자의 *현재* 정보 memeber 객체에 set
		Member member = (Member) session.getAttribute("member");
		System.out.println("현재 로그인 된 멤버 : " + member);

		mem_addr = mem_addr + " " + mem_extraAddr;
				
		// RequestParam으로 가져온 값들 member에 set
		member.setMem_name(mem_name);
		member.setMem_email(mem_email);
		member.setMem_phone(mem_phone);
		member.setMem_addr(mem_addr);

		// 회원 정보 수정하는 매퍼 메소드 실행
		int row = mapper.update(member);

		if (row > 0) {
			System.out.println("회원 정보 수정 성공");

			ra.addFlashAttribute("updateStatus", "success");
			ra.addFlashAttribute("massage", "회원 정보가 수정되었습니다.");

		} else {
			System.out.println("회원 정보 수정 실패");

			ra.addFlashAttribute("updateStatus", "failure");
		}

		return "redirect:/update";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {

		System.out.println("로그아웃 전 세션 값 : " + session.getAttribute("member"));

		// 기존에 존재하던 session에 저장되어 있던 객체값을 delete
		session.removeAttribute("member");

		System.out.println("로그아웃 후 세션 값 : " + session.getAttribute("member"));

		// redirect : /logout 이 리턴해주는 jsp로 이동하는 것이 아니라 (리턴해주는 곳으로 갈 경우 url에 /logout으로 뜸)
		// value가 / 인 곳으로 가게 하는 것
		return "redirect:/";
	}


	// 알러지 마이페이지 (사용자의 알러지와 비선호 정보만 받아서 출력만함)
	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy(HttpSession session, Model model) {

		// 알러지 idx와 name가지고 오기
		List<AllergyInfo> allergyInfo = mapper.allergyInfo();

		System.out.println("DB에서 가져온 알러지 테이블 : " + allergyInfo); // 확인용 코드

		model.addAttribute("allergyInfo", allergyInfo);

		// 비선호 식재료 idx, name
		List<DislikeInfo> dislikeInfo = mapper.dislikeInfo();

		System.out.println("DB에서 가져온 비선호 식재료 테이블 : " + dislikeInfo); // 확인용 코드

		model.addAttribute("dislikeInfo", dislikeInfo);

		// 여기까지 코드는 JSP에서 반복문으로 테이블을 생성하기 위한 것

		// 1. 알러지 페이지에 접속했을 때 해당 유저의 id값 가져오기 -> 이유 : 해당 유저의 id값을 가져온다면 각 사용자를 구분할 수 있다는
		// 것을 확인할 수 있음
		System.out.println("session의 object 값 : " + session.getAttribute("member")); // 확인용

		// 2. object 타입을 Member로 바꿔주고 Member타입의 변수에 담기
		Member member = (Member) session.getAttribute("member"); // 확인용

		// 3. member의 mem_id에 사용자의 id가 잘 담겼는지 확인
		System.out.println("mem_id 값 : " + member.getMem_id()); // 확인용

		// 4. "Member"안에 있는 mem_id 값 db에 보내기 -> 이유 : 해당 유저의 알러지, 비선호 식재료 정보를 DB에서 조회하기
		// 위해서
		// 인터페이스에 있는 메소드의 매개변수에도 똑같이 적어줘야 함.
		List<MemberAllergy> joinAllergyIdx = mapper.allergyMypage(member); // member가 mem_id값을 가지고 있기 때문에 member를 매개변수로 설정																																	// -> select로 조호된 값에 적합한 모델인 MemberAllery에 담기 *																																	// 여러행을 출력하기 때문에 List형태 사용
		List<MemberDislike> joinDislikeIdx = mapper.dislikeMypage(member);

		System.out.println("member_allergy_info의 select문 반환 값 : " + joinAllergyIdx); // select문 (확인용) // 이거 사용할것
		System.out.println("member_dislike_info의 select문 반환 값 : " + joinDislikeIdx); // select문 (확인용)

		model.addAttribute("joinAllergyIdx", joinAllergyIdx);
		model.addAttribute("joinDislikeIdx", joinDislikeIdx);

		return "allergy"; // allergy.jsp가 실행되는 순간 위 정보들이 반영
	}

	// 알러지, 비선호 식재료 수정 기능
	@RequestMapping(value = "/update-allergy", method = RequestMethod.POST)
	public String updateAllergy(HttpSession session, Model model,
			@RequestParam(name = "allergy_list", required = false) List<String> allergy_list,
			@RequestParam(name = "dislike_list", required = false) List<String> dislike_list,
			@RequestParam(name = "deleteAllergy", required = false) String deleteAllergy,
			@RequestParam(name = "deleteDislike", required = false) String deleteDislike, RedirectAttributes ra) {

		Member member = (Member) session.getAttribute("member");

		// 알러지 idx와 name가지고 오기
		List<AllergyInfo> allergyInfo = mapper.allergyInfo();

		System.out.println("DB에서 가져온 알러지 테이블 : " + allergyInfo); // 확인용 코드

		model.addAttribute("allergyInfo", allergyInfo);

		// 비선호 식재료 idx, name
		List<DislikeInfo> dislikeInfo = mapper.dislikeInfo();

		System.out.println("DB에서 가져온 비선호 식재료 테이블 : " + dislikeInfo); // 확인용 코드

		model.addAttribute("dislikeInfo", dislikeInfo);

		// 여기까지 코드는 JSP에서 반복문으로 테이블을 생성하기 위한 것

		if (allergy_list != null) {
			for (int i = 0; i < allergy_list.size(); i++) {
				// session에 저장되어 있는 id와 jsp checkBox에서 넘겨준 allergy_list 담기
				MemberAllergy memberAllergy = new MemberAllergy(member.getMem_id(), Integer.parseInt(allergy_list.get(i)));
				mapper.updateAllergy(memberAllergy);
			}
		}

		if (dislike_list != null) {
			for (int i = 0; i < dislike_list.size(); i++) {
				// session에 저장되어 있는 id와 jsp checkBox에서 넘겨준 allergy_list 담기
				MemberDislike memberDislike = new MemberDislike(member.getMem_id(), Integer.parseInt(dislike_list.get(i)));
				mapper.updateDislike(memberDislike);
			}
		}

		// 체크가 해제된 알러지의 idx를 db에 넘겨줘서 delete
		System.out.println("삭제될 allergy_idx : " + deleteAllergy); // 현재 ,로 나눠져 있는 상태
		System.out.println("삭제될 dislike_idx : " + deleteDislike);

		// split 을 사용하여 , 기준으로 문자열을 나누어 배열 생성
		String[] deleteAllergyList = deleteAllergy.split(",");
		String[] deleteDislikeList = deleteDislike.split(",");

		if (deleteAllergyList != null) {
			for (int i = 0; i < deleteAllergyList.length; i++) {
				MemberAllergy memberAllergy = new MemberAllergy(member.getMem_id(), Integer.parseInt(deleteAllergyList[i]));
				mapper.deleteAllergy(memberAllergy);
			}
		}

		if (deleteDislikeList != null) {
			for (int i = 0; i < deleteDislikeList.length; i++) {
				MemberDislike memberDislike = new MemberDislike(member.getMem_id(), Integer.parseInt(deleteDislikeList[i]));
				mapper.deleteDislike(memberDislike);
			}
		}

		List<MemberAllergy> joinAllergyIdx = mapper.allergyMypage(member);
		List<MemberDislike> joinDislikeIdx = mapper.dislikeMypage(member);

		model.addAttribute("joinAllergyIdx", joinAllergyIdx);
		model.addAttribute("joinDislikeIdx", joinDislikeIdx);
		ra.addFlashAttribute("updateStatus", "success");

		return "redirect:/allergy";
	};


	//마이페이지 이동 시 첫페이지인 주문 내역 정보 호출
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {

		// session에 담긴 member 객체의 id값 가져오기
		Member member = (Member) session.getAttribute("member");

		if (member == null) {
			return "login";
		}

		// 주문 내역 불러오는 sql문 실행 후 반환되는 값 orderInfo 객체에 담기
		List<OrderInfo> orderInfo = mapper.orderInfo(member);
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		List<Integer> detailSize = new ArrayList<Integer>();
		System.out.println(orderInfo);

		for (OrderInfo order : orderInfo) {
			System.out.println("Processing order: " + order.getOrder_idx());

			List<OrderDetail> details = mapper.orderDetail(order.getOrder_idx());
			
			if (details != null) {
				System.out.println("Details found: " + details.size());
				orderDetailList.addAll(details);
				detailSize.add(details.size());
				System.out.println("Current orderDetailList: " + orderDetailList);
			} else {
				System.out.println("No details found for order_idx: " + order.getOrder_idx());
			}
		}
		
		// jsp에서 사용하기 위해 model에 담기
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("detailSize", detailSize);

		return "mypage";
	}
}


