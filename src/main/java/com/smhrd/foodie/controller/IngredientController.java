package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.Wishlist;

@Controller
public class IngredientController {
	
	@Autowired
	RecipeMapper mapper;
	
	// shop-grid 페이지 로드
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
	
	// shop-grid & shop detail & Recipe detail 각 재료 -> 찜
	@RequestMapping(value={"/shopgrid/{page}/wishIngre", "/shopdetail/wishIngre", "recipedetails/wishIngre"}, method=RequestMethod.GET)
	public @ResponseBody String recipeWish(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		Member member = (Member)session.getAttribute("Member");
		System.out.println(ingre_idx);
		if(member == null)
			return "notLogin";
		else {
			Wishlist wish = new Wishlist();
			wish.setRecipe_ingre_idx(ingre_idx);
			wish.setMem_id(member.getMem_id());
			if(mapper.checkIngreWish(wish) != null)
				return "inWish";
			else {
				mapper.inIngreWish(wish);
				return "success";
			}
		}
	}
	
	// shop-grid & Recipe Detail 각 재료 & shop detail 관련 재료 -> 카트
	@RequestMapping(value={"/shopgrid/{ingre_cat}/cart", "/recipedetails/cart", "/shopdetail/cart"}, method=RequestMethod.GET)
	public @ResponseBody String ingreCart(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		Member member = (Member)session.getAttribute("Member");
		if(member == null)
			return "notLogin";
		else {
			Wishlist cart = new Wishlist();
			cart.setRecipe_ingre_idx(ingre_idx);
			cart.setMem_id(member.getMem_id());
			if(mapper.checkIngreCart(cart) != null)
				return "inCart";

			else {
				mapper.inIngreCart(cart);
				return "success";
			}
		}
	}
	
	// shop-grid -> 카트
	@RequestMapping(value="/shopdetail/currentCart", method=RequestMethod.GET)
	public @ResponseBody String ingreDetailCart(@RequestParam("ingre_idx") int ingre_idx, @RequestParam("quantity") int quantity, HttpSession session) {
		Member member = (Member)session.getAttribute("Member");
		System.out.println(quantity);
		if(member == null)
			return "notLogin";
		else {
			Wishlist cart = new Wishlist();
			cart.setRecipe_ingre_idx(ingre_idx);
			cart.setMem_id(member.getMem_id());
			cart.setQuantity(quantity);
			if(mapper.checkIngreCart(cart) != null)
				return "inCart";
				else {
				mapper.inDetailIngreCart(cart);
				return "success";
			}
		}
	}
	
	// shop detail 페이지 로드
	@RequestMapping(value="/shopdetail/{ingre_name}", method=RequestMethod.GET)
	public String ingreDetail(@PathVariable("ingre_name") String ingre_name, Model model) {

		// 재료 상세
		Ingredient ingredient = mapper.ingredient(ingre_name);
		model.addAttribute("ingredient", ingredient);
		
		// 재료 설명 .또는!또는?로 분리
		String[] ingrecontent = ingredient.getIngre_content().split("(?<=[.!?])");
		model.addAttribute("ingrecontent", ingrecontent);
		
		// 재료 -> 관련 상품(4개)
		List<Ingredient> ingre4 = mapper.ingre4(ingre_name);
		model.addAttribute("ingre4", ingre4);
		
		return "shop-details";
	}
}
