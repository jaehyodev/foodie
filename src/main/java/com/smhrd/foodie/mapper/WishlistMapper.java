package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

public interface WishlistMapper {
	
	// 레시피 찜 목록
	@Select("SELECT ri.recipe_idx, recipe_title_img, recipe_name, recipe_content FROM recipe_info ri"
			+ " JOIN recipe_wishlist_info rwi ON ri.recipe_idx = rwi.recipe_idx WHERE rwi.mem_id = #{mem_id}")
  List<Recipe> recipeWishlist(String mem_id);
	
	// 재료 찜 목록
	@Select("SELECT ii.ingre_idx, ingre_img, ingre_name, ingre_content FROM ingredient_info ii"
			+ " JOIN ingre_wishlist_info iwi ON ii.ingre_idx = iwi.ingre_idx WHERE iwi.mem_id = #{mem_id}")
	List<Ingredient> ingreWishlist(String mem_id);

	// 레시피 찜 목록 삭제
	@Delete("DELETE FROM recipe_wishlist_info WHERE mem_id = #{mem_id} AND recipe_idx = #{recipe_idx}")
	int deleteRecipe(@Param("mem_id") String mem_id, @Param("recipe_idx") int recipe_idx);

	// 재료 찜 목록 삭제
	@Delete("DELETE FROM ingre_wishlist_info WHERE mem_id = #{mem_id} AND ingre_idx = #{ingre_idx}")
	int deleteIngre(@Param("mem_id") String mem_id, @Param("ingre_idx") int ingre_idx);
}
