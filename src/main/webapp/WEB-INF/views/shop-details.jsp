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

<<<<<<< HEAD
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
=======
    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/elegant-icons.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/nice-select.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/slicknav.min.css'/>" type="text/css">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" type="text/css">
>>>>>>> 5e32112c85048702b1a13cc7b8270339ab11da40
</head>

<body>

<<<<<<< HEAD
	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->
=======
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="<c:url value='index'/>"><img src="<c:url value='resources/img/logo.png'/>" alt=""></a>
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
                <a href="#"><i class="fa fa-user"></i> Login</a>
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
>>>>>>> 5e32112c85048702b1a13cc7b8270339ab11da40

	<!-- Hero Section Begin -->
	<!-- 상단 카테고리 -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul>
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
							<li><a href="<c:url value='/recipe/주부'/>">레시피 보러가기</a></li>
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

<<<<<<< HEAD
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<!-- 재료 대표 사진 -->
							<img class="product__details__pic__item--large"
								src="<c:url value='../resources/img${ingredient.ingre_img }'/>"
								alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${ingredient.ingre_name }</h3>
						<!-- 가격 -->
						<div class="product__details__price">${ingredient.ingre_price }원</div>
						<c:forEach items="${ingrecontent }" var="list">
							<h5 style="line-height: 2.0;">${list }</h5>
						</c:forEach>
						<br></br>
						<!-- 수량 -->
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1" id="quantityInput">
								</div>
							</div>
						</div>
						<a
							href="<c:url value='javascript:ingreDetailCart(${ingredient.ingre_idx})'/>"
							class="primary-btn">장바구니 담기</a>
						<c:choose>
							<c:when test="${wish == 1}">
								<a
									href="<c:url value='javascript:ingreWishlist(${ingredient.ingre_idx})'/>"
									class="heart-icon" style="color: #D03737;"><span
									class="fa fa-heart"></span></a>
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='javascript:ingreWishlist(${ingredient.ingre_idx})'/>"
									class="heart-icon"><span class="fa fa-heart"></span></a>
							</c:otherwise>
						</c:choose>
						<ul>
							<li><b>중량/용량</b> <span>${ingredient.ingre_weight }</span></li>
							<li><b>생산연도</b> <span>2024</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<!-- 관련상품 -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>관련 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${ingre4 }" var="list" varStatus="loop">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<c:url value='../resources/img${list.ingre_img }'/>"
								onclick="window.location.href = '<c:url value='/shopdetail/${list.ingre_idx }'/>'"
								style="cursor: pointer;"></div>
							<div class="product__item__text">
								<h6>
									<a href="<c:url value='/shopdetail/${list.ingre_idx }'/>">${list.ingre_name }</a>
								</h6>
								<h5>${list.ingre_price }원</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

	<!-- Bottom Buttons (AI, Scroll up) Begin -->
	<%@ include file="./bottom-buttons.jsp"%>
	<!-- Bottom Buttons (AI, Scroll up) End -->

	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
	<!-- Footer Section End -->
=======
    <!-- Hero Section Begin -->
    <!-- 상단 카테고리 -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
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
                        	<li><a href="<c:url value='/recipe/주부'/>">레시피 보러가기</a></li>
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

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                        	<!-- 재료 대표 사진 -->
                            <img class="product__details__pic__item--large"
                                src="<c:url value='../resources/img${ingredient.ingre_img }'/>" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${ingredient.ingre_name }</h3>
                        <!-- 가격 -->
                        <div class="product__details__price">${ingredient.ingre_price }원</div>
                        <!-- <p>합리적으로 즐기는 오통통한 굴비</p> -->
                        <!-- 수량 -->
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">장바구니 담기</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>중량/용량</b> <span>${ingredient.ingre_weight }</span></li>
                            <li><b>생산연도</b> <span>2024</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <!-- 관련상품 -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach items="${ingre4 }" var="list">
            		<div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="<c:url value='../resources/img${list.ingre_img }'/>">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="<c:url value='/shopdetail/${list.ingre_name }'/>">${list.ingre_name }</a></h6>
	                            <h5>${list.ingre_price }원</h5>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->
>>>>>>> 5e32112c85048702b1a13cc7b8270339ab11da40

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
	<script src="<c:url value='/resources/js/wish-cart.js' />"></script>

<<<<<<< HEAD
=======
    <!-- Js Plugins -->
    <script src="<c:url value='/resources/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/resources/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/resources/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/resources/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/resources/js/main.js' />"></script>
>>>>>>> 5e32112c85048702b1a13cc7b8270339ab11da40
</body>
</html>