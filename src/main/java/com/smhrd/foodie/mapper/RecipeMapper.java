package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

@Mapper
public interface RecipeMapper {
	@Select("select * from recipe_info where recipe_cat = #{recipe_cat}")
	List<Recipe> select(String recipe_cat);

	@Select("select * from ingredient_info")
	List<Ingredient> ingredient();
}
