package com.smhrd.foodie.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ChatCompletionRequest {
	
	private String model;
	private List<ChatMessage> messages;
	private int max_tokens;
	
	
	public ChatCompletionRequest(String model, List<ChatMessage> conversationHistory,String prompt, int max_tokens) {
		super();
		this.model = model;
		this.messages =  new ArrayList<>(conversationHistory);
		this.messages.add(new ChatMessage("user", prompt));
		this.max_tokens = max_tokens;
	}
}