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

import com.smhrd.foodie.mapper.RecipeMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Recipe;
import com.smhrd.foodie.model.RecipeAllergy;
import com.smhrd.foodie.model.Wishlist;

@Controller
public class RecipeController {

	@Autowired
	RecipeMapper mapper;

	// 레시피 페이지 로드
	@RequestMapping(value = "/recipe/{recipe_cat}", method = RequestMethod.GET)
	public String recipecat(@PathVariable("recipe_cat") String recipe_cat, Model model, HttpSession session) {

		// 레시피 목록
		List<Recipe> recipeList = mapper.select(recipe_cat);
		model.addAttribute("recipeList", recipeList);

		Member member = (Member) session.getAttribute("member");
		model.addAttribute("member", member);

		List<Integer> row = new ArrayList<Integer>();
		if (member != null) {
			// 찜되어 있는지 안되어 있는지 확인
			for (int i = 0; i < recipeList.size(); i++) {
				Wishlist wish = new Wishlist();
				wish.setRecipe_ingre_idx(recipeList.get(i).getRecipe_idx());
				wish.setMem_id(member.getMem_id());
				row.add(mapper.checkRecipeWish(wish));
			}
		}

		model.addAttribute("wishlist", row);
		
		return "recipe";
	}

	// 레시피, 레시피디테일 -> 찜
	@RequestMapping(value = { "/recipe/wishRecipe", "/recipedetails/wishRecipe" }, method = RequestMethod.GET)
	public @ResponseBody String recipeWish(@RequestParam("recipe_idx") int recipe_idx, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null)
			return "notLogin";
		else {
			Wishlist wish = new Wishlist();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			int row = mapper.checkRecipeWish(wish);
			if (row > 0) {
				// 찜 목록에서 삭제
				mapper.delRecipeWish(wish);
				return "inWish";
			} else {
				// 찜 목록에 추가
				mapper.inRecipeWish(wish);
				return "success";
			}
		}
	}

	// 레시피 디테일 페이지 로드
	@RequestMapping(value = "/recipedetails/{recipe_idx}", method = RequestMethod.GET)
	public String recipeDetail(@PathVariable("recipe_idx") int recipe_idx, Model model, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {

		Member member = (Member) session.getAttribute("member");
		// model.addAttribute("member", member);

		// 해당 레시피 불러오기
		Recipe recipe = mapper.recipe(recipe_idx);
		model.addAttribute("recipe", recipe);

		// 쿠키 검증 및 조회수 증가 여부 확인
    boolean isNewVisit = viewCountValidation(recipe, request, response);

    if (isNewVisit) {
        // 조회수 증가
    		recipe.addViewCount();
        mapper.increaseRecipeViewsCnt(recipe);
        System.out.println("새로운 방문자이므로 db 조회수 증가");
    }

		// 레시피 조리법 \로 분리
		String[] recipecook = recipe.getRecipe_cook().split("\\|");
		model.addAttribute("recipecook", recipecook);

		// 레시피 설명 .또는!또는?로 분리
		String[] recipecontent = recipe.getRecipe_content().split("(?<=[.!?])");
		model.addAttribute("recipecontent", recipecontent);

		List<Ingredient> recipe_ingre = null;

		if (member != null) {
			// 레시피 관련 재료 (회원)
			RecipeAllergy recipeAllergy = new RecipeAllergy(member.getMem_id(), recipe.getRecipe_name());
			recipe_ingre = mapper.memRecipeIngre(recipeAllergy);

			// 찜되어 있는지 안되어 있는지 확인
			Wishlist wish = new Wishlist();
			wish.setRecipe_ingre_idx(recipe_idx);
			wish.setMem_id(member.getMem_id());
			int row = mapper.checkRecipeWish(wish);
			model.addAttribute("wish", row);
		} else {
			// 레시피 관련 재료 (비회원)
			recipe_ingre = mapper.recipeIngre(recipe);
		}
		model.addAttribute("recipe_ingre", recipe_ingre);
		
	// 찜 확인
			List<Integer> row = new ArrayList<Integer>();
			if(member != null) {
				// 찜되어 있는지 안되어 있는지 확인
				for(int i=0; i<recipe_ingre.size(); i++) {
					Wishlist wish = new Wishlist();
					wish.setRecipe_ingre_idx(recipe_ingre.get(i).getIngre_idx());
					wish.setMem_id(member.getMem_id());
					row.add(mapper.checkIngreWish(wish));
				}
			}
			model.addAttribute("allIngreWishlist", row);

		return "recipe-details";
	}

	// 레시피디테일 -> 관련 재료 한번에 장바구니
	@RequestMapping(value = "/recipedetails/allCart", method = RequestMethod.GET)
	public @ResponseBody String recipeIngre(@RequestParam("checkedItems") List<Integer> checkedItems,
			HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		for (int i = 0; i < checkedItems.size(); i++) {
			System.out.println(checkedItems.get(i));
		}
		if (member == null)
			return "notLogin";
		else {
			for (int item : checkedItems) {
				System.out.println(item);
				Wishlist wish = new Wishlist();
				wish.setRecipe_ingre_idx(item);
				wish.setMem_id(member.getMem_id());
				int row = mapper.checkIngreCart(wish);
				if (row > 0) {
					// 기존 상품의 수량에 추가로 더함
					mapper.updateIngreCart(wish);
				} else {
					// 새로운 상품을 추가함
					mapper.inIngreCart(wish);
				}
			}
			return "success";
		}

	}
	
	// Recipe detail 각 재료 -> 찜
	@RequestMapping(value="recipedetails/wishIngre", method=RequestMethod.GET)
	public @ResponseBody String ingreWish(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		System.out.println(ingre_idx);
		if(member == null)
			return "notLogin";
		else {
			Wishlist wish = new Wishlist();
			wish.setRecipe_ingre_idx(ingre_idx);
			wish.setMem_id(member.getMem_id());
			int row = mapper.checkIngreWish(wish);
			if(row > 0) {
				// 찜 목록에서 삭제
				mapper.delIngreWish(wish);
				return "inWish";
			}
			else {
				// 찜 목록에 추가
				mapper.inIngreWish(wish);
				return "success";
			}
		}
	}

	//조회수 증가하기 전 쿠키로 검증
	private boolean viewCountValidation(Recipe recipe, HttpServletRequest request, HttpServletResponse response) {
   Cookie[] cookies = Optional.ofNullable(request.getCookies()).orElseGet(() -> new Cookie[0]);
   
   System.out.println("조회수 체크하기위한 쿠키 검증");
   
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
       return true; // 새로운 방문자라면 true 반환
   } else {
       return false; // 이미 방문한 경우 false 반환
   }
}

}
