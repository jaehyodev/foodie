package com.smhrd.foodie.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart() {
		return "shopping-cart";
	}
	
	@RequestMapping(value="/shopgrid", method=RequestMethod.GET)
	public String shopGrid() {
		return "shop-grid";
	}
	
	@RequestMapping(value="/shopdetail", method=RequestMethod.GET)
	public String shopDetail() {
		return "shop-details";
	}
	
	@RequestMapping(value="/recipe", method=RequestMethod.GET)
	public String recipe() {
		return "recipe";
	}
	
	@RequestMapping(value="/recipedetail", method=RequestMethod.GET)
	public String recipeDetail() {
		return "recipe-details";
	}
	

	
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public String checkout() {
		return "checkout";
	}
	

	// Chatbot Open
	@Controller
	public class ChatbotController {
		
	    @GetMapping("/chatbot")
	    public String chatbot(Model model) {
	        model.addAttribute("initMessage", "안녕하세요?");
	        return "chatbot";
	    }
	}
	
	// ChatGPT OpenAI Api 호출
	// @Value("${openai.api.key}")
	private String openAiApiKey;
	
	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
	    restTemplate.getInterceptors().add((request, body, execution) -> {
	        request.getHeaders().add("Authorization", "Bearer " + openAiApiKey);
	        return execution.execute(request, body);
	    });
		return restTemplate;
	}
}
