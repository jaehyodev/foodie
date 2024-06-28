package com.smhrd.foodie.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.AllergyInfo;
import com.smhrd.foodie.model.DislikeInfo;
import com.smhrd.foodie.model.Member;
import com.smhrd.foodie.model.MemberAllergy;
import com.smhrd.foodie.model.MemberDislike;
import com.smhrd.foodie.model.OrderDetail;
import com.smhrd.foodie.model.OrderInfo;

@Mapper
public interface MemberMapper {

	// 얘네는 사실 프록시 객체(메소드)임

	// 메소드 앞 타입은 반환타입 -> resultType을 사용 시 resultType과 동일하게 맞춰야함.

	// parameterType : 파라미터로 전달하는 값의 타입 : sql문이 실행되기 전

	// 2. 얘가 실행이 되면 Mybatis의 프록시 객체가
	// 해당 인터페이스의 namespace와 userJoin 메서드 이름에 해당하는 xml파일 찾음
	int join(Member member); // 회원가입

	int idCheck(String mem_id); // 회원가입 시 id 중복 확인

	int emailCheck(String mem_email); // 회원가입 시 email 중복 확인

	int phoneCheck(String mem_phone); // 회원가입 시 phone 중복 확인

	void allergy(MemberAllergy memberAllergy); // 회원가입 시 알러지 추가

	void dislike(MemberDislike memberDislike); // 회원가입 시 비선호 식재료 추가

	Member loginCheck(Member member); // 로그인

	int updatePw(Member member); // 비밀번호 변경

	int update(Member member); // 회원 정보 수정

	// DB에 있는 알러지, 비선호 식재료 테이블
	List<AllergyInfo> allergyInfo(); // 알러지 기준 테이블

	List<DislikeInfo> dislikeInfo(); // 비선호 식재료 기준 테이블

	List<MemberAllergy> allergyMypage(Member member); // 마이페이지 알러지 정보

	List<MemberDislike> dislikeMypage(Member member); // 마이페이지 비선호 정보

	void updateAllergy(MemberAllergy memberAllergy); // 사용자 알러지 정보 추가

	void deleteAllergy(MemberAllergy memberAllergy); // 사용자 알러지 체크박스 체크 해제

	void updateDislike(MemberDislike memberDislike); // 사용자 비선호 정보 추가

	void deleteDislike(MemberDislike memberDislike); // 사용자 비선호 체크박스 체크 해제

	List<OrderInfo> orderInfo(Member member); // 주문 내역

	void delete(Member member); // 회원탈퇴

	@Select("SELECT od.order_idx, ii.ingre_img, ii.ingre_name, od.order_cnt\r\n"
			+ "FROM order_detail_info od\r\n"
			+ "JOIN ingredient_info ii ON od.ingre_idx = ii.ingre_idx\r\n"
			+ "JOIN order_info oi ON od.order_idx = oi.order_idx\r\n"
			+ "WHERE od.order_idx = #{order_idx}")
	List<OrderDetail> orderDetail(int order_idx); // 주문 내역
}
