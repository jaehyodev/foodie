package com.smhrd.foodie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.foodie.mapper.CartMapper;
import com.smhrd.foodie.model.CartItems;
import com.smhrd.foodie.model.Member;

@Controller
public class CartController {
	
	@Autowired
	CartMapper mapper;
	
	//장바구니 목록 출력 메서드
	@RequestMapping(value="/cart",method=RequestMethod.GET)
	public String cartList(Model model,HttpSession session ) {
		
		CartItems CartItems = new CartItems();
		Member member = (Member)session.getAttribute("member");
		model.addAttribute("member",member);
		
		if(member != null) {
			CartItems.setMem_id(member.getMem_id());
			
			List<CartItems> cartList = mapper.list(CartItems);
			model.addAttribute("cartList",cartList);
			
			int sum = 0;
			for(int i=0;i<cartList.size();i++) {
				sum += cartList.get(i).getIngre_price()*cartList.get(i).getIngre_cnt();				
			}			
			model.addAttribute("sum",sum);
		}
				
		return "shopping-cart";
	}
	
	//장바구니 목록 삭제
	@RequestMapping(value="/delete.do/{ingre_idx}/{mem_id}",method=RequestMethod.GET)
	public String deleteItem(@PathVariable("ingre_idx") int ingre_idx,@PathVariable("mem_id") String mem_id) {
		
		CartItems cartItems = new CartItems();
		cartItems.setMem_id(mem_id);
		cartItems.setIngre_idx(ingre_idx);
		
		int row = mapper.deleteItem(cartItems);
		
		if(row>0) {
			System.out.println("삭제성공");
			return "redirect:/cart";
		}else {
			System.out.println("삭제실패");
			return "redirect:/";
		}
	}
	
	//장바구니 목록 수정
	@RequestMapping(value="/updateCart.do",method=RequestMethod.GET)
	public String updateItem(@RequestParam("cartValues") int[] cartValues, @RequestParam("basketValues") int[] basketValues) {
		

		CartItems cartItems = new CartItems();

		for(int i=0; i<cartValues.length; i++) {
			cartItems.setIngre_cnt(cartValues[i]); //ingre_cnt
			cartItems.setBasket_idx(basketValues[i]); //basket_idx
			mapper.updateItem(cartItems);
		}						
		
		return "redirect:/cart";
	}
	
	//결제창 장바구니 목록 출력
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public String checkoutCartList(Model model,HttpSession session) {
				
		CartItems CartItems = new CartItems();
		Member member = (Member)session.getAttribute("member");
		model.addAttribute("member",member);
		
		if(member != null) {
			CartItems.setMem_id(member.getMem_id());
			
			List<CartItems> cartList = mapper.list(CartItems);
			model.addAttribute("cartList",cartList);
			
			int sum = 0;
			for (int i=0; i<cartList.size(); i++) {
				sum += cartList.get(i).getIngre_price() * cartList.get(i).getIngre_cnt();
			}
			model.addAttribute("sum", sum);
			member = mapper.checkoutInfo(member.getMem_id());
			model.addAttribute("member",member);
		}
						
		return "checkout";
	}
	
	//결제 완료 정보(주문번호,아이디,총액,주소)저장
	@RequestMapping(value="/checkoutSuccess",method=RequestMethod.GET)
	public void checkoutSuccess(@RequestParam("merchant_uid") String merchant_uid,
								@RequestParam("userAddr") String userAddr,
								@RequestParam("userSum") int userSum,HttpSession session) {
		
		CartItems CartItems = new CartItems();
		Member member = (Member)session.getAttribute("member");
		
		CartItems.setOrder_idx(Integer.parseInt(merchant_uid));
		CartItems.setMem_id(member.getMem_id());
		CartItems.setTotal_amount(userSum);
		CartItems.setOrder_addr(userAddr);
		
		mapper.checkoutSuccess(CartItems);
		
	}
	//주문 내역 출력
	@RequestMapping(value="/success/{merchant_uid}", method=RequestMethod.GET)
	public String success(@PathVariable("merchant_uid") int merchant_uid,Model model) {
		
		CartItems cartItems = mapper.orderInfo(merchant_uid);
		model.addAttribute("cartItems",cartItems);
					
		return "checkoutSuccess";
	}
	
}
