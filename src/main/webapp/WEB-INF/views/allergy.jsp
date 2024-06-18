<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Personal Recipe</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="index"><img src="resources/img/logo.png" alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<!-- 찜 -->
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<!-- 장바구니 -->
				<li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<!-- 장바구니 총 금액 -->
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> 로그아웃 </a>
			</div>
			<div class="header__top__right__auth">
				<a href="mypage"><i class="fa fa-address-card"></i> 마이페이지</a>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="humberger__menu__contact">
			<ul>
				<!-- 이메일 -->
				<li><i class="fa fa-envelope"></i> hello@smhrd.com</li>
				<li>5만원 이상 구매 시 무료배송</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

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
	<section class="allergy-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="mypage__sidebar">
						<h2>마이 페이지</h2>
						<ul>
							<li><a href="mypage">주문 내역</a></li>
							<li><a href="wishlist">찜 목록</a></li>
							<li class="active"><a href="allergy">알레르기 / 비선호도</a></li>
							<li><a href="edituserinfo">개인 정보 수정</a></li>
							<li><a href="editpw">비밀번호 변경</a></li>
							<li><a href="deleteuserinfo">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="mypage__content">
						<h2>알레르기 / 비선호도</h2>
						<form action="updateAllergy" method="post">
							<div class="allergy-container">
                            <table>
                                <thead>
                                    <tr>
                                        <th><h3>알레르기</h3></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><label><input type="checkbox"> 난류</label></td>
                                        <td><label><input type="checkbox"> 우유</label></td>
                                        <td><label><input type="checkbox"> 메밀</label></td>
                                        <td><label><input type="checkbox"> 땅콩</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 대두</label></td>
                                        <td><label><input type="checkbox"> 밀</label></td>
                                        <td><label><input type="checkbox"> 고등어</label></td>
                                        <td><label><input type="checkbox"> 게</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 새우</label></td>
                                        <td><label><input type="checkbox"> 돼지고기</label></td>
                                        <td><label><input type="checkbox"> 복숭아</label></td>
                                        <td><label><input type="checkbox"> 토마토</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 아황산류</label></td>
                                        <td><label><input type="checkbox"> 호두</label></td>
                                        <td><label><input type="checkbox"> 닭고기</label></td>
                                        <td><label><input type="checkbox"> 쇠고기</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 오징어</label></td>
                                        <td><label><input type="checkbox"> 조개류</label></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>

                            <table>
                                <thead>
                                    <tr>
                                        <th><h3>비선호도</h3></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><label><input type="checkbox"> 매운맛</label></td>
                                        <td><label><input type="checkbox"> 짠맛</label></td>
                                        <td><label><input type="checkbox"> 단맛</label></td>
                                        <td><label><input type="checkbox"> 신맛</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 쓴맛</label></td>
                                        <td><label><input type="checkbox"> 기름진 맛</label></td>
                                        <td><label><input type="checkbox"> 느끼한 맛</label></td>
                                        <td><label><input type="checkbox"> 비린 맛</label></td>
                                    </tr>
                                    <tr>
                                        <td><label><input type="checkbox"> 탄 맛</label></td>
                                        <td><label><input type="checkbox"> 떫은 맛</label></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
							<div class="form-group">
								<button type="submit" class="site-btn">저장하기</button>
							</div>
						</form>
						<p>알레르기와 비선호 식품을 필터링하여 재료를 추천합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
	<!-- Footer Section End -->

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/mixitup.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>