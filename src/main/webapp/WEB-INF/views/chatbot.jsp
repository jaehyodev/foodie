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
	<div id="chatbot__header">
		<span>1:1 문의 상담</span>
	    <div class="toggle-btn" id="toggleButton">
	        <div class="toggle-circle"></div>
	    </div>	    
	</div>

	<div id="chatbot__content"></div>

	<div id="chatbot__footer">
	    <div id="footer__ai-name">푸 💖</div>
	    <div id="footer__input__container">
	        <input type="text" id="input__container__type" placeholder="Write Something..." />
	        <button id="input__container__send-btn" onclick="startChat()">SEND</button>
	        <button id="input__container__stop-btn" onclick="stopChat()">STOP</button>
	    </div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 챗봇 토글 기능 -->
	<script>
		let isChatGPT = false; // ChatGPT(푸)인지 Chatbase(디)인지 확인!
		
		$(document).ready(function() {
		    $('#toggleButton').click(function() {
		        $(this).toggleClass('active');
		        if ($(this).hasClass('active')) {
		            $('#footer__ai-name').text('디 💖');
		            isChatGPT = false;
		            $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box">안녕하세요! 푸보다 조금 더 똑똑한 세계 최고의 요리사 디 입니다.</div></div>');
		            $('#chatbot__content').scrollTop($('#chatbot__content')[0].scrollHeight);
		        } else {
		            $('#footer__ai-name').text('푸 💖');
		            isChatGPT = true;
		            $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box">안녕하세요! 세계 최고의 요리사 푸 입니다.</div></div>');
		            $('#chatbot__content').scrollTop($('#chatbot__content')[0].scrollHeight);
		        }
		    });
		});
	</script>
	<!-- 챗봇 대화 기능 -->
	<script>
	    let isWaitingResponse = false; // AI 답변 대기 중인지 여부	    
	    
	    // 초기에 STOP 버튼 숨기기
	    $('#input__container__stop-btn').hide();
	
	    // 컴퓨터가 첫 환영 메시지 출력
	    $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box">${initMessage}</div></div>');
	
	    // 새로운 대화 메시지를 화면에 추가하는 함수
	    function chat(message, isUserChat) {
	        var chatbotContent = $('#chatbot__content');
	        var whoChatClass = isUserChat ? ' chatbot__content__my-box' : '';
	        var chatElement = $('<div class="content__box__container"><div class="chatbot__content__box' + whoChatClass + '">'
	                + message + '</div></div>');
	
	        // 대화 메시지를 화면에 띄우기 전에 이전의 'AI 답변 중...' 메시지 삭제
	        if (!isUserChat) {
	            $('#chatbot__content').find('.chatbot__content__box--waiting').remove();
	        }
	
	        // 대화 메시지를 화면에 띄우기
	        chatbotContent.append(chatElement);
	
	        // 사용자의 메시지라면 대화 메시지를 서버로 보내기
	        if (isUserChat) {
	            if (isChatGPT) {
	                // ChatGPT API 이용
	                sendChatToServer(message);
	            } else {
	                // Chatbase API 이용
	                receiveChatbaseAPI(message);
	            }
	        }
	
	        // 새로운 메시지가 추가되면 스크롤을 맨 아래로 이동
	        chatbotContent.scrollTop(chatbotContent.prop("scrollHeight"));
	    }
	
	    // 사용자가 메시지를 입력하고 보내는 함수
	    function startChat() {
	        var userInput = $('#input__container__type').val().trim();
	
	        if (userInput !== "") {
	            chat(userInput, true);
	            $('#input__container__type').val('');
	        }
	    }
	
	    let currentAjaxRequest = null; // 현재 진행 중인 AJAX 요청
	
		// ChatGPT 실제 사용자의 메시지를 서버로 보내고 답변을 받아오는 함수
		function sendChatToServer(chatToSend) {
			// 현재 진행 중인 AJAX 요청을 저장
			if (currentAjaxRequest) {
			    currentAjaxRequest.abort(); // 이전 요청 취소
			}
			
			currentAjaxRequest = $.ajax({
			    type: "POST",
			    url: "/foodie/chatbot/hitopenaiapi", // 서버의 컨트롤러 매핑 URL
			    contentType: "application/json; charset=UTF-8",
			    data: JSON.stringify(chatToSend),
			    beforeSend: function() {
			        // AI가 답변 중임을 표시하는 메시지 추가
			        $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box chatbot__content__box--waiting">AI가 답변 중...</div></div>');
			        $('#input__container__send-btn').hide();
			        $('#input__container__stop-btn').show(); // STOP 버튼 표시
			        isWaitingResponse = true;
			    },
			    success: function(response) {
			        console.log("서버에서 응답 받음:");
			        chat(response, false);
			    },
			    error: function(error) {
			        console.error("Error sending data: ", error);
			    },
			    complete: function() {
			        // AI 답변 완료 후 대기 메시지 삭제
			        $('#chatbot__content').find('.chatbot__content__box--waiting').remove();
			        $('#input__container__send-btn').show();
			        $('#input__container__stop-btn').hide(); // STOP 버튼 숨김
			        isWaitingResponse = false;
			    }
			});
		}
	
		let abortController = null; // Fetch 요청 취소용 컨트롤러
		
		// Chatbase API 사용
		async function receiveChatbaseAPI(message) {
		    if (abortController) {
		        abortController.abort(); // 이전 요청 취소
		    }
		    abortController = new AbortController();

		    // 'SEND' 버튼을 가리고 'STOP' 버튼을 표시하며 AI가 답변 중임을 표시하는 메시지 추가
		    $('#input__container__send-btn').hide();
		    $('#input__container__stop-btn').show();
		    $('#chatbot__content').append('<div class="content__box__container"><div class="chatbot__content__box chatbot__content__box--waiting">AI가 답변 중...</div></div>');
		    isWaitingResponse = true;

		    try {
		        const response = await fetch('https://www.chatbase.co/api/v1/chat', {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/json',
		                'Authorization': 'Bearer fecd40cf-4e01-469f-a7c8-ffbeae578d53'
		            },
		            body: JSON.stringify({
		                messages: [{
		                    content: message,
		                    role: 'user'
		                }],
		                chatbotId: 'NfqOA3dRdfUfWcAiPIkof',
		                stream: false,
		                model: 'gpt-4o',
		                temperature: 0
		            }),
		            signal: abortController.signal
		        });

		        if (!response.ok) {
		            const errorData = await response.json();
		            throw new Error(errorData.message);
		        }

		        const data = await response.json();
		        console.log("-Chatbase에서 보낸 데이터-");
		        console.log(data);

		        // chat 함수 호출
		        chat(data.text, false);

		    } catch (error) {
		        if (error.name === 'AbortError') {
		            console.log('Chat 요청이 취소되었습니다.');
		        } else {
		            console.error('Error in receiveChatbaseAPI:', error);
		            // 오류 처리 필요
		        }
		    } finally {
		        // AI 답변 완료 후 대기 메시지 삭제
		        $('#chatbot__content').find('.chatbot__content__box--waiting').remove();
		        $('#input__container__send-btn').show();
		        $('#input__container__stop-btn').hide(); // STOP 버튼 숨김
		        isWaitingResponse = false;
		        abortController = null;
		    }
		}
		
	 	// 채팅 'ENTER' 키 입력 이벤트
	    $('#input__container__type').keydown(function(event) {
	        if (event.key === 'Enter') {
	            event.preventDefault();
	            startChat();
	        }
	    });
	 	
	 	// 정지 버튼 클릭 이벤트
        function stopChat() {
            if (isWaitingResponse) {
                console.log("Chat 요청을 취소합니다.");
                if (currentAjaxRequest) {
                    currentAjaxRequest.abort(); // AJAX 요청 취소
                    currentAjaxRequest = null;
                }
                if (abortController) {
                    abortController.abort(); // Fetch 요청 취소
                    abortController = null;
                }
                $('#input__container__send-btn').show();
                $('#input__container__stop-btn').hide(); // STOP 버튼 숨김
                $('#chatbot__content').find('.chatbot__content__box--waiting').remove();
                isWaitingResponse = false;
            }
        }
	</script>
</body>
</html>
