package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WishlistCart {
	
	private int wishlist_cart_idx; // 찜 식별자
	private String mem_id;		   // 회원 아이디
	private int recipe_ingre_idx;  // 레시피 또는 재료 식별자
	private int quantity;		   // 수량
	
}
