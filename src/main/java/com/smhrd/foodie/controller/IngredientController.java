package com.smhrd.foodie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

@Controller
public class IngredientController {
	
	@Autowired
	RecipeMapper mapper;
	
	@RequestMapping(value="/ingredient", method=RequestMethod.GET)
	public String ingredientCat() {
		List<Ingredient> list = mapper.ingredient();
		System.out.println(list.get(0).getIngre_name());
		return "shop-grid";
	}	
}
