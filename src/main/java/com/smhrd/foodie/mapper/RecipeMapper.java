package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.Recipe;

@Mapper
public interface RecipeMapper {
 
	// 인기 레시피
	@Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 5")
  List<Recipe> findPopularRecipes();

	// 추천 레시피
	@Select("SELECT * FROM recipe_info ORDER BY RAND() LIMIT 5")
	List<Recipe> findRecommendedRecipes();

	// 새로운 레시피
  @Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 3")
  List<Recipe> findNewRecipes();
	
  // 레시피 목록
	@Select("select * from recipe_info where recipe_cat = #{recipe_cat}")
	List<Recipe> select(String recipe_cat);

	// 해당 레시피
	@Select("select * from recipe_info where recipe_name = #{recipe_name}")
	Recipe recipe(String recipe_name);

	// 레시피 -> 관련 재료
	List<Ingredient> recipeIngre(Recipe recipe);

	
	// 재료 목록
	List<Ingredient> ingreList(Paging paging);
	
	// 해당 카테고리 재료 목록 총 개수
	@Select("select count(*) from ingredient_info where ingre_cat = #{ingre_cat}")
	int ingreSize(String ingre_cat);

	// 해당 재료
	@Select("select * from ingredient_info where ingre_name = #{ingre_name}")
	Ingredient ingredient(String ingre_name);
	
	// 재료 -> 관련 상품
	@Select("select * from ingredient_info where ingre_cat = (select ingre_cat from ingredient_info where ingre_name = #{ingre_name}) and ingre_name != #{ingre_name} order by RAND() LIMIT 4")
	List<Ingredient> ingre4(String ingre_name);
}
