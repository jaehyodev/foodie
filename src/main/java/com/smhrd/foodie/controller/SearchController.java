package com.smhrd.foodie.controller;

import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.mapper.SearchMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.Wishlist;

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
    SearchMapper mapper;
		
		@Autowired
		RecipeMapper recipeMapper;

    @GetMapping("/search/{keyword}")
    public String searchRecipes(@PathVariable("keyword") String keyword, Model model, HttpSession session) {
    	
    	List<Recipe> recipeList = mapper.searchRecipes(keyword);
    	List<Ingredient> ingreList = mapper.searchIngredients(keyword);
    	
    	model.addAttribute("keyword", keyword);
    	model.addAttribute("recipeList", recipeList);
    	model.addAttribute("ingreList", ingreList);
    	
    	Member member = (Member)session.getAttribute("member");
  		model.addAttribute("member", member);
    	
    	List<Integer> row = new ArrayList<Integer>();
  		if(member != null) {
  			// 찜되어 있는지 안되어 있는지 확인
  			for(int i=0; i<recipeList.size(); i++) {
  				Wishlist wish = new Wishlist();
  				wish.setRecipe_ingre_idx(recipeList.get(i).getRecipe_idx());
  				wish.setMem_id(member.getMem_id());
  				row.add(recipeMapper.checkRecipeWish(wish));
  			}
  		}
  		
  		model.addAttribute("wishlist", row);
    	
    	return "search";
    }
    
    // 검색해서 나온 레시피 찜
  	@RequestMapping(value="/search/wishRecipe", method=RequestMethod.GET)
  	public @ResponseBody String recipeWish(@RequestParam("recipe_idx") int recipe_idx, HttpSession session) {
  		Member member = (Member)session.getAttribute("member");
  		if(member == null)
  			return "notLogin";
  		else {
  			Wishlist wish = new Wishlist();
  			wish.setRecipe_ingre_idx(recipe_idx);
  			wish.setMem_id(member.getMem_id());
  			int row = recipeMapper.checkRecipeWish(wish);
  			if(row > 0) {
  				// 찜 목록에서 삭제
  				recipeMapper.delRecipeWish(wish);
  				return "inWish";
  			}else {
  				// 찜 목록에 추가
  				recipeMapper.inRecipeWish(wish);
  				return "success";
  			}
  		}
  	}
  	
  	// 검색해서 나온 재료 찜
  	@RequestMapping(value="search/wishIngre", method=RequestMethod.GET)
  	public @ResponseBody String ingreWish(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
  		Member member = (Member)session.getAttribute("member");
  		System.out.println(ingre_idx);
  		if(member == null)
  			return "notLogin";
  		else {
  			Wishlist wish = new Wishlist();
  			wish.setRecipe_ingre_idx(ingre_idx);
  			wish.setMem_id(member.getMem_id());
  			int row = recipeMapper.checkIngreWish(wish);
  			if(row > 0) {
  				// 찜 목록에서 삭제
  				recipeMapper.delIngreWish(wish);
  				return "inWish";
  			}
  			else {
  				// 찜 목록에 추가
  				recipeMapper.inIngreWish(wish);
  				return "success";
  			}
  		}
  	}
  	
  	// 검색해서 나온 재료 카트
  	@RequestMapping(value="/search/cart", method=RequestMethod.GET)
  	public @ResponseBody String ingreCart(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
  		Member member = (Member)session.getAttribute("member");
  		if(member == null)
  			return "notLogin";
  		else {
  			Wishlist cart = new Wishlist();
  			cart.setRecipe_ingre_idx(ingre_idx);
  			cart.setMem_id(member.getMem_id());
  			int row = recipeMapper.checkIngreCart(cart);
  			if(row > 0)
  				recipeMapper.updateIngreCart(cart);
  			else
  				recipeMapper.inIngreCart(cart);
  			return "success";
  		}
  	}
}

