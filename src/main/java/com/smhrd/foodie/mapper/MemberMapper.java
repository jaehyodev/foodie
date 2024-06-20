package com.smhrd.foodie.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.foodie.model.Member;

@Mapper
public interface MemberMapper {
	
	
	void select();
	
	void join();
	
	Member login(Member member);
	
	void editPw();
	
	int delete(String id);
}
