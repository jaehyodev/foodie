package com.smhrd.foodie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.smhrd.foodie.model.ChatCompletionRequest;
import com.smhrd.foodie.model.ChatCompletionResponse;
import com.smhrd.foodie.model.ChatMessage;

@RestController
public class ChatController {

	@Autowired
	private RestTemplate restTemplate;

	List<ChatMessage> conversationHistory = new ArrayList<>();
  
	// 초기 대화 기록 설정
	public ChatController() {
      
	  // 초기 대화 기록 추가
  	  conversationHistory.add(new ChatMessage("system", "너의 이름은 '푸', 직업은 세계 최고의 요리사야"));
      conversationHistory.add(new ChatMessage("system", "유저가 요리에 대해 질문하면 친절하게 알려줘"));
      conversationHistory.add(new ChatMessage("system", "어조: 친절하게, 전문가답게"));
	}

	@PostMapping(value = "/chatbot/hit-openai-api", produces = "application/text; charset=utf8")
	public String getOpenaiResponse(@RequestBody String prompt, HttpSession session) {

		// 최대로 출력 가능한 AI의 답변
		int max_tokens = 2048;
		
		// 사용자가 보낸 새로운 질문을 conversationHistory에 추가
		conversationHistory.add(new ChatMessage("user", prompt));

		// 사용자의 요청에 현재의 메세지가 아닌 conversationHistory를 보내어 사용자와 AI의 대화 기록을 전부 보냄
		ChatCompletionRequest chatCompletionRequest = new ChatCompletionRequest("gpt-3.5-turbo-0125", conversationHistory, prompt,
				max_tokens);
		
		// AI의 답변을 받음
		ChatCompletionResponse response = restTemplate.postForObject("https://api.openai.com/v1/chat/completions",
				chatCompletionRequest, ChatCompletionResponse.class);

		// AI의 답변을 변수로 할당
		String responseData = response.getChoices().get(0).getMessage().getContent();
		
		// AI의 답변을 conversationHistory에 추가
		conversationHistory.add(new ChatMessage("assistant", responseData));

		return responseData;
	}
}
