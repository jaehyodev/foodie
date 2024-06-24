package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Wishlist {
	private int wishlist_idx;
	private String mem_id;
	private int recipe_ingre_idx;
	private int quantity;
}
