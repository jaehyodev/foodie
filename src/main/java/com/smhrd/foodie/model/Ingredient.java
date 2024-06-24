package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ingredient {
	private int ingre_idx;
	private String ingre_name;
	private String ingre_cat;
	private String ingre_content;
	private int ingre_price;
	private String ingre_img;
	private String ingre_weight;
}
