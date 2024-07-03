package com.smhrd.foodie.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


// AI와 USER가 주고받는 메시지

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessage {

	private String role;		// 역할 (user, assistant로 사용 중)
	private String content;	// 메시지 내용
	
}