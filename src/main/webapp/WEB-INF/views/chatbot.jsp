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
    <title>Personal Food</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	html, body {
		margin: 0;
		padding: 0;
		height: 100%;
		box-sizing: border-box; /* 패딩을 포함한 전체 너비를 고정 */
	}	
	button {
		all: unset;
		color: white;
		font-size: 1.5rem;
		font-weight: 800;
	}	
	#chat-header {
		position: fixed;
		left: 0;
		top: 0;
		width: 100%;
		height: 40px;
		background-color: #7fad39;
		line-height: 40px;
		text-align: center;
		color: #ffffff;
		font-weight: 600;
	}	
	
	#chat-container {
		position: relative;
		top: 40px; /* 상단 패딩 대신 마진 사용 */
		width: 100%;
		height: calc(100% - 104px);
		padding: 12px 8px 12px 8px; /* 스크롤바 너비만큼 오른쪽 공간 확보 */
		background-color: blanchedalmond;
		font-size: 0.85rem;
	}
	
	#chat-content {
		width: 100%;
		overflow-y: scroll;
	}	
	
	#chat-cover-bar::-webkit-scrollbar {
  		width: 10px; 
	}
	#chat-cover-bar::-webkit-scrollbar,
	#chat-cover-bar::-webkit-scrollbar-thumb {
		overflow: visible;
		border-radius: 4px;
	}
	#chat-cover-bar::-webkit-scrollbar-thumb {
		background: rgba(0,0,0,.2); 
	}
	#chat-cover-bar {
		width: 10px;
		height: 100%;
		position: absolute;
		top: 0;
		right: 0;
		-webkit-transition: all .5s;
		opacity: 1;
		/* 배경색을 상자색과 똑같이 맞춰준다 */
		background-color:yellowgreen;
	}
	
	/* 중요한 부분 */
	#chat-content:hover .chat-cover-bar {
	   opacity: 0;
	  -webkit-transition: all .5s;
	}
	
	#chat-footer {
		position: fixed;
		display: flex;
		align-items: center;
		bottom: 0;
		width: 100%;
		height: 40px;
		background-color: #7fad39;
		line-height: 40px;	
		color: #ffffff;
		font-size: 0.85rem;
		text-align: center;
	}
	
	#choiceInput {
		width: 20%;
		font-weight: 600;
	}
	
	#input-container {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 78%;
		height: 80%;
		background-color: white;
		border-radius: 8px;
	}
	
	#input-user {
		width: 80%;
		height: 80%;
		border: 0;
		padding: 0 12px 0 12px; 
		border-radius: 8px;
	}
	
	#input-send-btn {
		width: 20%;
		height: 100%;
		line-height: 32px;
		font-size: 0.85rem;
		color: #7fad39;
		cursor: pointer;
	}
	

	
	.chat-box {
		display: inline-block;
		position: relative;
		background-color: white;
		border-radius: 8px;
		color: black;
		padding: 7px 12px;
		margin-bottom: 10px;
		max-width: 320px;
		word-wrap: break-word;
	}
	
	.chat-mybox {
		float: right;
		clear: both; /* 새로운 라인에 배치하기 위해 필요 */
		margin-top: 10px;
		text-align: left;
	}
	
	.chatTime {
	  position: absolute;
	  left: -72px;
	  top: 15px;
	  color: #171717;
	}
	

}
</style>
</head>
<body>
	<div id="chat-header">1:1 문의 상담</div>

	<div id="chat-container">
		<div id="chat-content"></div>	
		<div id="chat-content-bar"></div>	
	</div>
	
    <div id="chat-footer">
    	<div id="choiceInput">선택지 입력</div>
    	<div id="input-container">
	    	<input type="text" id="input-user" placeholder="Write Something..."/>
	    	<button id="sendBtn">SEND</button>	    	
    	</div>
    </div>
    

    <script>
    	function chat() {	
	        var userInput = $('#input-user').val();
	        if (userInput !== "") {
	        	$('#chat-content').append('<div><div class="chat-box chat-mybox">' + userInput + '</div></div>');
	        	$('#input-user').val(''); // 입력 필드 비우기	
	        	
	        	// 스크롤바를 항상 아래로 이동
	            $('#chat-content').scrollTop($('#chat-content')[0].scrollHeight);
	        }    
    	}
    	
    	// 첫 환영 메시지 출력
    	$('#chat-content').append('<div class="chat-box">${initMessage}</div>');
    	
    	// 'SEND' 버튼 누르면 보내기
        $('#input-send-btn').click(function() {
        	chat();
        });
    	
        // 엔터 키 누르면 메시지 보내기
        $('#input-user').keydown(function(event) {
            if (event.key === 'Enter') {
                event.preventDefault(); // 엔터 키의 기본 동작(폼 제출) 방지
                chat();
            }
        });
    </script>
</body>
</html>
