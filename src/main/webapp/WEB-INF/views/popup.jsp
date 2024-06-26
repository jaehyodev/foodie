<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Foodie</title>

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

</head>
<body>

	<div>
		<p>${message}</p>
		<!-- 컨트롤러에서 전달받은 메시지 출력 -->
		<button onclick="redirectToLogin()">로그인 페이지로 이동</button>
	</div>

	<script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
	<script src="<c:url value='/resources/js/bottom-buttons.js' />"></script>
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>
	<script>
	  // 현재 위치에서 /foodie/updateAllergy 액션을 가진 폼을 form 변수에 저장
	  const form = document.querySelector('form[action="/foodie/updateAllergy"]');

	  // id가 deleteAllergy인 hidden input 태그를 찾아감
	  const deleteAllergy = document.getElementById('deleteAllergy');
	  const deleteDislike = document.getElementById('deleteDislike');

	  form.addEventListener('submit', function(event) {
	
		  // 현재 문서에서 name이 allergy_list인 모든 input 요소들을 선택하여 변수에 저장
		  const allergy_list = document.querySelectorAll('input[name="allergy_list"]');
		  // 현재 문서에서 name이 dislike_list인 모든 input 요소들을 선택하여 변수에 저장
		  const dislike_list = document.querySelectorAll('input[name="dislike_list"]');
		
	    // 체크 해제된 알레르기의 value 값을 배열로 변환
	    const uncheckAllergy = Array.from(allergy_list)
	      .filter(checkbox => !checkbox.checked)
	      .map(checkbox => checkbox.value);
		
		  // 체크 해제된 비선호 식재료의 value 값을 배열로 변환
		  const uncheckDislike = Array.from(dislike_list)
	      .filter(checkbox => !checkbox.checked)
	      .map(checkbox => checkbox.value);
	
 		  // 체크 해제된 알레르기 값들을 쉼표로 구분된 문자열로 변환하여 hidden input에 저장
      deleteAllergy.value = uncheckAllergy.join(',');
	
      // 체크 해제된 비선호 식재료 값들을 쉼표로 구분된 문자열로 변환하여 hidden input에 저장
      deleteDislike.value = uncheckDislike.join(',');
	  });
  </script>
</body>
</html>