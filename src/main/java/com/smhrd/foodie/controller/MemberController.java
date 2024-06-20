package com.smhrd.foodie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.Member;
	
@Controller
public class MemberController {
	
	@Autowired
	MemberMapper mapper;
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	// 회원가입 실행 메소드
	@RequestMapping(value = "/userJoin", method = RequestMethod.POST)
	public String userJoin(@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("pwck") String pwck, @RequestParam("email") String email,
			@RequestParam("tel") String tel, @RequestParam("addr") String addr) {
		
		System.out.println("응답받은 ID : " + id);
		System.out.println("응답받은 PW : " + pw);
		System.out.println("응답받은 PWCK : " + pwck);
		System.out.println("응답받은 email : " + email);
		System.out.println("응답받은 tel : " + tel);
		System.out.println("응답받은 addr : " + addr);
		
		return "login";
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
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		return "update";
	}

	@RequestMapping(value = "/allergy", method = RequestMethod.GET)
	public String allergy() {
		return "allergy";
	}
	
	@RequestMapping(value = "mypage/delete", method = RequestMethod.GET)
	public String delete() {
		return "delete";
	}

	@RequestMapping(value = "/updatepw", method = RequestMethod.GET)
	public String updatepw() {
		return "updatepw";
	}

}
