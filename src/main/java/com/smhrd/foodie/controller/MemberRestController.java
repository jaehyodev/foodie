package com.smhrd.foodie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.foodie.mapper.MemberMapper;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.MemberAllergy;
import com.smhrd.foodie.model.MemberDislike;

@RestController
public class MemberRestController {
   
   @Autowired
   MemberMapper mapper;
   
   // ajax를 이용한 로그인 중복 확인
   @RequestMapping(value = "idCheck", method = RequestMethod.POST)
   public boolean idCheck(String mem_id) {
         
   System.out.println(mapper.idCheck(mem_id));
         
   return 0 == mapper.idCheck(mem_id);
   }
      
   // ajax를 이용한 이메일 중복 확인
   @RequestMapping(value = "emailCheck", method = RequestMethod.POST)
   public boolean emailCheck(String mem_email) {
         
   System.out.println(mapper.idCheck(mem_email));
         
   return 0 == mapper.idCheck(mem_email);
   }
      
   // ajax를 이용한 전화번호 중복 확인
   @RequestMapping(value = "phoneCheck", method = RequestMethod.POST)
   public boolean phoneCheck(String mem_phone) {
         
   System.out.println(mapper.idCheck(mem_phone));
         
   return 0 == mapper.idCheck(mem_phone);
   }
   
   // 회원가입 실행 메소드
   @RequestMapping(value = "/join.do", method = RequestMethod.POST)
   public String join(@RequestParam("mem_id") String mem_id, @RequestParam("mem_pw") String mem_pw,
         @RequestParam("mem_pwck") String mem_pwck, @RequestParam("mem_email") String mem_email,
         @RequestParam("mem_name") String mem_name,
         @RequestParam("mem_tel") String mem_tel, @RequestParam("mem_addr") String mem_addr, 
         @RequestParam("mem_extraAddr") String mem_extraAddr,
         @RequestParam(name = "allergy_list[]", required = false) List<String> allergy_list,
         @RequestParam(name = "dislike_list[]", required = false) List<String> dislike_list) {

      // 상세 주소 합치기
      mem_addr = mem_addr + mem_extraAddr;
      Member member = new Member(mem_id, mem_pw, mem_name, mem_email, mem_tel, mem_addr);

      // sql문 실행
      // 1. mapper에 있는 userJoin 메소드 실행
      // 흐름 : contoller -> 인터페이스 -> xml -> controller로 값 반환
      
      int row = 0;
      
      System.out.println("넘겨받은 사용자가 체크한 알러지 idx : " + allergy_list);
      System.out.println("넘겨받은 사용자가 체크한 비선호 식재료 idx : " + dislike_list);
      
      // 비밀번호 확인 후 회원가입
      if(mem_pw.equals(mem_pwck)) {
         
         row = mapper.join(member);
         
         if(allergy_list != null) {
            
            // 회원가입 mapper 코드보다 뒤에 와야함. 외래키 제 약 때문에 회원가입이 먼저 되어야 테이블에 insert 가능함
            for (int i = 0; i < allergy_list.size(); i++) {
               // jsp에서 받아온 mem_id와 allergy_list의 value(allergy_idx로 사용되는 것)를 MemberAllergy에
               // set
               MemberAllergy memberAllergy = new MemberAllergy(mem_id, Integer.parseInt(allergy_list.get(i)));
               mapper.allergy(memberAllergy);

            }
         }
         
         if(dislike_list != null) {
            // 비선호 식재료
            int rowDislike = 0; // 알러지가 총 몇개 들어갔는 지 카운트
            
            for (int i = 0; i < dislike_list.size(); i++) {
               MemberDislike memberDislike = new MemberDislike(mem_id, Integer.parseInt(dislike_list.get(i)));
               mapper.dislike(memberDislike);
               rowDislike++;
            }
            
            // 총 몇개의 비선호 식재료가 들어갔는 지 확인하기
            for (int i = 0; i < rowDislike; i++) {
               System.out.println("비선호 식재료 추가" + (i + 1));
            }
         }
         
      } // 비밀번호 확인 후 회원가입 끝 중괄호
         
      
      System.out.println("insert 반환 값 : " + row);

      if (row > 0) {
         System.out.println("회원가입 성공");
         return "success";
      } else {
         System.out.println("회원가입 실패");
         return "fail";
      }

   }
   
   
   
   
   
