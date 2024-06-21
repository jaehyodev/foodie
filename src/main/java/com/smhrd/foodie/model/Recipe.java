package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recipe {
	   private int recipe_idx;
	   private String recipe_name;
	   private String recipe_cat;
	   private String recipe_content;
	   private int recipe_time;
	   private int recipe_portion;
	   private String recipe_all_ingre;
	   private String recipe_cook;
	   private String recipe_title_img;
	   private String recipe_posted_at;
	   private int recipe_views_cnt;
}
