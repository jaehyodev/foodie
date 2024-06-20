package com.smhrd.foodie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.CartMapper;
import com.smhrd.foodie.model.CartItems;

//@RequestMapping("/cart/*")
@Controller
public class CartController {
	
	@Autowired
	CartMapper mapper;
	
	//장바구니 목록 출력 메서드
	@RequestMapping(value="/cart",method=RequestMethod.GET)
	public String cartList(Model model ) {
		
		CartItems cart = new CartItems();
		cart.setMem_id("seung");
		
		
		List<CartItems> cartList = mapper.list(cart);
		model.addAttribute("cartList",cartList);
		
		//System.out.println(cartList);
		//cartList.get(0).getIngre_price()
		
		return "shopping-cart";
	}
	//장바구니 목록 삭제
	@RequestMapping(value="/deleteItem/{ingre_idx}/{mem_id}",method=RequestMethod.GET)
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
	
	//결제창 장바구니 목록 출력
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public String checkoutCartList(Model model) {
				
		CartItems cart = new CartItems();
		cart.setMem_id("seung");
		
		List<CartItems> cartList = mapper.list(cart);
		model.addAttribute("cartList",cartList);
		
		int sum = 0;
		for (int i=0; i<cartList.size(); i++) {
			sum += cartList.get(i).getIngre_price() * cartList.get(i).getIngre_cnt();
		}
		model.addAttribute("sum", sum);
				
		return "checkout";
	}
	
}
