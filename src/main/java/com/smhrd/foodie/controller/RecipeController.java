package com.smhrd.foodie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;
// import com.smhrd.foodie.model.RecipeAllergy;
import com.smhrd.foodie.model.Wishlist;

@Controller
public class RecipeController {
	
	@Autowired
	RecipeMapper mapper;
  
	// 레시피 페이지 로드
	@RequestMapping(value="/recipe/{recipe_cat}", method=RequestMethod.GET)
	public String recipecat(@PathVariable("recipe_cat") String recipe_cat, Model model, HttpSession session) {
		
		// 레시피 목록
		List<Recipe> recipeList = mapper.select(recipe_cat);
		model.addAttribute("recipeList", recipeList);
		
		Member member = (Member)session.getAttribute("Member");
		System.out.println(member);
		
		return "recipe";
	}
	
	// 레시피, 레시피디테일 -> 찜
	@RequestMapping(value={"/recipe/wishRecipe", "/recipedetails/wishRecipe"}, method=RequestMethod.GET)
	public @ResponseBody String recipeWish(@RequestParam("recipe_idx") int recipe_idx, HttpSession session) {
		Member member = (Member)session.getAttribute("Member");
		if(member == null)
			return "notLogin";
		else {
			Wishlist wish = new Wishlist();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			if(mapper.checkRecipeWish(wish) != null)
				return "inWish";
			else {
				mapper.inRecipeWish(wish);
				return "success";
			}
		}
		
	}
	
	// 레시피 디테일 페이지 로드
	@RequestMapping(value="/recipedetails/{recipe_name}", method=RequestMethod.GET)
	public String recipeDetail(@PathVariable("recipe_name") String recipe_name, Model model, HttpSession session) {
		
		Member member = (Member)session.getAttribute("Member");
		// model.addAttribute("member", member);
		
		// 해당 레시피 불러오기
		Recipe recipe = mapper.recipe(recipe_name);
		model.addAttribute("recipe", recipe);
		
		// 레시피 조리법 \로 분리
		String[] recipecook = recipe.getRecipe_cook().split("\\|");
		model.addAttribute("recipecook", recipecook);

		// 레시피 설명 .또는!또는?로 분리
		String[] recipecontent = recipe.getRecipe_content().split("(?<=[.!?])");
		model.addAttribute("recipecontent", recipecontent);
		
		List<Ingredient> recipe_ingre = null;
		
		if(member != null) {
			// 레시피 관련 재료 (회원)
			// RecipeAllergy recipeAllergy = new RecipeAllergy(member.getMem_id(), recipe_name);
			// recipe_ingre = mapper.memRecipeIngre(recipeAllergy);
		}else {
			// 레시피 관련 재료 (비회원)
			recipe_ingre = mapper.recipeIngre(recipe);
		}
		model.addAttribute("recipe_ingre", recipe_ingre);
		
		return "recipe-details";
	}
	
	// 레시피디테일 -> 관련 재료 한번에 장바구니
	@RequestMapping(value="/recipedetails/allCart", method=RequestMethod.GET)
	public @ResponseBody String recipeIngre(@RequestParam("checkedItems") List<Integer> checkedItems, HttpSession session) {
		Member member = (Member)session.getAttribute("Member");
		for(int i=0; i<checkedItems.size(); i++) {
			System.out.println(checkedItems.get(i));
		}
		if(member == null)
			return "notLogin";
		else {
			for(int item : checkedItems) {
				System.out.println(item);
				Wishlist wish = new Wishlist();
				wish.setRecipe_ingre_idx(item);
				wish.setMem_id(member.getMem_id());
				if(mapper.checkIngreCart(wish) == null)
					mapper.inIngreCart(wish);
			}
			return "success";
		}
		
	}	
	
}
