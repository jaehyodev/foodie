package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
   
   private int ingre_idx; //재료 idx
   private String ingre_img; //재료 이미지
   private String ingre_name; //재료 이름
   private int ingre_price; //재료 가격
   private String mem_id; //member id
   private int ingre_cnt; //재료 수량
   private int basket_idx; //장바구니 idx
   
   private int total_amount; //주문 총액
   private String order_addr; //주문 주소
   private int order_idx; //주문 idx
   private String ordered_at; //주문 일시
   private String mem_name;
   private String mem_phone;
}