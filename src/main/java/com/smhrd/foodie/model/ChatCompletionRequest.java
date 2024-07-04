package com.smhrd.foodie.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ChatCompletionRequest {
	
	private String model;								// ChatGPT OpenAI Model								
	private List<ChatMessage> messages;	// 메시지
	private int max_tokens;							// AI로부터 받을 수 있는 최대 토큰 수
	
	public ChatCompletionRequest(String model, List<ChatMessage> conversationHistory, String prompt, int max_tokens) {
		super();
		this.model = model;
		this.messages =  new ArrayList<>(conversationHistory);	// 기존 대화 내용
		this.messages.add(new ChatMessage("user", prompt));			// 사용자가 보낸 메시지를 기존 대화 내용에 추가.
		this.max_tokens = max_tokens;
	}
}