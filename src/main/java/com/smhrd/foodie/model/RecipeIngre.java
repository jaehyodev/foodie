package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeIngre {
	
	private int recipe_ingre_idx; // 레시피_재료 매핑 식별자
	private int recipe_idx;		  // 레시피 식별자
	private int ingre_idx;		  // 재료 식별자
	
}
