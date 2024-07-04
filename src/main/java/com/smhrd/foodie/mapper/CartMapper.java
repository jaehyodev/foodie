package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Cart;
import com.smhrd.foodie.model.Member;

public interface CartMapper {
   
   // 장바구니 목록 출력
   List<Cart> list(Cart cart);
   
   // 장바구니 목록 삭제
   int deleteItem(Cart cart);
   
   // 회원정보 불러오기
   @Select("SELECT mem_name, mem_phone, mem_email, mem_addr FROM member_info WHERE mem_id = #{mem_id}")
   Member checkoutInfo(String mem_id);
   
   // 장바구니 목록 수정
   int updateItem(Cart cart);
   
   // 장바구니 목록 저장
   int checkoutCart(Cart cart);   
   
   // 결제 완료 시 결제정보 저장
   int checkoutSuccess(Cart cart);
   
   // 결제 완료 창 정보 출력
   @Select("SELECT a.order_idx, a.order_addr, a.ordered_at, a.total_amount, b.mem_name, b.mem_phone "
         + "FROM order_info a,member_info b "
         + "WHERE a.mem_id = b.mem_id AND a.order_idx = #{order_idx}")
   Cart orderInfo(int order_idx);
   
   // 결제 완료 시 장바구니 삭제
   @Delete("DELETE FROM basket_info WHERE mem_id = #{mem_id}")
   int deleteCart(Cart cart);
   
   // 주문 취소 시 order_info 데이터베이스 삭제
   @Delete("DELETE FROM order_info WHERE order_idx = #{merchant_uid}")
   void deleteOrder(String merchant_uid);
   
   // 주문 취소 시 order_detail_info 데이터베이스 삭제
   @Delete("DELETE FROM order_detail_info WHERE order_idx = #{merchant_uid}")
   void deleteOrderDetail(String merchant_uid);
}