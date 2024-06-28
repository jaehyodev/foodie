<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->

	<!-- Category Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul id="categories-list">
							<li><a href="<c:url value='/recipe/주부'/>">주부 레시피</a></li>
							<li><a href="<c:url value='/recipe/키즈'/>">키즈 레시피</a></li>
							<li><a href="<c:url value='/recipe/자취생'/>">자취생 레시피</a></li>
							<li><a href="<c:url value='/recipe/다이어트'/>">다이어트 레시피</a></li>
							<li><a href="<c:url value='/recipe/캠핑'/>">캠핑 레시피</a></li>
							<li><a href="<c:url value='/recipe/파티'/>">파티 레시피</a></li>
							<li><a href="<c:url value='/recipe/야식'/>">야식 레시피</a></li>
							<li><a href="#" id="ingredient-link">재료 사러가기</a></li>
						</ul>
						<ul id="additional-categories">
							<li><a href="<c:url value='/shopgrid/채소/1'/>">채소</a></li>
							<li><a href="<c:url value='/shopgrid/과일/1'/>">과일</a></li>
							<li><a href="<c:url value='/shopgrid/수산/1'/>">수산</a></li>
							<li><a href="<c:url value='/shopgrid/정육ㆍ계란류/1'/>">정육ㆍ계란류</a></li>
							<li><a href="<c:url value='/shopgrid/쌀ㆍ잡곡/1'/>">쌀ㆍ잡곡</a></li>
							<li><a href="<c:url value='/shopgrid/면ㆍ오일/1'/>">면ㆍ오일</a></li>
							<li><a href="<c:url value='/shopgrid/우유ㆍ유제품/1'/>">우유ㆍ유제품</a></li>
							<li><a href="<c:url value='/shopgrid/소스ㆍ조미료/1'/>">소스ㆍ조미료</a></li>
							<li><a href="<c:url value='/shopgrid/음료/1'/>">음료</a></li>
							<li><a href="<c:url value='/shopgrid/기타/1'/>">기타</a></li>
							<li><a href="#" id="view-recipes">레시피 보러가기</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">

					<!-- Search Section Begin -->
					<%@ include file="./search-form.jsp"%>
					<!-- Search Section End -->

				</div>
			</div>
		</div>
	</section>
	<!-- Category Section End -->

	<!-- Wide Banner Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>로그인</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<section class="hero hero-normal">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>

	<section class="login-section spad">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-8">

					<!-- 로그인 실패 시 나오는 멘트 -->
					<c:if test="${not empty flash.error}">
						<div class="logion-error-message">${flash.error}</div>
						<script>
							console.log("${flash.error}");
						</script>
					</c:if>

					<div class="login__form">
					<form action="/foodie/loginCheck" method="post">
                     <div class="form-group">
                        <label for="login_id">아이디</label> <input type="text"
                           class="form-control" id="login_id" name="login_id"
                           placeholder="아이디를 입력하세요">
                     </div>
                     <div class="form-group">
                        <label for="login_pw">비밀번호</label> <input type="password"
                           class="form-control" id="login_pw" name="login_pw"
                           placeholder="비밀번호를 입력하세요">
                           <label id="label10"></label>
                     </div>
                     <br></br>
                              
                     <button id="loginBtn" type="submit" class="site-btn float-center">로그인</button>
                  </form>
					
						<br></br> <br></br>
						<div class="login__register float-center">
							아직 회원이 아니신가요? <a href="join">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Bottom Buttons (AI, Scroll up) Begin -->
	<%@ include file="./bottom-buttons.jsp"%>
	<!-- Bottom Buttons (AI, Scroll up) End -->

	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
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
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/member.js' />"></script>
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>
	
</body>
</html>