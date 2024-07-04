package com.smhrd.foodie.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ChatCompletionResponse 클래스는 ChatGPT API와 같은 인공지능 기반 챗봇 시스템에서 사용자의 입력에 대한 응답을 구조화하는 데 사용.
 * choices 필드를 통해 여러 개의 선택지를 가진 리스트로 사용자에게 제공할 수 있는 다양한 응답 옵션을 저장.
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatCompletionResponse {
	
	// AI가 보여줄 답변 리스트 (index, message로 구성)
	private List<Choice> choices;
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class Choice {
		
		private int index;
		private ChatMessage message;

	}
	
}