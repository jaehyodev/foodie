package com.smhrd.foodie.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ChatCompletionRequest {
	
	private String model;
	private List<ChatMessage> messages;
	private int max_tokens;
	
	
	public ChatCompletionRequest(String model, String prompt, int max_tokens) {
		super();
		this.model = model;
		this.messages =  new ArrayList<ChatMessage>();
		this.messages.add(new ChatMessage("user", prompt));
		this.max_tokens = max_tokens;
	}
}