package com.smhrd.foodie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Recipe;

@Controller
public class RecipeController {
	
	@Autowired
	RecipeMapper mapper;
	
	@RequestMapping(value="/recipe/{recipe_cat}", method=RequestMethod.GET)
	public String recipecat(@PathVariable("recipe_cat") String recipe_cat, Model model) {
		List<Recipe> recipeList = mapper.select(recipe_cat);
		model.addAttribute("recipeList", recipeList);
		
		return "recipe";
	}
	
}
