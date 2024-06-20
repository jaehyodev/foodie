<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Foodie Chatbot</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/elegant-icons.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/nice-select.css'/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/owl.carousel.min.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/slicknav.min.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/chatbot.css'/>" type="text/css">
</head>

<body>
	<div id="chatbot__header">1:1 문의 상담</div>

	<div id="chatbot__content"></div>

	<div id="chatbot__footer">
		<div id="footer__choice">선택지 입력</div>
		<div id="footer__input__container">
			<input type="text" id="input__container__type"
				placeholder="Write Something..." />
			<button id="input__container__send-btn">SEND</button>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- 챗봇 대화 기능 -->
	<script>
  	// 컴퓨터가 첫 환영 메시지 출력
        $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box">${initMessage}</div></div>');

        // 새로운 대화 메시지를 화면에 추가하는 함수
        function chat(message, isUserChat) {
            var chatbotContent = $('#chatbot__content');
            var whoChatClass = isUserChat ? 'chatbot__content__my-box' : 'chatbot__content__box';
            var chatElement = $('<div class="content__box__container"><div class="chatbot__content__box ' + whoChatClass + '">' + message + '</div></div>');

            // 대화 메시지를 화면에 띄우기
            chatbotContent.append(chatElement);
            
            // 사용자의 메시지라면 대화 메시지를 서버로 보내기
            if (isUserChat) {
	            sendChatToServer(message);            	
            }

            // 새로운 메시지가 추가되면 스크롤을 맨 아래로 이동
            chatbotContent.scrollTop(chatbotContent.prop("scrollHeight"));
        }

        // 사용자가 메시지를 입력하고 보내는 함수
        function userChat() {
            var userInput = $('#input__container__type').val().trim();

            if (userInput !== "") {
                chat(userInput, true);
                $('#input__container__type').val('');
            }
        }

        // 'SEND' 버튼 클릭 이벤트
        $('#input__container__send-btn').click(function() {
            userChat();
        });

        // 'ENTER' 키 입력 이벤트
        $('#input__container__type').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();
                userChat();
            }
        });
        
        // 실제 사용자의 메시지를 서버로 보내는 함수
        function sendChatToServer(chatToSend) {
            $.ajax({
                type: "POST",
                url: "/foodie/chatbot/hitopenaiapi",  // 서버의 컨트롤러 매핑 URL
                contentType: "application/json",
                data: JSON.stringify(chatToSend),
                success: function(response) {
                		console.log("Chat Data sent successfully!");
                  	chat(response, false);
                },
                error: function(error) {
                    console.error("Error sending data: ", error);
                }
            });
        }
    </script>

</body>
</html>
