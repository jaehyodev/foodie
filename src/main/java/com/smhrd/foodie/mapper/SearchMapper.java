package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

@Mapper
public interface SearchMapper {
	
	// 레시피 검색 쿼리
	@Select("SELECT * FROM recipe_info WHERE recipe_all_ingre LIKE CONCAT('%', #{keyword}, '%') OR recipe_name LIKE CONCAT('%', #{keyword}, '%')")
	List<Recipe> searchRecipes(String keyword);

	// 재료 검색 쿼리
	@Select("SELECT * FROM ingredient_info WHERE ingre_name LIKE CONCAT('%' , #{keyword}, '%')")
	List<Ingredient> searchIngredients(String keyword);
	
}
