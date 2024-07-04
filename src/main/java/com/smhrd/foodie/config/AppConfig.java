package com.smhrd.foodie.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.client.RestTemplate;

@Configuration
@PropertySource("classpath:config.properties") // config.properties 파일에서 환경 설정 가져오기.
@ComponentScan(basePackages = "com.smhrd.foodie") // com.smhrd.foodie 패키지에서 컴포넌트를 스캔하여 빈으로 등록.
public class AppConfig {

	// 환경 설정
	// API Key가 노출된 상태로 GitHub에 업로드 되지 않음.
	// config.properties에서 API Key 숨길 수 있도록 해줌.
	
	// RestTemplate 빈을 생성.
	@Bean
	public RestTemplate restTemplate(Environment env) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		// config.properties 파일에서 ChatGPT_API_KEY 값을 가져오기.
		String chatgptApiKey = env.getProperty("ChatGPT_API_KEY");
		
		// RestTemplate 인터셉터를 추가하여 HTTP 요청 헤더에 Authorization 헤더를 추가.
		restTemplate.getInterceptors().add((request, body, execution) -> {
			request.getHeaders().add("Authorization", "Bearer " + chatgptApiKey);
			return execution.execute(request, body);
		});
		return restTemplate;
	}
}
