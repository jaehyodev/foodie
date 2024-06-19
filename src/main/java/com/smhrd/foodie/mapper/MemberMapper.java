package com.smhrd.foodie.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	
	void select();
	
	void join();
	
	void login();
	
	void editPw();
	
	void delete();
	
}
