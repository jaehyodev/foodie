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
		data-setbg="<c:url value='/resources/img/breadcrumb.jpg'/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>찜 목록</h2>
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

	<section class="wishlist-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="mypage__sidebar">
						<h2>마이 페이지</h2>
						<ul>
							<li><a href="mypage">주문 내역</a></li>
							<li class="active"><a href="wishlist">찜 목록</a></li>
							<li><a href="allergy">알레르기 / 비선호 식재료</a></li>
							<li><a href="update">개인 정보 수정</a></li>
							<li><a href="updatepw">비밀번호 변경</a></li>
							<li><a href="delete">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="mypage__content">

						<!-- 레시피 찜 목록 데이터 출력 -->
						<h3>레시피 찜</h3>
						<table id="mypage__recipe" class="mypage__wishlist">
							<thead>
								<tr>
									<th><input class="check" type="checkbox"
										onclick="checkRecipesAll(this)"></th>
									<th colspan="2"><a
										href="javascript:deleteSelectedRecipes()"
										class="wishlist__delete">선택된 목록 삭제</a></th>
									<th class="wishlist__deleteText">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${recipeWishlist}" var="recipe">
									<tr>
										<td><input type="checkbox" class="recipeCheckbox check"
											value="${recipe.recipe_idx}"></td>
										<td>
											<div class="wishlist__img">
												<a
													href="<c:url value='/recipedetails/${recipe.recipe_idx}'/>"><img
													src="<c:url value='/resources/img${recipe.recipe_title_img}'/>"
													alt="${recipe.recipe_name}"> </a>
											</div>
										</td>
										<td><a
											href="<c:url value='/recipedetails/${recipe.recipe_idx}'/>"
											class="wishlist__name"> ${recipe.recipe_name} </a> <br />
											<div class="wishlist__content">${recipe.recipe_content}</div>
										</td>
										<td><a
											href="javascript:deleteRecipe(${recipe.recipe_idx})"
											class="wishlist__delete">❌</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h3>재료 찜</h3>
						<table id="mypage__ingre" class="mypage__wishlist">
							<thead>
								<tr>
									<th><input class="check" type="checkbox"
										onclick="checkIngresAll(this)"></th>
									<th colspan="2"><a
										href="javascript:deleteSelectedIngres()"
										class="wishlist__delete">선택된 목록 삭제</a></th>
									<th class="wishlist__deleteText">삭제</th>
								</tr>
							</thead>
							<tbody>
								<!-- 재료 찜 목록 데이터 출력 -->
								<c:forEach items="${ingreWishlist}" var="ingredient">
									<tr>
										<td><input type="checkbox" class="ingreCheckbox check"
											value="${ingredient.ingre_idx}"></td>
										<td>
											<div class="wishlist__img">
												<a
													href="<c:url value='/shopdetail/${ingredient.ingre_idx}'/>"><img
													src="<c:url value='/resources/img${ingredient.ingre_img}'/>"
													alt="${ingredient.ingre_name}"> </a>
											</div>
										</td>
										<td><a
											href="<c:url value='/shopdetail/${ingredient.ingre_idx}'/>"
											class="wishlist__name">${ingredient.ingre_name}</a> <br />
											<div class="wishlist__content">${ingredient.ingre_content}</div>
										</td>
										<td><a
											href="javascript:deleteIngre(${ingredient.ingre_idx})"
											class="wishlist__delete">❌</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>
	<script src="<c:url value='/resources/js/wishlist.js' />"></script>

</body>
</html>