   // 비밀번호 변경
   @RequestMapping(value = "/updatePw.do", method = RequestMethod.POST)
   public String updatePw(HttpSession session, @RequestParam("curPw") String curPw,
         @RequestParam("newPw") String newPw, @RequestParam("pwCheck") String pwCheck) {

      // session member에 저장되어 있는 현재 사용자의 정보들 member에 담기
      Member member = (Member) session.getAttribute("member");

      // session에 저장되어 있는 사용자의 pw가 담긴 member의 mem_pw 가져오기
      String mem_pw = member.getMem_pw();

      System.out.println("사용자의 현재 비밀번호 (변경 전 비밀번호) : " + mem_pw);

      if (mem_pw.equals(curPw)) {

         // member의 현재 비밀번호인 mem_pw에 newPw를 set
         member.setMem_pw(newPw);

         // 수정된 mem_pw를 가진 member 객체 보내기
         int row = mapper.updatePw(member);

         if (row > 0) {
            System.out.println("비밀번호 변경 성공");
            return "success";
         }else {
            return "fail";
         }
      } else {
      System.out.println("현재 비밀번호를 잘못 입력하셨습니다.");
      return "curPwFail";
      }

   }
      
   // 회원탈퇴
   @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
   public String delete(HttpSession session, @RequestParam("input_id") String input_id,
         @RequestParam("input_pw") String input_pw) {

      Member member = (Member) session.getAttribute("member");

      String mem_id = member.getMem_id();
      String mem_pw = member.getMem_pw();

      System.out.println("회원탈퇴 전 session 값 : " + session.getAttribute("member"));
      
      // 현재 session에 담긴 member 정보와 입력받은 member 정보가 같은지 확인 -> 다른 유저의 아이디 회원탈퇴 방지
      if (mem_id.equals(input_id) && mem_pw.equals(input_pw)) {
         
         // 회원 탈퇴
         mapper.delete(member);
         
         // session에 있는 값 삭제
         session.removeAttribute("member");
            
         // 회원탈퇴 후 session값을 따로 삭제해주지 않으면 DB에서 데이터를 삭제하더라도 session에 값이 남아있음
         System.out.println("회원탈퇴 후 session 값 : " + session.getAttribute("member")); // null값인 것을 확인

         System.out.println("회원탈퇴 성공");
         
         return "success";
         
      } else {
         System.out.println("회원탈퇴 실패");
         
         return "fail";
      
      }

   }
   
   
   // 로그인 확인 메소드
   @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
   public String loginCheck(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {

      // 1. 전달받은 id 와 pw 를 DTO 에 set
      Member member = new Member();
      member.setMem_id(id);
      member.setMem_pw(pw);

      // 2. 해당하는 Mapper 인터페이스 메소드 호출 (SQL문 실행 / ID, PW를 DB에서 확인)
      Member m = mapper.loginCheck(member);

      if (m != null) {
         System.out.println("loginCheck 값 (select 반환 값) : " + m); // DB에서 해당하는 데이터 가져왔는지 확인

         // 기존에 존재하는 session에 key 와 value 값으로 객체를 set
         // 해당 값으로 사용자 구분
         session.setAttribute("member", m);

         // member 객체의 필드 값들을 확인
         System.out.println("member : " + session.getAttribute("member"));

         System.out.println("로그인 성공");
         return "success";
      } else {
         System.out.println("로그인 실패");

         // 로그인 실패 시 세션의 값이 null 인지 확인
         System.out.println(session.getAttribute("member"));

         return "fail";
      }
   }
   
   
   
   
   
   
   
}
