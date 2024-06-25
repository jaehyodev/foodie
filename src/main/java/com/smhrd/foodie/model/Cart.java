package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int basket_idx;
	private String mem_id;
	private int ingre_idx;
	private int ingre_cnt;
}
