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
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>
	
</body>
</html>