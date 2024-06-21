package com.smhrd.foodie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

@Controller
public class RecipeController {
	
	@Autowired
	RecipeMapper mapper;
  
	@RequestMapping(value="/recipe/{recipe_cat}", method=RequestMethod.GET)
	public String recipecat(@PathVariable("recipe_cat") String recipe_cat, Model model) {
		
		// 레시피 목록
		List<Recipe> recipeList = mapper.select(recipe_cat);
		model.addAttribute("recipeList", recipeList);
		
		return "recipe";
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value="/recipedetails/{recipe_name}", method=RequestMethod.GET)
	public String recipeDetail(@PathVariable("recipe_name") String recipe_name, Model model) {
		
		// 해당 레시피 불러오기
		Recipe recipe = mapper.recipe(recipe_name);
		model.addAttribute("recipe", recipe);
		
		// 레시피 조리법 \로 분리
		String[] recipecook = recipe.getRecipe_cook().split("\\|");
		model.addAttribute("recipecook", recipecook);

		// 레시피 설명 .또는!또는?로 분리
		String[] recipecontent = recipe.getRecipe_content().split("(?<=[.!?])");
		model.addAttribute("recipecontent", recipecontent);
		
		// 레시피 관련 재료
		List<Ingredient> recipe_ingre = mapper.recipeIngre(recipe);
		model.addAttribute("recipe_ingre", recipe_ingre);
		
		return "recipe-details";
	}
	
}
