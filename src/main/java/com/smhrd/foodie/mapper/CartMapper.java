package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.CartItems;

public interface CartMapper {
	
	//장바구니 목록 출력
	List<CartItems> list(CartItems cartItems);
	
	//장바구니 목록 삭제
	int deleteItem(CartItems cartItems);
	

	
	
	
}
