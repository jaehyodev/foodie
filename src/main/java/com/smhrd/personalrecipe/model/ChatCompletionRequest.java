package com.smhrd.personalrecipe.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ChatCompletionRequest {
	
	private String model;
	private List<ChatMessage> messages;
	private int max_tokens = 10;
	
	
	public ChatCompletionRequest(String model, String prompt) {
		super();
		this.model = model;
		this.messages =  new ArrayList<ChatMessage>();
		this.messages.add(new ChatMessage("user", prompt));
	}
}