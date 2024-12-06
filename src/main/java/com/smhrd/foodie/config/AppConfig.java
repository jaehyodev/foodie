package com.smhrd.foodie.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.client.RestTemplate;

@Configuration
@ComponentScan(basePackages = "com.smhrd.foodie")
public class AppConfig {

	@Value("${chatgptApiKey}")
    private String chatgptApiKey;
	
	// RestTemplate 빈을 생성.
	@Bean
	public RestTemplate restTemplate(Environment env) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		// RestTemplate 인터셉터를 추가하여 HTTP 요청 헤더에 Authorization 헤더를 추가.
		restTemplate.getInterceptors().add((request, body, execution) -> {
			request.getHeaders().add("Authorization", "Bearer " + chatgptApiKey);
			return execution.execute(request, body);
		});
		return restTemplate;
	}
}
