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

@RestController
public class ChatController {

	@Autowired
	private RestTemplate restTemplate;

	@PostMapping(value = "/chatbot/hitopenaiapi", produces = "application/text; charset=utf8")
	public String getOpenaiResponse(@RequestBody String prompt, HttpSession session) {

		int max_tokens = 150;
		
		// 사용자가 보낸 메시지를 세션에 저장
		@SuppressWarnings("unchecked")
		List<String> userMessages = (List<String>) session.getAttribute("userMessages");
    if (userMessages == null) {
        userMessages = new ArrayList<>();
    }
    userMessages.add(prompt);
    session.setAttribute("userMessages", userMessages);
    
		ChatCompletionRequest chatCompletionRequest = new ChatCompletionRequest("gpt-3.5-turbo-0125", prompt, max_tokens );

		ChatCompletionResponse response = restTemplate.postForObject("https://api.openai.com/v1/chat/completions",
				chatCompletionRequest, ChatCompletionResponse.class);
		
		System.out.println("ChatGPT 통신 중!!!");
		
		String responseData = response.getChoices().get(0).getMessage().getContent();
		
		// AI의 응답을 세션에 저장
    session.setAttribute("lastAIResponse", responseData);
    
    // AI 모델에 전달할 질문과 이전 대화 히스토리
    StringBuilder history = new StringBuilder();
    for (String message : userMessages) {
        history.append(message).append("\n");
    }
    history.append(prompt); // 현재 사용자의 새로운 질문 추가
    
    // 세션에서 저장된 사용자 메시지와 AI 응답 가져오기
    @SuppressWarnings("unchecked")
		List<String> storedUserMessages = (List<String>) session.getAttribute("userMessages");
    String lastAIResponse = (String) session.getAttribute("lastAIResponse");
    
    // 확인을 위한 출력
    System.out.println("Stored User Messages: " + storedUserMessages);
    System.out.println("Last AI Response: " + lastAIResponse);
		return responseData;
	}
}
