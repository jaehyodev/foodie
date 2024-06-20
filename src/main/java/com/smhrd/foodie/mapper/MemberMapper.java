package com.smhrd.foodie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.foodie.model.Member;

@Mapper
public interface MemberMapper {

   // 얘네는 사실 프록시 객체(메소드)임

   // 2. 얘가 실행이 되면 Mybatis의 프록시 객체가
   // 해당 인터페이스의 namespace와 userJoin 메서드 이름에 해당하는 xml파일 찾음
   int join(Member member); // 회원가입

   Member loginCheck(Member member); // 로그인

   void allergy(List<Member> member);
   
//   void dislike(Map<String, Object>);
   
   int updatePw();

   void delete();

}