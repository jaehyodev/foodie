package com.smhrd.foodie.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDislike {
	
	private String mem_id;
	private int dislike_idx;
	
}
