package com.smhrd.foodie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.smhrd.foodie.model.ChatCompletionRequest;
import com.smhrd.foodie.model.ChatCompletionResponse;

@RestController
public class ChatController {
	
	@Autowired
	RestTemplate restTemplate;
	
	@PostMapping("/hitopenaiapi")
	public String getOpenaiResponse(@RequestBody String prompt) {
		
		ChatCompletionRequest chatCompletionRequest
			= new ChatCompletionRequest("gpt-3.5-turbo-0125", prompt);
		
		ChatCompletionResponse response
			= restTemplate.postForObject("https://api.openai.com/v1/chat/completions",
											chatCompletionRequest,
											ChatCompletionResponse.class);
				
		System.out.println("ChatGPT 통신 중!!!");
		return response.getChoices().get(0).getMessage().getContent();
	}
}