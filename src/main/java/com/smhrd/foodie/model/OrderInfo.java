package com.smhrd.foodie.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfo {
	
	private int order_idx;	
	private String mem_id;	
	private String ordered_at;	
	private String order_status;	
	private int total_amount;	
	private String order_addr;
	
}
