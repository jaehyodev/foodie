package com.smhrd.personalrecipe.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	
	void select();
	
	void join();
	
	void login();
	
	void editPw();
	
	void delete();
	
}
