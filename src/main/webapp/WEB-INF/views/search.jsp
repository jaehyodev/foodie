<!DOCTYPE html>
<!-- HTML 문서의 시작 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSP 페이지의 설정: Java 언어 사용, 컨텐츠 타입과 인코딩 설정 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 코어 태그 라이브러리 선언 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL 포맷팅 태그 라이브러리 선언 -->

<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Foodie</title>
<!-- 웹페이지의 메타데이터 설정 및 제목 -->

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- Google Font 설정 -->

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
<!-- 외부 CSS 파일 링크 -->

</head>
<body>
	<!-- 웹페이지 본문 시작 -->

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
						<h2>'${keyword}'에 대한 검색 결과</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>레시피</h2>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5"></div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span>${recipeList.size() }</span> 개의 레시피
									</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${recipeList }" var="list" varStatus="loop">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="<c:url value='../resources/img${list.recipe_title_img }'/>"
										onclick="window.location.href = '<c:url value='/recipe-detail/${list.recipe_idx}'/>'"
										style="cursor: pointer;"></div>
									<ul class="product__item__pic__hover">
										<li><c:choose>
												<c:when
													test="${not empty member and recipeWishlist.get(loop.index) == 1}">
													<a
														href="<c:url value='javascript:recipeWishlist(${list.recipe_idx})'/>"
														style="color: #D03737;"><i class="fa fa-heart"></i></a>
												</c:when>
												<c:otherwise>
													<a
														href="<c:url value='javascript:recipeWishlist(${list.recipe_idx})'/>"><i
														class="fa fa-heart"></i></a>
												</c:otherwise>
											</c:choose></li>
									</ul>
									<div class="product__item__text">
										<h6>
											<a href="<c:url value='/recipe-detail/${list.recipe_idx}'/>">${list.recipe_name }</a>
										</h6>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>재료</h2>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5"></div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span>${ingreList.size() }</span> 개의 재료
									</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${ingreList }" var="list" varStatus="loop">
							<div class="col-lg-3 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="<c:url value='/resources/img${list.ingre_img}'/>"
										onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
										style="cursor: pointer;"></div>
									<ul class="product__item__pic__hover">
										<li><c:choose>
											<c:when
												test="${not empty member and ingreWishlist.get(loop.index) == 1}">
												<a
													href="<c:url value='javascript:ingreWishlist(${list.ingre_idx})'/>"
													style="color: #D03737;"><i class="fa fa-heart"></i></a>
											</c:when>
											<c:otherwise>
												<a
													href="<c:url value='javascript:ingreWishlist(${list.ingre_idx})'/>"><i
														class="fa fa-heart"></i></a>
											</c:otherwise>
										</c:choose></li>
										<li><a
											href="<c:url value='javascript:ingreCart(${list.ingre_idx})'/>"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
									<div class="product__item__text">
										<h6>
											<a href="<c:url value='/ingre-detail/${list.ingre_idx }'/>">${list.ingre_name }</a>
										</h6>
										<h5>
											<fmt:formatNumber value="${list.ingre_price }"
												pattern="#,###" />
											원
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 하단 버튼 (AI, 스크롤 업) 시작 -->
	<%@ include file="./bottom-buttons.jsp"%>
	<!-- 하단 버튼 (AI, 스크롤 업) 부분 포함 -->

	<!-- 푸터 부분 시작 -->
	<%@ include file="./footer.jsp"%>
	<!-- 푸터 부분 포함 -->

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
	<!-- 외부 JavaScript 파일 링크 -->

</body>
<!-- 웹페이지 본문 끝 -->
</html>
<!-- HTML 문서의 끝 -->

