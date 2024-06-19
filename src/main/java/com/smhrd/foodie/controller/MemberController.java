package com.smhrd.foodie.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.Member;
   
@Controller
public class MemberController {
   
   @Autowired
   MemberMapper mapper;
   
   // 회원가입 실행 메소드
   @RequestMapping(value = "/join.do", method = RequestMethod.POST)
   public String join(@RequestParam("id") String id, @RequestParam("pw") String pw,
         @RequestParam("pwck") String pwck, @RequestParam("email") String email,
         @RequestParam("tel") String tel, @RequestParam("addr") String addr) {
      
      System.out.println("응답받은 ID : " + id);
      System.out.println("응답받은 PW : " + pw);
      System.out.println("응답받은 PWCK : " + pwck);
      System.out.println("응답받은 email : " + email);
      System.out.println("응답받은 tel : " + tel);
      System.out.println("응답받은 addr : " + addr);      
      
      Member member = new Member(id, pw, pwck, email, tel, addr);
      
      System.out.println("member 값 : " + member);
      
      // sql문 실행
      // 1. mapper에 있는 userJoin 메소드 실행
      // 흐름 : contoller -> 인터페이스 -> xml -> controller로 값 반환
      int row = mapper.join(member);
      // inselt는 0 or 1을 반환
      
      System.out.println("insert 반환 값 : " + row);
      
      if(row > 0) {
         System.out.println("회원가입 성공");
      }else {
         System.out.println("회원가입 실패");
      }
      
      return "login";
   }
   
   // 로그인 확인 메소드
   @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
   public String loginCheck(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session, RedirectAttributes ra) {
      
      
      // 1. 전달받은 id 와 pw 를 DTO 에 set
      Member member = new Member();
      member.setMem_id(id);
      member.setMem_pw(pw);
      
      // 2. 해당하는 Mapper 인터페이스 메소드 호출 (SQL문 실행 / ID, PW를 DB에서 확인)
       Member m = mapper.loginCheck(member);
             
       System.out.println("loginCheck 값 (select 반환 값) : " + m);    
       
       if(m != null) {
          session.setAttribute("Member", member);
         
          System.out.println("Member : " + session.getAttribute("Member"));
          
          System.out.println("로그인 성공");
          return "redirect:/";
       }else {
          ra.addFlashAttribute("error", "아이디 또는 비밀번호를 다시 확인해주세요.");
          System.out.println("로그인 실패");
          
          System.out.println(ra.getFlashAttributes());
          
          return "redirect:/login";
       }
   }
   
   // 로그아웃
   @RequestMapping(value = "/logout", method = RequestMethod.POST)
   public String logout(HttpSession session) {
      
      session.removeAttribute("Member");
      
      // redirect : /logout 이 리턴해주는 jsp로 이동하는 것이 아니라 (리턴해주는 곳으로 갈 경우 url에 /logout으로 뜸) value가 / 인 곳으로 가게 하는 것
      return "redirect:/";
   }


   
   // 비밀번호 변경 페이지
   @RequestMapping(value = "/updatePw.do", method = RequestMethod.GET)
   public String updatePw() {
      return "updatepw";
   }

}
