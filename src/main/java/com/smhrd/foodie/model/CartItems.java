package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class CartItems {
	
	private int ingre_idx;
	private String ingre_img;
	private String ingre_name;
	private int ingre_price;
	private String mem_id;
	private int ingre_cnt;
	private int basket_idx;
	private int total_amount;
	private String order_addr;
	private int order_idx;
	
}
