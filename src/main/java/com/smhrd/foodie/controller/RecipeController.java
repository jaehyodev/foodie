package com.smhrd.foodie.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.foodie.mapper.RecipeIngreMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.RecipeAllergyDislike;
import com.smhrd.foodie.model.WishlistCart;

@Controller
public class RecipeController {

	@Autowired
	RecipeIngreMapper mapper;

	// 레시피 목록 페이지 로드
	@RequestMapping(value = "/recipe-grid/{recipe_cat}", method = RequestMethod.GET)
	public String recipecat(@PathVariable("recipe_cat") String recipe_cat, Model model, HttpSession session) {

		// 레시피 목록
		List<Recipe> recipeList = mapper.select(recipe_cat);
		model.addAttribute("recipeList", recipeList);

		// 로그인 확인
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);

		// 찜 목록
		List<Integer> row = new ArrayList<Integer>();
		if (member != null) {
			// 찜되어 있는지 확인
			for (int i = 0; i < recipeList.size(); i++) {
				WishlistCart wish = new WishlistCart();
				wish.setRecipe_ingre_idx(recipeList.get(i).getRecipe_idx());
				wish.setMem_id(member.getMem_id());
				
				row.add(mapper.checkRecipeWish(wish));
			}
		}

		model.addAttribute("wishlist", row);
		
