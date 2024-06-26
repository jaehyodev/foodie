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
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul>
							<!-- 상단 카테고리 -->
							<li><a href="<c:url value='/recipe/주부'/>">주부 레시피</a></li>
							<li><a href="<c:url value='/recipe/키즈'/>">키즈 레시피</a></li>
							<li><a href="<c:url value='/recipe/자취생'/>">자취생 레시피</a></li>
							<li><a href="<c:url value='/recipe/다이어트'/>">다이어트 레시피</a></li>
							<li><a href="<c:url value='/recipe/캠핑'/>">캠핑 레시피</a></li>
							<li><a href="<c:url value='/recipe/파티'/>">파티 레시피</a></li>
							<li><a href="<c:url value='/recipe/야식'/>">야식 레시피</a></li>
							<li><a href="<c:url value='/shopgrid/채소/1'/>">재료 사러가기</a></li>
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
	<!-- Hero Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>레시피</h4>
							<ul>
								<!-- 좌측 카테고리 -->
								<li><a href="<c:url value='/recipe/주부'/>">주부 레시피</a></li>
								<li><a href="<c:url value='/recipe/키즈'/>">키즈 레시피</a></li>
								<li><a href="<c:url value='/recipe/자취생'/>">자취생 레시피</a></li>
								<li><a href="<c:url value='/recipe/다이어트'/>">다이어트 레시피</a></li>
								<li><a href="<c:url value='/recipe/캠핑'/>">캠핑 레시피</a></li>
								<li><a href="<c:url value='/recipe/파티'/>">파티 레시피</a></li>
								<li><a href="<c:url value='/recipe/야식'/>">야식 레시피</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>${recipeList.get(0).getRecipe_cat() }레시피</h2>
						</div>
					</div>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5"></div>
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="filter__found">
									<h6>
										<span>${recipeList.size() }</span> 개의 레시피
									</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="recipelist">
						<c:forEach items="${recipeList }" var="list" varStatus="loop">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="<c:url value='../resources/img${list.recipe_title_img }'/>"
										onclick="window.location.href = '<c:url value='/recipedetails/${list.recipe_idx}'/>'"
										style="cursor: pointer;">
										<ul class="product__item__pic__hover">
											<li><c:choose>
													<c:when
														test="${not empty member and wishlist.get(loop.index) == 1}">
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
									</div>
									<div class="product__item__text">
										<h6>
											<a href="<c:url value='/recipedetails/${list.recipe_idx}'/>">${list.recipe_name }</a>
										</h6>
									</div>
								</div>
							</div>
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
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/wish-cart.js' />"></script>
	<script src="<c:url value='/resources/js/bottom-buttons.js' />"></script>
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>

</body>
</html>