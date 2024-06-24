package com.smhrd.foodie.controller;

import java.util.List;
import java.util.Map;

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
import com.smhrd.foodie.model.MemberAllergy;
   
@Controller
public class MemberController {
   
   @Autowired
   MemberMapper mapper;
   
   // 회원가입 실행 메소드
   @RequestMapping(value = "/join.do", method = RequestMethod.POST)
   public String join(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw,
         @RequestParam("mem_pwck") String mem_pwck, @RequestParam("mem_email") String mem_email,
         @RequestParam("mem_tel") String mem_tel, @RequestParam("mem_addr") String mem_addr,
         @RequestParam("allergy_list") List<String> allergy_list, @RequestParam("dislike_name") List<String> dislike_name) {
      
      System.out.println("응답받은 mem_id : " + mem_id);
      System.out.println("응답받은 mem_pw : " + mem_pw);
      System.out.println("응답받은 mem_pwck : " + mem_pwck);
      System.out.println("응답받은 mem_email : " + mem_email);
      System.out.println("응답받은 mem_tel : " + mem_tel);
      System.out.println("응답받은 mem_addr : " + mem_addr);
      System.out.println("응답받은 allergy_list : " + allergy_list);
      System.out.println("응답받은 dislike_name : " + dislike_name);
      
      Member member = new Member(mem_id, mem_pw, mem_pwck, mem_email, mem_tel, mem_addr);
      System.out.println("member 값 : " + member);

      
    
      
      // sql문 실행
      // 1. mapper에 있는 userJoin 메소드 실행
      // 흐름 : contoller -> 인터페이스 -> xml -> controller로 값 반환
      int row = mapper.join(member);
      
      System.out.println(member);
      
//      for(int i=0; i<allergy_name.size(); i++) {
//    	  mapper.allergy());
//      }
      
      
//      mapper.allergy(Map.of("mem_id", member.getMem_id(), "allergy_name", member.getAllergy_name()));
//      mapper.dislike(Map.of("mem_id", member.getMem_id(), "dislike_name", member.getDislike_name()));

      

      
      System.out.println("insert 반환 값 : " + row);
      
      if(row > 0) {
         System.out.println("회원가입 성공");
      }else {
         System.out.println("회원가입 실패");
      }
      
      // 회원가입 mapper 코드보다 뒤에 와야함. 외래키 제약 때문에 회원가입이 먼저 되어야 테이블에 insert 가능함
      int rowAllergy = 0; // 알러지가 총 몇개 들어갔는 지 카운트
      for (int i = 0; i < allergy_list.size(); i++) {
    	  MemberAllergy memberAllergy = new MemberAllergy(mem_id, Integer.parseInt(allergy_list.get(i)));
    	  mapper.allergy(memberAllergy);
    	  rowAllergy++; 
      }
      // 총 몇개의 알러지가 들어갔는 지 확인하기
      for (int i = 0; i < rowAllergy; i++) {
          System.out.println("알러지 추가");
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
    	   
    	   // 기존에 존재하는 session에 key 와 value 값으로 객체를 set
    	   // 해당 값으로 사용자 구분
          session.setAttribute("member", member);
         
          System.out.println("member : " + session.getAttribute("member"));
          
          System.out.println("로그인 성공");
          return "redirect:/";
       }else {
          ra.addFlashAttribute("error", "아이디 또는 비밀번호를 다시 확인해주세요.");
          System.out.println("로그인 실패");
          
          // 로그인 실패 시 세션의 값이 null 인지 확인
          System.out.println(session.getAttribute("member"));
          
          // 오류 메세지를 담고 있는 값 출력 테스트
          System.out.println(ra.getFlashAttributes());
          
          return "redirect:/login";
       }
   }
   
   // 로그아웃
   @RequestMapping(value = "/logout", method = RequestMethod.POST)
   public String logout(HttpSession session) {
      
	   System.out.println("삭제 전 세션 값 : " + session.getAttribute("member"));
	   
	   // 기존에 존재하던 session에 저장되어 있던 객체값을 delete
      session.removeAttribute("member");
      
      System.out.println("삭제 후 세션 값 : " + session.getAttribute("member"));
      
      // redirect : /logout 이 리턴해주는 jsp로 이동하는 것이 아니라 (리턴해주는 곳으로 갈 경우 url에 /logout으로 뜸) value가 / 인 곳으로 가게 하는 것
      return "redirect:/";
   }
   
   // 비밀번호 변경 페이지
   @RequestMapping(value = "/updatePw.do", method = RequestMethod.GET)
   public String updatePw() {
      return "updatepw";
   }

}
