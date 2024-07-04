package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Paging {

	private String ingre_cat; // 재료 카테고리
	private int start; // 재료 start 번호
	private int end; // 재료 end 번호

}
