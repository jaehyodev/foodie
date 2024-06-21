package com.smhrd.foodie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.MemberAllergy;
import com.smhrd.foodie.model.MemberDislike;

@Mapper
public interface MemberMapper {

   // 얘네는 사실 프록시 객체(메소드)임

   // 메소드 앞 타입은 반환타입 -> resultType을 사용 시 resultType과 동일하게 맞춰야함.
	
   // parameterType	: 파라미터로 전달하는 값의 타입 : sql문이 실행되기 전
	
	
	
   // 2. 얘가 실행이 되면 Mybatis의 프록시 객체가
   // 해당 인터페이스의 namespace와 userJoin 메서드 이름에 해당하는 xml파일 찾음
   int join(Member member); // 회원가입

   Member loginCheck(Member member); // 로그인
   
   void allergy(MemberAllergy memberAllergy); // 회원가입 시 알러지 추가
    
   void dislike(MemberDislike memberDislike); // 회원가입 시 비선호 식재료 추가
   
   List<MemberAllergy> allergyMypage(Member member); // 마이페이지 알러지 정보

   void dislikeMypage(); // 마이페이지 비선호 정보
   
   int updatePw();

   void delete();



}
