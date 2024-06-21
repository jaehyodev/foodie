package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.Recipe;

@Controller
public class IngredientController {
	
	@Autowired
	RecipeMapper mapper;
	
	@RequestMapping(value="/shopgrid/{ingre_cat}/{page}", method=RequestMethod.GET)
	public String ingreCat(@PathVariable("ingre_cat") String ingre_cat, @PathVariable("page") int page , Model model) {
		
		int total = mapper.ingreSize(ingre_cat); // 해당 카테고리 재료 목록 전체 개수
		int cntPerPage = 12; // 페이지당 글 갯수
		int endPage = (int) Math.ceil((double)total/(double)cntPerPage); // 끝페이지
		int start; // 재료 start 번호
		int end; // 재료 end 번호
		
		// 전체 항목 수, 마지막 페이지 번호
		model.addAttribute("total", total);
		model.addAttribute("endPage", endPage);
		
		// 재료 뽑아낼 start 번호, end 번호
		start = cntPerPage*(page-1)+1;
		if(page != endPage || total%cntPerPage==0) {
			end = cntPerPage*page;
		}
		else {
			end = cntPerPage*(page-1)+(total%12);
		}
		
		// 해당 페이지의 재료 목록
		Paging paging = new Paging(ingre_cat, start, end);
		
		List<Ingredient> ingrelist = mapper.ingreList(paging);
		model.addAttribute("ingrelist", ingrelist);
		
		
		return "shop-grid";
	}
	
	@RequestMapping(value="/shopdetail/{ingre_name}", method=RequestMethod.GET)
	public String ingreDetail(@PathVariable("ingre_name") String ingre_name, Model model) {

		// 재료 상세
		Ingredient ingredient = mapper.ingredient(ingre_name);
		model.addAttribute("ingredient", ingredient);
		
		// 재료 -> 관련 상품(4개)
		List<Ingredient> ingre4 = mapper.ingre4(ingre_name);
		model.addAttribute("ingre4", ingre4);
		
		
		return "shop-details";
	}
}
