package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.foodie.mapper.WishlistMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;

@Controller
public class WishlistController {

	@Autowired
	WishlistMapper mapper;
	
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String recipeWishlist(Model model, HttpSession session) {

		// 세션에서 로그인 중인 멤버 가져오기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			// 예외 처리 - 로그인되지 않은 경우
			// throw new IllegalStateException("로그인되지 않은 사용자입니다.");
			return "login";
		}
		String mem_id = member.getMem_id();

		List<Recipe> recipeWishlist = mapper.recipeWishlist(mem_id);
		List<Ingredient> ingreWishlist = mapper.ingreWishlist(mem_id);
		model.addAttribute("recipeWishlist", recipeWishlist);
		model.addAttribute("ingreWishlist", ingreWishlist);

		return "wishlist";
	}

	// 레시피 찜 목록 개별 삭제
	@RequestMapping(value = "/wishlist/recipe/delete.do", method = RequestMethod.POST)
	public @ResponseBody String deleteRecipe(HttpSession session, @RequestParam("recipe_idx") int recipe_idx) {

		// 세션에서 로그인 중인 멤버 가져오기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			// 예외 처리 - 로그인되지 않은 경우
			throw new IllegalStateException("로그인되지 않은 사용자입니다.");
		}
		String mem_id = member.getMem_id();

		int row = mapper.deleteRecipe(mem_id, recipe_idx);

		if (row > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 레시피 찜 목록 선택된 항목들 삭제
	@RequestMapping(value = "/wishlist/recipe/delete-selected.do", method = RequestMethod.POST)
	public @ResponseBody String deleteSelectedRecipes(HttpSession session, @RequestBody List<Integer> recipeIdxArray) {

		// 세션에서 로그인 중인 멤버 가져오기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			// 예외 처리 - 로그인되지 않은 경우
			throw new IllegalStateException("로그인되지 않은 사용자입니다.");
		}
		String mem_id = member.getMem_id();

		System.out.println(recipeIdxArray);

		int rowsDeleted = 0;

		for (int recipe_idx : recipeIdxArray) {
			rowsDeleted += mapper.deleteRecipe(mem_id, recipe_idx);
		}

		System.out.println("삭제된 레시피 찜 목록 항목 개수 : " + rowsDeleted);

		if (rowsDeleted == recipeIdxArray.size()) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 재료 찜 목록 개별 삭제
	@RequestMapping(value = "/wishlist/ingre/delete.do", method = RequestMethod.POST)
	public @ResponseBody String deleteIngre(HttpSession session, @RequestParam("ingre_idx") int ingre_idx) {

		// 세션에서 로그인 중인 멤버 가져오기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			// 예외 처리 - 로그인되지 않은 경우
			throw new IllegalStateException("로그인되지 않은 사용자입니다.");
		}
		String mem_id = member.getMem_id();

		int row = mapper.deleteIngre(mem_id, ingre_idx);

		if (row > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 재료 찜 목록 선택된 항목들 삭제
	@RequestMapping(value = "/wishlist/ingre/delete-selected.do", method = RequestMethod.POST)
	public @ResponseBody String deleteSelectedIngres(HttpSession session, @RequestBody List<Integer> ingreIdxArray) {

		// 세션에서 로그인 중인 멤버 가져오기
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			// 예외 처리 - 로그인되지 않은 경우
			throw new IllegalStateException("로그인되지 않은 사용자입니다.");
		}
		String mem_id = member.getMem_id();

		System.out.println(ingreIdxArray);

		int rowsDeleted = 0;

		for (int ingre_idx : ingreIdxArray) {
			rowsDeleted += mapper.deleteIngre(mem_id, ingre_idx);
		}

		System.out.println("삭제된 재료 찜 목록 항목 개수 : " + rowsDeleted);

		if (rowsDeleted == ingreIdxArray.size()) {
			return "success";
		} else {
			return "fail";
		}
	}

}