		return "recipe-grid";
	}

	// 레시피 목록, 레시피 디테일 -> 찜
	@RequestMapping(value = { "/recipe-grid/wish-recipe.do", "/recipe-detail/wish-recipe.do" }, method = RequestMethod.GET)
	public @ResponseBody String recipeWish(@RequestParam("recipe_idx") int recipe_idx, HttpSession session) {
		
		// 로그인 확인
		Member member = (Member) session.getAttribute("member");
		
		if (member == null)
			return "notLogin";
		else {
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			
			int row = mapper.checkRecipeWish(wish);
			if (row > 0) {
				// 찜 목록에서 삭제
				mapper.delRecipeWish(wish);
				return "delWish";
			} else {
				// 찜 목록에 추가
				mapper.inRecipeWish(wish);
				return "inWish";
			}
		}
	}

	// 레시피 디테일 페이지 로드
	@RequestMapping(value = "/recipe-detail/{recipe_idx}", method = RequestMethod.GET)
	public String recipeDetail(@PathVariable("recipe_idx") int recipe_idx, Model model, HttpSession session,
							   HttpServletRequest request, HttpServletResponse response) {
		
		// 해당 레시피 불러오기
		Recipe recipe = mapper.recipe(recipe_idx);
		model.addAttribute("recipe", recipe);

		// 쿠키 검증 및 조회수 증가 여부 확인
		boolean isNewVisit = viewCountValidation(recipe, request, response);

	    if (isNewVisit) {
	        // 조회수 증가
	    	recipe.addViewCount();
	        mapper.increaseRecipeViewsCnt(recipe);
	        System.out.println("레시피 디테일 페이지 접속: 새로운 방문자이므로 db 조회수 증가");
	    }

		// 레시피 조리법 \로 분리
		String[] recipecook = recipe.getRecipe_cook().split("\\|");
		model.addAttribute("recipecook", recipecook);

		// 레시피 설명 .또는!또는?로 분리
		String[] recipecontent = recipe.getRecipe_content().split("(?<=[.!?])");
		model.addAttribute("recipecontent", recipecontent);

		List<Ingredient> recipe_ingre = null;
		
		// 로그인 확인
		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);		

		if (member != null) {
			// 해당 회원의 레시피 관련 재료의 알러지, 비선호 필터링
			RecipeAllergyDislike recipeAllergyDislike = new RecipeAllergyDislike(member.getMem_id(), recipe.getRecipe_name());
			recipe_ingre = mapper.memRecipeIngre(recipeAllergyDislike);
			
			// 해당 레시피의 관련 재료가 찜되어 있는지 확인
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			
			int row = mapper.checkRecipeWish(wish);
			model.addAttribute("wish", row);
		} else {
			// 레시피 관련 재료 (비회원)
			recipe_ingre = mapper.recipeIngre(recipe);
		}
		model.addAttribute("recipe_ingre", recipe_ingre);
		
		List<Integer> row = new ArrayList<Integer>();
		if(member != null) {
			for(int i=0; i<recipe_ingre.size(); i++) {
				// 해당 레시피가 찜되어 있는지 확인
				WishlistCart wish = new WishlistCart();
				wish.setRecipe_ingre_idx(recipe_ingre.get(i).getIngre_idx());
				wish.setMem_id(member.getMem_id());
				
				row.add(mapper.checkIngreWish(wish));
			}
		}
		
		model.addAttribute("allIngreWishlist", row);

		return "recipe-detail";
	}

	// 레시피 디테일 -> 관련 재료 한번에 장바구니
	@RequestMapping(value = "/recipe-detail/all-cart.do", method = RequestMethod.GET)
	public @ResponseBody String recipeIngre(@RequestParam("checkedItems") List<Integer> checkedItems, HttpSession session) {
		
		// 로그인 확인
		Member member = (Member) session.getAttribute("member");
		
		if (member == null)
			return "notLogin";
		else {
			for (int item : checkedItems) {
				// 체크된 재료들의 장바구니 목록 확인
				WishlistCart wish = new WishlistCart();
				wish.setRecipe_ingre_idx(item);
				wish.setMem_id(member.getMem_id());
				
				int row = mapper.checkIngreCart(wish);
				if (row > 0) {
					// 원래 담겨있던 수량 + 1
					mapper.updateIngreCart(wish);
				} else {
					// 장바구니에 수량 1개로 새로 담기
					mapper.inIngreCart(wish);
				}
			}
			return "success";
		}

	}
	
	// 레시피 디테일 페이지의 각 재료 -> 찜
	@RequestMapping(value="recipe-detail/wish-ingre.do", method=RequestMethod.GET)
	public @ResponseBody String ingreWish(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		
		// 로그인 확인
		Member member = (Member)session.getAttribute("member");
		
		if(member == null)
			return "notLogin";
		else {
			// 찜되어 있는지 확인
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(ingre_idx);
			wish.setMem_id(member.getMem_id());
			
			int row = mapper.checkIngreWish(wish);
			if(row > 0) {
				// 찜 목록에서 삭제
				mapper.delIngreWish(wish);
				return "delWish";
			}
			else {
				// 찜 목록에 추가
				mapper.inIngreWish(wish);
				return "inWish";
			}
		}
	}

	// 조회수 증가하기 전 쿠키로 검증
	private boolean viewCountValidation(Recipe recipe, HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = Optional.ofNullable(request.getCookies()).orElseGet(() -> new Cookie[0]);
   
		System.out.println("조회수 체크하기 위한 쿠키 검증");
   
		// 기존 쿠키 찾기
		Cookie cookie = Arrays.stream(cookies).filter(c -> c.getName().equals("recipeView")).findFirst().orElse(null);

		// 쿠키 값에 해당 레시피 ID가 포함되어 있는지 확인
		if (cookie == null || !cookie.getValue().contains("[" + recipe.getRecipe_idx() + "]")) {
		
			// 쿠키가 없거나 해당 레시피 ID가 없는 경우
			// 쿠키 업데이트
		    String newValue = (cookie == null) ? "[" + recipe.getRecipe_idx() + "]"
		               : cookie.getValue() + "[" + recipe.getRecipe_idx() + "]";
			cookie = new Cookie("recipeView", newValue);
		    cookie.setPath("/");
		    long todayEndSecond = LocalDate.now().atTime(LocalTime.MAX).toEpochSecond(ZoneOffset.UTC);
		    long currentSecond = LocalDateTime.now().toEpochSecond(ZoneOffset.UTC);
		    cookie.setMaxAge((int) (todayEndSecond - currentSecond));
		    response.addCookie(cookie);
		    
		    return true;  // 새로운 방문자라면 true 반환
		} else {
			return false; // 이미 방문한 경우 false 반환
		}
	}
}
