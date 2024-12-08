<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
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
		<div class="container main-page">
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

					<br>
					<div class="slideshow-container">
						<div class="mySlides fade2">
							<div class="hero__item set-bg main_slideImg"
								data-setbg="<c:url value='/resources/img/recipe/1365_title.jpg' />">
								<div class="hero__text">
									<span>쉽고 빠르게 따라 할 수 있는!</span>
									<h2>
										새내기 요리사 <br />파티 레시피
									</h2>
									<p></p>
									<button class="site-btn" onclick="partyRecipe()">파티
										레시피 보기</button>
								</div>
							</div>
						</div>
						<div class="mySlides fade2">
							<div class="hero__item set-bg main_slideImg"
								data-setbg="<c:url value='/resources/img/recipe/1211_title.jpg' />">
								<div class="hero__text">
									<span>간편하지만 정성스러운 한끼!</span>
									<h2>
										맛있고 든든하게 <br /> 영양 챙기기
									</h2>
									<p></p>
									<button id="bannerBtn2" class="site-btn"
										onclick="aloneRecipe()">자취생 레시피 보기</button>
								</div>
							</div>
						</div>
						<div class="mySlides fade2">
							<div class="hero__item set-bg main_slideImg"
								data-setbg="<c:url value='/resources/img/recipe/1187_title.jpg' />">
								<div class="hero__text">
									<span>아이들이 사랑하는 맛!</span>
									<h2>
										간편하게 준비하는 <br />키즈 레시피
									</h2>
									<p></p>
									<button id="bannerBtn3" class="site-btn" onclick="kidsRecipe()">키즈
										레시피 보기</button>
								</div>
							</div>
						</div>
					</div>
					<br> <a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
						class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- 메인 레시피 화면 -->
	<section class="categories">
		<div class="container main-page">
			<div class="section-title1">
				<h2>인기 레시피👍</h2>
			</div>
			<div class="featured__controls">
				<ul>
					<li>푸디에서 많은 분들이 찾아본 인기 레시피를 소개합니다.</li>
				</ul>
			</div>
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach var="recipe" items="${popularList}">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="<c:url value='/resources/img${recipe.recipe_title_img}'/>"
								onclick="window.location.href = '<c:url value='/recipe-detail/${recipe.recipe_idx}'/>'"
								style="cursor: pointer;"></div>
							<h5>
								<a href="<c:url value='/recipe-detail/${recipe.recipe_idx}'/>"
									class="recipe__title">${recipe.recipe_name}</a>
							</h5>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<section class="categories">
		<div class="container main-page">
			<div class="section-title1">
				<h2>추천 레시피💕</h2>
			</div>
			<div class="featured__controls">
				<ul>
					<li>푸디가 제안하는 레시피로 최고의 요리를 만들어보세요.</li>
				</ul>
			</div>
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach var="recipe" items="${recommendedList}">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="<c:url value= 'resources/img${recipe.recipe_title_img}'/>"
								onclick="window.location.href = '<c:url value='/recipe-detail/${recipe.recipe_idx}'/>'"
								style="cursor: pointer;"></div>
							<h5>
								<a href="<c:url value='/recipe-detail/${recipe.recipe_idx}'/>"
									class="recipe__title">${recipe.recipe_name}</a>
							</h5>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container main-page">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>✨new 레시피✨</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- JSTL을 사용하여 newList를 동적으로 렌더링합니다. -->
				<c:forEach var="recipe" items="${newList}">
					<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic"
								onclick="window.location.href = '<c:url value='/recipe-detail/${recipe.recipe_idx}'/>'"
								style="cursor: pointer;">
								<!-- 이미지 URL을 동적으로 설정 -->
								<img
									src="<c:url value='/resources/img/${recipe.recipe_title_img}' />"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<!-- 날짜를 동적으로 설정 -->
									<li><i class="fa fa-calendar-o"></i>
										${recipe.recipe_posted_at}</li>
								</ul>
								<h5>
									<!-- 레시피 이름을 동적으로 설정 -->
									<a href="<c:url value='/recipe-detail/${recipe.recipe_idx}'/>"
										class="recipe__title">${recipe.recipe_name}</a>
								</h5>
								<p>${recipe.recipe_content}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

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
	<script src="<c:url value='/resources/js/category-list.js' />"></script>
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>
	<script src="<c:url value='/resources/js/mainSlide.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>
	<script>
		function partyRecipe() {
			window.location.href = '/foodie/recipe-grid/파티';
		}
		function aloneRecipe() {
			window.location.href = '/foodie/recipe-grid/자취생';
		}
		function kidsRecipe() {
			window.location.href = '/foodie/recipe-grid/키즈';
		}	
	</script>
	<script>
    /* // new레시피 -> JavaScript로 날짜를 변환하여 출력
    document.addEventListener("DOMContentLoaded", function() {
        const dateElements = document.querySelectorAll(".recipePostedAt");
        const dateStr = dateElements.textContent.trim(); // 앞뒤 공백 제거
     		// 날짜 문자열이 존재하는지 확인
        if (dateStr) {
            console.log("date string:", dateStr); // 2024-07-05 10:57:09
            const date = new Date(dateStr)
            const year = date.getFullYear();
            console.log("year:", year);
            const month = ('0' + (date.getMonth() + 1)).slice(-2);
            console.log("month:", month);
            const day = ('0' + date.getDate()).slice(-2);
            console.log("day:", day);
            const dateStr2 = `${year}`;
            console.log("date string:", dateStr2);
        } else {
            console.error("Date string is empty");
        }
    }); */
	</script>

</body>
</html>