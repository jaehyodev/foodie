package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.CartItems;
import com.smhrd.foodie.model.Member;

public interface CartMapper {
	
	//장바구니 목록 출력
	List<CartItems> list(CartItems cartItems);
	
	//장바구니 목록 삭제
	int deleteItem(CartItems cartItems);
	
	//회원정보 불러오기
	@Select("select mem_name,mem_phone,mem_email,mem_addr from member_info where mem_id = #{mem_id}")
	Member checkoutInfo(String mem_id);
	
	//장바구니 목록 수정
	int updateItem(CartItems cartItems);
	
	//결제완료 시 결제정보 저장
	int checkoutSuccess(CartItems cartItems);
	
	//결제완료 창 정보 출력
	@Select("select a.order_idx,a.order_addr,a.ordered_at,a.total_amount,b.mem_name,b.mem_phone "
			+ "from order_info a,member_info b "
			+ "where a.mem_id =b.mem_id and a.order_idx = #{order_idx}")
	CartItems orderInfo(int order_idx);
	
	//결제 완료 시 장바구니 삭제
	@Delete("delete from basket_info where mem_id = #{mem_id}")
	int deleteCart(CartItems cartItems);
}
