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

<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>

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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
.sticky_box {
	position: sticky;
	top: 10px;
	height: fit-content;
	margin-left: 200px;
}
</style>

</head>

<body>

	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<!-- 상단 카테고리 -->
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
	<!-- Hero Section End -->

	<!-- Wide Banner Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value='/resources/img/breadcrumb.jpg'/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<!-- 해당 카테고리 이름 -->
						<h2>${recipe.recipe_cat }레시피</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="col-lg-12 col-md-12">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<!-- 해당 레시피 대표 사진 -->
						<img class="product__details__pic__item--large"
							src="<c:url value='../resources/img${recipe.recipe_title_img }'/>"
							alt="">
					</div>
				</div>
			</div>
			<br></br>
			<div class="col-lg-12 col-md-12">
				<div class="product__details__text">
					<div class="row">
						<div class="col-lg-8 col-md-8">
							<!-- 해당 레시피 이름 -->
							<h3>${recipe.recipe_name }</h3>
							<!-- 해당 레시피 설명  -->
							<c:forEach items="${recipecontent }" var="list">
								<h5 style="line-height: 2.0;">${list }</h5>
							</c:forEach>
							<br></br>
						</div>
						<div class="col-lg-4 col-md-4">
							<!-- 찜 확인 후 찜되어 있으면 빨간색 하트 -->
							<c:choose>
								<c:when test="${wish == 1}">
									<a
										href="<c:url value='javascript:recipeWishlist(${recipe.recipe_idx})'/>"
										class="heart-icon" style="color: #D03737;"><span
										class="fa fa-heart"></span></a>
								</c:when>
								<c:otherwise>
									<a
										href="<c:url value='javascript:recipeWishlist(${recipe.recipe_idx})'/>"
										class="heart-icon"><span class="fa fa-heart"></span></a>
								</c:otherwise>
							</c:choose>
							<ul>
								<!-- 해당 레시피의 인분, 시간 -->
								<li><b>인분 <img
										src="<c:url value='/resources/img/bowl.svg'/>"
										style="margin-top: -2px;"></b> <span>${recipe.getRecipe_portion() }인분</span></li>
								<li><b>시간 <img
										src="<c:url value='/resources/img/timer.svg'/>"
										style="margin-top: -2px;"></b> <span>${recipe.getRecipe_time() }분
										이내</span></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-12">
					<br>
					<hr>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<!-- 레시피 조리 순서 -->
								<div class="section-title">
									<h2>조리 순서</h2>
								</div>
								<c:forEach items="${recipecook }" var="recipecook"
									varStatus="loop">
									<h5 style="line-height: 2; color: #D03737;">Step
										${loop.index + 1}</h5>
									<p style="line-height: 2; color: #666; font-size: 1.25em;">${recipecook }</p>
									<img
										src="<c:url value='../resources/img/recipe/${recipe.recipe_idx }_${loop.index + 1 }.jpg'/>"
										style="margin-bottom: 20px;">
									<p></p>
								</c:forEach>
							</div>
						</div>
						<div class="col-md-6">
							<div class="sticky_box">
								<div class="product__details__tab__desc">
									<!-- 레시피에 사용된 재료 -->
									<div class="section-title">
										<h2>재료</h2>
									</div>
									<c:forEach items="${recipe.getRecipe_all_ingre().split(', ') }"
										var="recipe">
										<p style="line-height: 2; color: #666; font-size: 1.25em;">${recipe }</p>
									</c:forEach>
								</div>
								<hr>
								<%-- 구매창을 재료 부분에 따로 합칠 예정 --%>
								<%-- <section class="related-product">
									<div class="container">
										<div class="row">
											<div class="col-lg-12">
												<div class="section-title related__product__title">
													<h2>관련 상품</h2>
												</div>
											</div>
										</div>
										<div class="row">
											<c:forEach items="${recipe_ingre }" var="list"
												varStatus="loop">
												<div class="col-lg-3 col-md-4 col-sm-6">
													<div class="product__item">
														<div class="container__svg"
															style="justify-content: space-between;">
															<!--
																	회원 맞춤으로 알레르기, 비선호 재료 필터링
																	-> 필터링된 재료는 어둡게하고 아이콘 표시
																-->
															<c:choose>
																<c:when test="${list.ingre_content eq '알레르기 주의 식품' }">
																	<input class="check" type="checkbox"
																		value="${list.ingre_idx }">
																	<img src="<c:url value='/resources/img/warn.svg'/>">
																</c:when>
																<c:when test="${list.ingre_content eq '비선호 식품' }">
																	<input class="check" type="checkbox"
																		value="${list.ingre_idx }">
																	<img src="<c:url value='/resources/img/dislike.svg'/>">
																</c:when>
																<c:otherwise>
																	<input class="check" type="checkbox" checked
																		value="${list.ingre_idx }"></input>
																</c:otherwise>
															</c:choose>
														</div>
														<!-- 관련 재료의 찜 기능 -->
														<ul class="product__item__pic__hover">
															<c:choose>
																<c:when
																	test="${not empty member and allIngreWishlist.get(loop.index) == 1}">
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
														<!-- 관련 재료 이름, 가격 -->
														<div class="product__item__text">
															<h6>
																<a
																	href="<c:url value='/ingre-detail/${list.ingre_idx }'/>">${list.ingre_name }</a>
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
								</section>
								<section class="related-product">
									<!-- 관련 재료 한번에 장바구니 담기-->
									<div class="container">
										<button class="site-btn float-center" id="getCheckedValues">선택
											상품 장바구니 담기</button>
										<br></br>
									</div>
								</section> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- </div> -->
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
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
				<c:forEach items="${recipe_ingre }" var="list" varStatus="loop">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
							<!-- 알러지, 비선호 식품 필터링 -->
							<div class="container__svg"
								style="justify-content: space-between;">
								<c:choose>
									<c:when test="${list.ingre_content eq '알레르기 주의 식품' }">
										<input class="check" type="checkbox"
											value="${list.ingre_idx }">
										<div class="product__item__pic set-bg"
											data-setbg="<c:url value='../resources/img${list.ingre_img }'/>"
											onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
											style="cursor: pointer; position: relative; background: url('<c:url value='../resources/img${list.ingre_img }'/>') center/cover;">
											<div class="product__item__pic__black"></div>
											<img src="<c:url value='/resources/img/warn.svg'/>"
												class="product__pic__allergy__dislike">
										</div>
									</c:when>
									<c:when test="${list.ingre_content eq '비선호 식품' }">
										<input class="check" type="checkbox"
											value="${list.ingre_idx }">
										<div class="product__item__pic set-bg"
											data-setbg="<c:url value='../resources/img${list.ingre_img }'/>"
											onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
											style="cursor: pointer; position: relative; background: url('<c:url value='../resources/img${list.ingre_img }'/>') center/cover;">
											<div class="product__item__pic__black"></div>
											<img src="<c:url value='/resources/img/dislike.svg'/>"
												class="product__pic__allergy__dislike">
										</div>
									</c:when>
									<c:otherwise>
										<input class="check" type="checkbox" checked
											value="${list.ingre_idx }"></input>
										<div class="product__item__pic set-bg"
											data-setbg="<c:url value='../resources/img${list.ingre_img }'/>"
											onclick="window.location.href = '<c:url value='/ingre-detail/${list.ingre_idx }'/>'"
											style="cursor: pointer;"></div>
									</c:otherwise>
								</c:choose>
							</div>

							<ul class="product__item__pic__hover">
								<c:choose>
									<c:when
										test="${not empty member and allIngreWishlist.get(loop.index) == 1}">
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
	<section class="related-product">
		<div class="container">
			<button class="site-btn float-center" id="getCheckedValues">선택
				상품 장바구니 담기</button>
			<br></br>
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