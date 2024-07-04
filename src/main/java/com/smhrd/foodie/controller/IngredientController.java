package com.smhrd.foodie.controller;

import java.util.ArrayList;
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

import com.smhrd.foodie.mapper.RecipeIngreMapper;
import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.Paging;
import com.smhrd.foodie.model.WishlistCart;

@Controller
public class IngredientController {
	
	@Autowired
	RecipeIngreMapper mapper;
	
	// 재료 목록 페이지 로드
	@RequestMapping(value="/ingre-grid/{ingre_cat}/{page}", method=RequestMethod.GET)
	public String ingreCat(@PathVariable("ingre_cat") String ingre_cat, @PathVariable("page") int page , Model model, HttpSession session) {
		
		// 페이징 기능 구현
		int total = mapper.ingreSize(ingre_cat); 						 // 해당 카테고리의 전체 재료 개수
		int cntPerPage = 12; 											 // 페이지당 글 갯수
		int endPage = (int) Math.ceil((double)total/(double)cntPerPage); // 끝 페이지
		int start = cntPerPage*(page-1)+1; 								 // 해당 페이지 재료 start 번호
		int end; 														 // 해당 페이지 재료 end 번호
		
		model.addAttribute("total", total);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nowPage", page);
		
		if(page == endPage) {
			// 해당 카테고리의 마지막 페이지
			end = cntPerPage*(page-1)+(total%12);
		}
		else {
			// 그 외의 페이지
			end = cntPerPage*page;
		}
		
		// 해당 페이지의 재료 목록 가져오기
		Paging paging = new Paging(ingre_cat, start, end);
		
		List<Ingredient> ingrelist = mapper.ingreList(paging);
		model.addAttribute("ingrelist", ingrelist);
		
		// 로그인 확인
		Member member = (Member)session.getAttribute("member");
		model.addAttribute("member", member);
		
		// 찜 확인
		List<Integer> row = new ArrayList<Integer>();
		if(member != null) {
			for(int i=0; i<ingrelist.size(); i++) {
				WishlistCart wish = new WishlistCart();
				wish.setRecipe_ingre_idx(ingrelist.get(i).getIngre_idx());
				wish.setMem_id(member.getMem_id());
				
				row.add(mapper.checkIngreWish(wish));
			}
		}
		model.addAttribute("wishlist", row);
		
		
		return "ingre-grid";
	}
	
	// 재료 목록 & 재료 디테일 -> 찜
	@RequestMapping(value={"/ingre-grid/{page}/wish-ingre.do", "/ingre-detail/wish-ingre.do"}, method=RequestMethod.GET)
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
	
	// 재료 목록 & 레시피 디테일 페이지의 재료 하나씩 -> 장바구니
	@RequestMapping(value={"/ingre-grid/{ingre_cat}/cart.do", "/recipe-detail/cart.do"}, method=RequestMethod.GET)
	public @ResponseBody String ingreCart(@RequestParam("ingre_idx") int ingre_idx, HttpSession session) {
		
		// 로그인 확인
		Member member = (Member)session.getAttribute("member");
		
		if(member == null)
			return "notLogin";
		else {
			// 장바구니 목록 확인
			WishlistCart cart = new WishlistCart();
			cart.setRecipe_ingre_idx(ingre_idx);
			cart.setMem_id(member.getMem_id());
			int row = mapper.checkIngreCart(cart);
			if(row > 0) {
				// 원래 담겨있던 수량 + 1
				mapper.updateIngreCart(cart);
			}
			else {
				// 장바구니에 수량 1개로 새로 담기
				mapper.inIngreCart(cart);
			}
			return "success";
		}
	}
	
	// 재료 디테일 페이지 로드
	@RequestMapping(value="/ingre-detail/{ingre_idx}", method=RequestMethod.GET)
	public String ingreDetail(@PathVariable("ingre_idx") int ingre_idx, Model model, HttpSession session) {

		// 재료 상세 가져오기
		Ingredient ingredient = mapper.ingredient(ingre_idx);
		model.addAttribute("ingredient", ingredient);
		
		// 재료 설명 -> .또는!또는?로 분리
		String[] ingrecontent = ingredient.getIngre_content().split("(?<=[.!?])");
		model.addAttribute("ingrecontent", ingrecontent);
		
		// 재료의 같은 카테고리 내 관련 상품 (랜덤으로 4개)
		List<Ingredient> ingre4 = mapper.ingre4(ingre_idx);
		model.addAttribute("ingre4", ingre4);
		
		Member member = (Member)session.getAttribute("member");
		if (member != null) {
			// 찜되어 있는지 확인
			WishlistCart wish = new WishlistCart();
			wish.setRecipe_ingre_idx(ingre_idx);
			wish.setMem_id(member.getMem_id());
			
			int row = mapper.checkIngreWish(wish);
			model.addAttribute("wish", row);
		}
		
		return "ingre-detail";
	}
	
	// 재료 디테일 -> 장바구니
	@RequestMapping(value="/ingre-details/current-cart.do", method=RequestMethod.GET)
	public @ResponseBody String ingreDetailCart(@RequestParam("ingre_idx") int ingre_idx, @RequestParam("quantity") int quantity, HttpSession session) {
		
		// 로그인 확인
		Member member = (Member)session.getAttribute("member");
		
		if(member == null)
			return "notLogin";
		else {
			// 장바구니 목록 확인
			WishlistCart cart = new WishlistCart();
			cart.setRecipe_ingre_idx(ingre_idx);
			cart.setMem_id(member.getMem_id());
			cart.setQuantity(quantity);
			
			int row = mapper.checkIngreCart(cart);
			if(row > 0) {
				// 원래 담겨있던 수량 + quantity(사용자가 담은 수량)
				mapper.updateDetailIngreCart(cart); 
			}
			else {
				// 장바구니에 수량 quantity만큼 새로 담기
				mapper.inDetailIngreCart(cart);
			}
			return "success";
		}
	}
	
}
