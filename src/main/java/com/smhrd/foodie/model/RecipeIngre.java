package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeIngre {
	private int recipe_ingre_idx;
	private int recipe_idx;
	private int ingre_idx;
}
