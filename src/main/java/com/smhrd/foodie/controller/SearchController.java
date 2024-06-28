package com.smhrd.foodie.controller;

import com.smhrd.foodie.mapper.SearchMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class SearchController {
 
	@Autowired
    SearchMapper mapper;

    @GetMapping("/search/{keyword}")
    public String searchRecipes(@PathVariable("keyword") String keyword, Model model) {
    	
    	List<Recipe> recipeList = mapper.searchRecipes(keyword);
    	List<Ingredient> ingreList = mapper.searchIngredients(keyword);
    	
    	model.addAttribute("keyword", keyword);
    	model.addAttribute("recipeList", recipeList);
    	model.addAttribute("ingreList", ingreList);
    	
    	return "search";
    }
}

