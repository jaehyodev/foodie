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

	<!-- Hero Section Begin -->
	<!-- 카테고리 -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul>
							<li><a href="#">채소</a></li>
							<li><a href="#">과일</a></li>
							<li><a href="#">정육</a></li>
							<li><a href="shopgrid">수산</a></li>
							<li><a href="#">쌀ㆍ잡곡</a></li>
							<li><a href="#">면ㆍ오일</a></li>
							<li><a href="#">우유ㆍ유제품</a></li>
							<li><a href="#">소스ㆍ조미료</a></li>
							<li><a href="recipe">레시피</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<!-- 검색창 -->
							<form action="#">
								<input type="text" placeholder="검색어를 입력하세요">
								<button type="submit" class="site-btn">검색</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-comments"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>재료 추천받기</h5>
								<span>24시간 챗봇 상담</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	  <section class="hero hero-normal">
	     <div class="container">
	        <div class="row"></div>
	     </div>
	  </section>
	  <section class="userinfo-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="mypage__sidebar">
                        <h2>마이 페이지</h2>
                        <ul>
							<li><a href="mypage">주문 내역</a></li>
                            <li><a href="wishlist">찜 목록</a></li>
                            <li><a href="allergy">알레르기 / 비선호 식재료</a></li>
                            <li class="active"><a href="update">개인 정보 수정</a></li>
                            <li><a href="updatepw">비밀번호 변경</a></li>
                            <li><a href="delete">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="mypage__content">
                        <h2>개인 정보 수정</h2>
                        <form action="updateUserInfo" method="post"> <%-- 수정 처리 서블릿으로 연결 --%>
                            <div class="form-group">
                                <label for="username">이름:</label>
                                <input type="text" id="username" name="username" value="<%= session.getAttribute("username") %>" required>
                            </div>
                            <div class="form-group">
                                <label for="email">이메일:</label>
                                <input type="email" id="email" name="email" value="<%= session.getAttribute("email") %>" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">휴대폰 번호:</label>
                                <input type="tel" id="phone" name="phone" value="<%= session.getAttribute("phone") %>" required>
                            </div>
                            <div class="form-group">
                                <label for="address">주소:</label>
                                <input type="text" id="address" name="address" value="<%= session.getAttribute("address") %>" required>
                            </div>
                            <button type="submit" class="site-btn">수정 완료</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
	<!-- Footer Section End -->

	<script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
</body>
</html>