package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
   
   private int ingre_idx; 			// 재료 index
   private int ingre_cnt; 			// 재료 수량
   private int ingre_price; 		// 재료 가격
   private int basket_idx; 			// 장바구니 index
   private String ingre_img; 		// 재료 이미지
   private String ingre_name; 		// 재료 이름
   private String mem_id; 			// member 아이디
   private String ingre_status; 	// 알레르기, 비선호 상태
   
   private int total_amount; 		// 주문 총액
   private int order_idx; 			// 주문 index
   private int order_cnt; 			// 주문 수량
   private String order_addr; 		// 주문 주소
   private String ordered_at; 		// 주문 일시
   private String mem_name; 		// member 이름
   private String mem_phone; 		// member 연락처
  
   
<<<<<<< HEAD
=======
   private String ingre_status; // 알러지, 비선호 상태
   
>>>>>>> b13f62760700612d81af755a95dd7eb9224904a4
}