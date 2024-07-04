package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recipe {
	
	private int recipe_idx;			// 레시피 식별자
	private String recipe_name;		// 레시피 이름
	private String recipe_cat;		// 레시피 카테고리
	private String recipe_content;	// 레시피 설명
	private int recipe_time;			// 레시피 시간
	private int recipe_portion;		// 레시피 인분
	private String recipe_all_ingre; // 레시피 전체 재료
	private String recipe_cook;		// 레시피 조리법
	private String recipe_title_img;	// 레시피 대표 사진
	private String recipe_posted_at; // 레시피 업로드 시간
	private int recipe_views_cnt;	// 레시피 조회수
	   
	public void addViewCount() {
		
		System.out.println("조회수 증가");
		
		this.recipe_views_cnt++;
		
	}
	
}
