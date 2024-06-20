package com.smhrd.foodie.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "mypage";
	}

	// 마이페이지에서 회원 정보 변경 페이지
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		return "update";
	}

	// 찜 목록 페이지
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist() {
		return "wishlist";
	}

	// 알러지 수정 페이지
	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy() {
		return "allergy";
	}

	// 회원 탈퇴 페이지
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "delete";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
		return "shopping-cart";
	}

	@RequestMapping(value = "/shopgrid", method = RequestMethod.GET)
	public String shopGrid() {
		return "shop-grid";
	}

	@RequestMapping(value = "/shopdetail", method = RequestMethod.GET)
	public String shopDetail() {
		return "shop-details";
	}

	@RequestMapping(value = "/recipe", method = RequestMethod.GET)
	public String recipe() {
		return "recipe";
	}

	@RequestMapping(value = "/recipedetail", method = RequestMethod.GET)
	public String recipeDetail() {
		return "recipe-details";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout() {
		return "checkout";
	}

	// 챗봇 페이지
	@GetMapping("/chatbot")
	public String chatbot(Model model) {
		model.addAttribute("initMessage", "안녕하세요?");
	  return "chatbot";
	}
	
}
