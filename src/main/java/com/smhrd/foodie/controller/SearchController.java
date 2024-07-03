package com.smhrd.foodie.controller;

import com.smhrd.foodie.mapper.RecipeIngreMapper;
import com.smhrd.foodie.mapper.SearchMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.WishlistCart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class SearchController {

	@Autowired
	SearchMapper mapper; // SearchMapper 의존성 주입

	@Autowired
	RecipeIngreMapper recipeMapper; // RecipeMapper 의존성 주입

	@GetMapping("/search/{keyword}")
	public String searchRecipes(@PathVariable("keyword") String keyword, Model model, HttpSession session) {

		// 검색 결과 가져오기
		List<Recipe> recipeList = mapper.searchRecipes(keyword); // 레시피 검색 결과
		List<Ingredient> ingreList = mapper.searchIngredients(keyword); // 재료 검색 결과

		// 모델에 결과 추가
		model.addAttribute("keyword", keyword); // 검색 키워드
		model.addAttribute("recipeList", recipeList); // 레시피 리스트
		model.addAttribute("ingreList", ingreList); // 재료 리스트

		// 세션에서 회원 정보 가져오기
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);

		List<Integer> row = new ArrayList<Integer>();

		// 회원이 로그인한 상태일 경우
		if (member != null) {
			// 찜되어 있는지 안되어 있는지 확인
			for (int i = 0; i < recipeList.size(); i++) {
				WishlistCart wish = new WishlistCart();
				wish.setRecipe_ingre_idx(recipeList.get(i).getRecipe_idx());
				wish.setMem_id(member.getMem_id());
				row.add(recipeMapper.checkRecipeWish(wish)); // 찜 여부 확인 결과 리스트에 추가
			}
		}

		model.addAttribute("wishlist", row); // 찜 여부 리스트 추가

		return "search"; // 검색 결과 화면으로 이동
	}

	// 검색 페이지에서 레시피를 찜하는 메서드
	@RequestMapping(value = "/search/wish-recipe", method = RequestMethod.GET)
	public @ResponseBody String recipeWish(@RequestParam("recipe_idx") int recipe_idx, HttpSession session) {
		Member member = (Member) session.getAttribute("member"); // 세션에서 회원 정보 가져오기
		if (member == null)
			return "notLogin"; // 로그인 되어 있지 않으면 "notLogin" 반환
		else {
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			int row = recipeMapper.checkRecipeWish(wish); // 레시피 찜 여부 확인
			if (row > 0) {
				// 찜 목록에서 삭제
				recipeMapper.delRecipeWish(wish);
				return "inWish";
			} else {
				// 찜 목록에 추가
				recipeMapper.inRecipeWish(wish);
				return "success";
			}
		}
	}

	// 검색 페이지에서 재료를 찜하는 메서드
	@RequestMapping(value = "search/wish-ingre", method = RequestMethod.GET)
	public @ResponseBody String ingreWish(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		Member member = (Member) session.getAttribute("member"); // 세션에서 회원 정보 가져오기
		System.out.println(ingre_idx);
		if (member == null)
			return "notLogin";
		else {
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(ingre_idx);
			wish.setMem_id(member.getMem_id());
			int row = recipeMapper.checkIngreWish(wish); // 로그인 되어 있지 않으면 "notLogin" 반환
			if (row > 0) {
				// 찜 목록에서 삭제
				recipeMapper.delIngreWish(wish);
				return "inWish";
			} else {
				// 찜 목록에 추가
				recipeMapper.inIngreWish(wish);
				return "success";
			}
		}
	}

	// 검색 페이지에서 재료를 장바구니에 추가하는 메서드
	@RequestMapping(value = "/search/cart", method = RequestMethod.GET)
	public @ResponseBody String ingreCart(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		Member member = (Member) session.getAttribute("member"); // 세션에서 회원 정보 가져오기
		if (member == null)
			return "notLogin"; // 로그인 되어 있지 않으면 "notLogin" 반환
		else {
			WishlistCart cart = new WishlistCart();
			cart.setRecipe_ingre_idx(ingre_idx);
			cart.setMem_id(member.getMem_id());
			int row = recipeMapper.checkIngreCart(cart); // 장바구니에 담긴 재료인지 확인
			if (row > 0)
				recipeMapper.updateIngreCart(cart); // 이미 담겨있으면 수량 업데이트
			else
				recipeMapper.inIngreCart(cart); // 담겨있지 않으면 장바구니에 추가
			return "success";
		}
	}
}
