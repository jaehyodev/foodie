package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.RecipeAllergyDislike;
import com.smhrd.foodie.model.WishlistCart;

@Mapper
public interface RecipeIngreMapper {
	
	// ★★★ 레시피 관련 추상 메서드 ★★★
	// 메인 - 인기 레시피
	@Select("SELECT * FROM recipe_info ORDER BY recipe_views_cnt DESC LIMIT 5")
	List<Recipe> findPopularRecipes();

	// 메인 - 추천 레시피
	@Select("SELECT * FROM recipe_info ORDER BY RAND() LIMIT 5")
	List<Recipe> findRecommendedRecipes();

	// 메인 - 새로운 레시피
	@Select("SELECT recipe_idx, recipe_title_img, recipe_name, recipe_content, DATE(recipe_posted_at) as recipe_posted_at FROM recipe_info ORDER BY recipe_posted_at DESC LIMIT 3")
	List<Recipe> findNewRecipes();
	
	// 레시피 목록
	@Select("SELECT * FROM recipe_info WHERE recipe_cat = #{recipe_cat}")
	List<Recipe> select(String recipe_cat);

	// 레시피 디테일
	@Select("SELECT * FROM recipe_info WHERE recipe_idx = #{recipe_idx}")
	Recipe recipe(int recipe_idx);

	// 레시피 디테일 - 관련 재료
	List<Ingredient> recipeIngre(Recipe recipe);
	
	// 레시피 찜 확인
	int checkRecipeWish(WishlistCart wish);

	// 레시피 찜 추가
	void inRecipeWish(WishlistCart wish);
	
	// 레시피 찜 삭제
	void delRecipeWish(WishlistCart wish);	
	
	// 레시피 디테일 - 관련 재료의 알러지, 비선호 확인
	List<Ingredient> memRecipeIngre(RecipeAllergyDislike recipeAllergyDislike);
	
	// 레시피 디테일 - 조회수 증가
	@Update("UPDATE recipe_info SET recipe_views_cnt = #{recipe_views_cnt} WHERE recipe_idx = #{recipe_idx}")
	void increaseRecipeViewsCnt(Recipe recipe);	

	
	// ★★★ 재료 관련 추상 메서드 ★★★
	// 재료 목록 - 해당 카테고리의 재료 총 개수
	@Select("SELECT count(*) FROM ingredient_info WHERE ingre_cat = #{ingre_cat}")
	int ingreSize(String ingre_cat);

	// 재료 목록 - 페이징
	List<Ingredient> ingreList(Paging paging);
	

	// 재료 디테일
	@Select("SELECT * FROM ingredient_info WHERE ingre_idx = #{ingre_idx}")
	Ingredient ingredient(int ingre_idx);
	
	// 재료 디테일 - 동일 카테고리 내 관련 상품 4개
	@Select("SELECT * FROM ingredient_info WHERE ingre_cat = "
			+ "(SELECT ingre_cat FROM ingredient_info "
			+ "WHERE ingre_idx = #{ingre_idx}) AND ingre_idx != #{ingre_idx} "
			+ "ORDER BY RAND() LIMIT 4")
	List<Ingredient> ingre4(int ingre_idx);
	
	// 재료 찜 확인
	int checkIngreWish(WishlistCart wish);
	
	// 재료 찜 추가
	void inIngreWish(WishlistCart wish);
	
	// 재료 찜 삭제
	void delIngreWish(WishlistCart wish);
	
	// 장바구니 목록 확인
	int checkIngreCart(WishlistCart cart);

	// 재료 목록 - 장바구니 담기, 기존 수량 업데이트 (+1)
	void updateIngreCart(WishlistCart wish);
	
	// 재료 목록 - 장바구니 담기, 새롭게 추가 (+1)
	void inIngreCart(WishlistCart cart);
	
	// 재료 디테일 - 장바구니 담기, 기존 수량 업데이트 (+사용자가 정한 수량)
	void updateDetailIngreCart(WishlistCart cart);
	
	// 재료 디테일 - 장바구니 담기, 새롭게 추가 (+사용자가 정한 수량)
	void inDetailIngreCart(WishlistCart cart);

}
