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
						<h2>재료</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<!-- 해당 재료 카테고리 명 -->
							<h2>${ingrelist.get(0).ingre_cat }</h2>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5"></div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<!-- 해당 카테고리의 재료 개수 -->
										<span>${total }</span> 개의 상품
									</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- 재료 목록 -->
						<c:forEach items="${ingrelist }" var="list" varStatus="loop">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="<c:url value='../../resources/img${list.ingre_img}'/>"
										onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
										style="cursor: pointer;"></div>
									<!-- 
										재료 사진이나 이름 호버 시 찜, 장바구니 버튼 나타내기
										-> 로그인되어있고 찜 목록에 있으면 하트 색상 빨간색
									 -->
									<ul class="product__item__pic__hover">
										<c:choose>
											<c:when
												test="${not empty member and wishlist.get(loop.index) == 1}">
												<li><a
													href="<c:url value='javascript:ingreWishlist(${list.ingre_idx})'/>"
													style="color: #D03737;"><i class="fa fa-heart"></i></a></li>
											</c:when>
											<c:otherwise>
												<li><a
													href="<c:url value='javascript:ingreWishlist(${list.ingre_idx})'/>"><i
														class="fa fa-heart"></i></a></li>
											</c:otherwise>
										</c:choose>
										<li><a
											href="<c:url value='javascript:ingreCart(${list.ingre_idx})'/>"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
									<div class="product__item__text">
										<h6>
											<!-- 재료 이름 -->
											<a href="<c:url value='/ingre-detail/${list.ingre_idx }'/>">${list.ingre_name }</a>
										</h6>
										<h5>
											<!-- 재료 가격 -->
											<fmt:formatNumber value="${list.ingre_price }"
												pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- 페이징 버튼 -->
					<div class="product__pagination">
						<c:forEach begin="${1 }" end="${endPage }" var="page">
							<c:choose>
								<c:when test="${page == nowPage }">
									<a href="<c:url value='/ingre-grid/${ingrelist.get(0).ingre_cat }/${page }'/>"
									   id="now__page">${page }</a>
								</c:when>
								<c:otherwise>
									<a href="<c:url value='/ingre-grid/${ingrelist.get(0).ingre_cat }/${page }'/>">${page }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

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