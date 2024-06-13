<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chatbot</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/chatbot.css" type="text/css">
</head>
<body>
	<div id="chat__header">1:1 문의 상담</div>
	
	<div id="chat__content"></div>	
	
    <div id="chat__footer">
    	<div id="footer__choice">선택지 입력</div>
    	<div id="footer__input__container">
	    	<input type="text" id="input__container__type" placeholder="Write Something..."/>
	    	<button id="input__container__send-btn">SEND</button>	    	
    	</div>
    </div>
    

    <script>
    	function chat() {	
	        var userInput = $('#input__container__type').val();
	        if (userInput !== "") {
	        	$('#chat__content').append('<div><div class="chat__content__box chat__content__my-box">' + userInput + '</div></div>');
	        	$('#input__container__type').val(''); // 입력 필드 비우기	
	        	
	        	// 스크롤바를 항상 아래로 이동
	            $('#chat__content').scrollTop($('#chat__content')[0].scrollHeight);
	        }    
    	}
    	
    	// 첫 환영 메시지 출력
    	$('#chat__content').append('<div class="chat__content__box">${initMessage}</div>');
    	
    	// 'SEND' 버튼 누르면 보내기
        $('#input__container__send-btn').click(function() {
        	chat();
        });
    	
        // 엔터 키 누르면 메시지 보내기
        $('#input__container__type').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); // 엔터 키의 기본 동작(폼 제출) 방지
                chat();
            }
        });
    </script>
</body>
</html>
