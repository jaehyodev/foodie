package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Cart;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.RecipeAllergy;
import com.smhrd.foodie.model.Wishlist;

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

	
	// 레시피 - 찜 기능
	// 레시피가 찜 목록에 존재하는지 확인
	int checkRecipeWish(Wishlist wish);

	// 레시피 찜 추가하기
	void inRecipeWish(Wishlist wish);
	
	// 레시피 찜 삭제하기
	void delRecipeWish(Wishlist wish);
	
	// 재료 - 찜 기능
	// 재료가 찜 목록에 있는지 확인
	int checkIngreWish(Wishlist wish);
	
	// 재료 찜 추가하기
	void inIngreWish(Wishlist wish);
	
	// 재료 찜 삭제하기
	void delIngreWish(Wishlist wish);
	
	// 재료 - 장바구니 기능
	// 재료가 장바구니 목록에 있는지 확인
	int checkIngreCart(Wishlist cart);

	// 재료 장바구니에 담기 (재료 페이지에서 클릭 시, 기존 상품 업데이트)
	void updateIngreCart(Wishlist wish);
	
	// 재료 장바구니에 담기 (재료 페이지에서 클릭 시, 새 상품 업데이트)
	void inIngreCart(Wishlist cart);
	
	// 재료 장바구니에 담기 (재료 디테일 페이지에서 클릭 시, 기존 상품 업데이트)
	void updateDetailIngreCart(Wishlist cart);
	
	// 재료 장바구니에 담기 (재료 디테일 페이지에서 클릭 시, 새 상품 업데이트)
	void inDetailIngreCart(Wishlist cart);

	// 레시피 -> 관련 재료 (알러지 확인)
	List<Ingredient> memRecipeIngre(RecipeAllergy recipeAllergy);

}
