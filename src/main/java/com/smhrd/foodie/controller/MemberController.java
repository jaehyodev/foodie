package com.smhrd.foodie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
	
@Controller
public class MemberController {
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "mypage";
	}
	
	// 찜목록
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist() {
		return "wishlist";
	}

	// 마이페이지에서 회원 정보 변경
	@RequestMapping(value = "/edituserinfo", method = RequestMethod.GET)
	public String edituserinfo() {
		return "edituserinfo";
	}

	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy() {
		return "allergy";
	}
	@RequestMapping(value = "/deleteuserinfo", method = RequestMethod.GET)
	public String deleteuserinfo() {
		return "deleteuserinfo";
	}

	@RequestMapping(value = "/editpw", method = RequestMethod.GET)
	public String editpw() {
		return "editpw";
	}



	

}
