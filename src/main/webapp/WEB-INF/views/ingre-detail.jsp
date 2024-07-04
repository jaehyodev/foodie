<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				
					<!-- Categories Section Begin -->
					<%@ include file="./categories.jsp"%>
					<!-- Categories Section End -->
					
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
		data-setbg="<c:url value='/resources/img/breadcrumb.jpg'/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<!-- 해당 재료의 카테고리 이름 -->
						<h2>${ingredient.ingre_cat }</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->	

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
						<!-- 재료 가격 -->
						<div class="product__details__price">
							<fmt:formatNumber value="${ingredient.ingre_price }"
								pattern="#,###" />
							원
						</div>
						<c:forEach items="${ingrecontent }" var="list">
							<h5 style="line-height: 2.0;">${list }</h5>
						</c:forEach>
						<br></br>
						<!-- 재료 수량 -->
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="1" id="quantityInput">
								</div>
							</div>
						</div>
						<!-- 장바구니 버튼 -->
						<a href="<c:url value='javascript:ingreDetailCart(${ingredient.ingre_idx})'/>"
					  	   class="site-btn">장바구니 담기</a>
					  	<!-- 찜 버튼 -->
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
						<!-- 재료의 용량과 생산연도 -->
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
	<!-- 관련 재료 상품 -->
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
								onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
								style="cursor: pointer;"></div>
							<div class="product__item__text">
								<h6>
									<a href="<c:url value='/ingre-detail/${list.ingre_idx }'/>">${list.ingre_name }</a>
								</h6>
								<h5>
									<fmt:formatNumber value="${list.ingre_price }" pattern="#,###" />
									원
								</h5>
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
	<script src="<c:url value='/resources/js/cart.js' />"></script>
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>
	<script src="<c:url value='/resources/js/wishlist.js' />"></script>

</body>
</html>