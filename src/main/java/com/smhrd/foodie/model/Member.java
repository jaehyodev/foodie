package com.smhrd.foodie.model;

import lombok.Data;

@Data // lombok
public class Member {

	private String mem_id;

	private String mem_pw;

	private String mem_name;

	private String mem_email;

	private String mem_phone;

	private String mem_addr;

}
