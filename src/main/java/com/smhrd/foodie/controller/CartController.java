package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.foodie.mapper.CartMapper;
import com.smhrd.foodie.model.Cart;
import com.smhrd.foodie.model.Member;

@Controller
public class CartController {
   
   @Autowired
   CartMapper mapper;
   
   //장바구니 목록 출력 메서드
   @RequestMapping(value="/cart",method=RequestMethod.GET)
   public String cartList(Model model,HttpSession session ) {
      
      Cart cart = new Cart();
      Member member = (Member)session.getAttribute("member");
      model.addAttribute("member",member);
      
      if(member != null) {
         cart.setMem_id(member.getMem_id());
         
         List<Cart> cartList = mapper.list(cart);
         model.addAttribute("cartList",cartList);
         
         int sum = 0; // 상품 총액
         for(int i=0;i<cartList.size();i++) {
            sum += cartList.get(i).getIngre_price()*cartList.get(i).getIngre_cnt();
         }         
         model.addAttribute("sum",sum);
      }
            
      return "shopping-cart";
   }
   
   //장바구니 목록 삭제
   @RequestMapping(value="/deleteSelectedItems.do", method=RequestMethod.GET)
   public @ResponseBody String deleteSelectedItems(@RequestParam(value="ingreIdxs") List<Integer> ingreIdxs,
                                                   @RequestParam(value="memIds") List<String> memIds) {
       
       for (int i = 0; i < ingreIdxs.size(); i++) {
           int ingre_idx = ingreIdxs.get(i);
           String mem_id = memIds.get(i);
           
           Cart cart = new Cart();
           cart.setMem_id(mem_id);
           cart.setIngre_idx(ingre_idx);
           
           mapper.deleteItem(cart);
       }

       return "success";
   }
   
   //장바구니 목록 수정
   @RequestMapping(value="/updateCart.do",method=RequestMethod.GET)
   public ResponseEntity<String> updateItem(@RequestParam("cartValues") int[] cartValues, @RequestParam("basketValues") int[] basketValues) {      

      Cart cart = new Cart();

      for(int i=0; i<cartValues.length; i++) {
         cart.setIngre_cnt(cartValues[i]); //ingre_cnt
         cart.setBasket_idx(basketValues[i]); //basket_idx
         mapper.updateItem(cart);
      }                  
      
      return ResponseEntity.ok().body("{}");
   }
   
   //결제창 장바구니 목록 출력
   @RequestMapping(value="/checkout",method=RequestMethod.GET)
   public String checkoutCartList(Model model,HttpSession session) {
            
      Cart cart = new Cart();
      Member member = (Member)session.getAttribute("member");
      model.addAttribute("member",member);
      
      if(member != null) {
         cart.setMem_id(member.getMem_id());
         
         List<Cart> cartList = mapper.list(cart);
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
   @RequestMapping(value="/checkoutSuccess.do",method=RequestMethod.GET)
   public void checkoutSuccess(@RequestParam("merchant_uid") String merchant_uid,
                        @RequestParam("userAddr") String userAddr,
                        @RequestParam("userSum") int userSum,HttpSession session) {
      
      Cart cart = new Cart();
      Member member = (Member)session.getAttribute("member");
      
      cart.setOrder_idx(Integer.parseInt(merchant_uid));
      cart.setMem_id(member.getMem_id());
      cart.setTotal_amount(userSum);
      cart.setOrder_addr(userAddr);
      
      mapper.checkoutSuccess(cart);
      
   }
   
   //주문 내역 출력
   @RequestMapping(value="/success/{merchant_uid}", method=RequestMethod.GET)
   public String success(@PathVariable("merchant_uid") int merchant_uid,Model model) {
      
      Cart cart = mapper.orderInfo(merchant_uid);
      model.addAttribute("cart",cart);
               
      return "checkoutSuccess";
   }
   
   //장바구니 삭제
   @RequestMapping(value="/deleteCart.do", method = RequestMethod.GET)
   public String deleteCart(HttpSession session) {
      
      Cart cart = new Cart();
      Member member = (Member)session.getAttribute("member");
      
      cart.setMem_id(member.getMem_id());
      System.out.println(member.getMem_name());
      mapper.deleteCart(cart);
      
      return "redirect:/mypage";
   }
   
}