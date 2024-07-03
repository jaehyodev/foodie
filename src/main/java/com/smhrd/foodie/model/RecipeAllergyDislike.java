package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeAllergyDislike {
	
	private String mem_id;		// 회원 아이디
	private String recipe_name; // 레시피 이름
	
}
