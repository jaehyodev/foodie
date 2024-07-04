package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ingredient {

	private int ingre_idx; // 재료 식별자
	private String ingre_name; // 재료 이름
	private String ingre_cat; // 재료 카테고리
	private String ingre_content; // 재료 설명
	private int ingre_price; // 재료 가격
	private String ingre_img; // 재료 이미지
	private String ingre_weight; // 재료 용량

}
