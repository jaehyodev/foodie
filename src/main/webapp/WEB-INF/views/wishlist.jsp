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
<link rel="stylesheet"
	href="<c:url value='/resources/css/wishlist.css'/>" type="text/css">
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
						<h2>찜 목록</h2>

						<h3>레시피 찜</h3>
						<table id="mypage__recipe">
							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkRecipesAll(this)"></th>
									<th colspan="2"><a
										href="javascript:deleteSelectedRecipes()"
										class="wishlist__delete">선택된 목록 삭제</a></th>
									<th class="wishlist__deleteText">삭제</th>
								</tr>
							</thead>
							<tbody>
								<!-- 레시피 찜 목록 데이터 출력 -->
								<c:forEach items="${recipeWishlist}" var="recipe">
									<tr>
										<td><input type="checkbox" class="recipeCheckbox"
											value="${recipe.recipe_idx}"></td>
										<td>
											<div class="wishlist__img">
												<a href="#"><img
													src="<c:url value='/resources/img/recipe/${recipe.recipe_title_img}'/>"
													alt="${recipe.recipe_name}">
												</a>
											</div>
										</td>
										<td><a href="#">${recipe.recipe_name}</a><br />
											${recipe.recipe_content}</td>
										<td><a
											href="javascript:deleteRecipe(${recipe.recipe_idx})"
											class="wishlist__delete">❌</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<h3>재료 찜</h3>
						<table id="mypage__ingre">
							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkIngresAll(this)"></th>
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
										<td><input type="checkbox" class="ingreCheckbox"
											value="${ingredient.ingre_idx}"></td>
										<td>
											<div class="wishlist__img">
												<a href="#"><img
													src="<c:url value='/resources/img/${ingredient.ingre_img}'/>"
													alt="${ingredient.ingre_name}">
												</a>
											</div>
										</td>
										<td><a href="#">${ingredient.ingre_name}</a><br />
											${ingredient.ingre_content}</td>
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

	<!-- 레시피 찜 목록 체크 시 전체 레시피 체크 -->
	<script>
	  function checkRecipesAll(source) {
	    if (source.checked) {
	      // source 체크박스가 체크되었을 때
	      // 모든 체크박스에 체크를 설정
	      var checkboxes = document
	              .querySelectorAll('#mypage__recipe input[type="checkbox"]');
	      checkboxes.forEach(function(checkbox) {
	      	checkbox.checked = true;
	      });
	    } else {
	      // source 체크박스가 체크 해제되었을 때
	      // 모든 체크박스의 체크를 해제
	      var checkboxes = document
	              .querySelectorAll('#mypage__recipe input[type="checkbox"]');
	      checkboxes.forEach(function(checkbox) {
	      	checkbox.checked = false;
	      });
	    }
	  }
  </script>

	<!-- 재료 찜 목록 체크 시 전체 재료 체크 -->
	<script>
	  function checkIngresAll(source) {
	    if (source.checked) {
			  // source 체크박스가 체크되었을 때
			  // 모든 체크박스에 체크를 설정
			  var checkboxes = document
			  				.querySelectorAll('#mypage__ingre input[type="checkbox"]');
			  checkboxes.forEach(function(checkbox) {
					checkbox.checked = true;
				});
			} else {
				// source 체크박스가 체크 해제되었을 때
				// 모든 체크박스의 체크를 해제
				var checkboxes = document
				        .querySelectorAll('#mypage__ingre input[type="checkbox"]');
				checkboxes.forEach(function(checkbox) {
					checkbox.checked = false;
				});
		  }	
	  }
  </script>

	<!-- 레시피 찜 목록 삭제 -->
	<script>
		// 레시피 찜 목록 개별 삭제
	  function deleteRecipe(recipe_idx) {
	    $.ajax({
	      url: "wishlist/recipe/delete.do",
	      type: "POST",
	      data: {"recipe_idx" : recipe_idx},
	      success: function(data) {
	        if (data == "success") {
	        	location.reload();
	        }
	      },
	      error: function() {
        	alert("레시피 찜 목록 삭제 실패");
	      }
	    })
	  }
    
	  // 레시피 찜 목록 선택된 항목들 삭제
    function deleteSelectedRecipes() {
	    // 체크된 레시피 체크박스의 값들을 수집
	    const checkedboxes = document.querySelectorAll('.recipeCheckbox:checked');
	    const recipeIdxArray = Array.from(checkedboxes).map(checkedbox => parseInt(checkedbox.value, 10));
	
	    if (recipeIdxArray.length === 0) {
	      alert("삭제할 레시피 항목을 선택해주세요.");
	      return;
	    }
	
	 		// Ajax 요청으로 서버에 레시피 찜 목록 선택된 항목들만 삭제 요청
	    $.ajax({
	      url: "wishlist/recipe/deleteSelected.do",
	      type: "POST",
	      contentType: "application/json",
	      data: JSON.stringify(recipeIdxArray),
	      success: function(data) {
					if (data === "success") {
		        location.reload();
		      }
	      },
	      error: function() {
	      	alert("레시피 찜 목록 삭제 실패");
	      }
	    });
    }
  </script>

	<!-- 재료 찜 목록 삭제 -->
	<script>
		// 재료 찜 목록 개별 삭제
	  function deleteIngre(ingre_idx) {
	    $.ajax({
	      url: "wishlist/ingre/delete.do",
	      type: "POST",
	      data: {"ingre_idx" : ingre_idx},
	      success: function(data) {
	        if (data == "success") {
	        	location.reload();
	        }
	      },
	      error: function() {
        	alert("재료 찜 목록 삭제 실패");
	      }
	    })
	  }
    
	  // 재료 찜 목록 선택된 항목들 삭제
    function deleteSelectedIngres() {
	    // 체크된 레시피 체크박스의 값들을 수집
	    const checkedboxes = document.querySelectorAll('.ingreCheckbox:checked');
	    const ingreIdxArray = Array.from(checkedboxes).map(checkedbox => parseInt(checkedbox.value, 10));
	
	    if (ingreIdxArray.length === 0) {
	      alert("삭제할 재료 항목을 선택해주세요.");
	      return;
	    }
	
	    // Ajax 요청으로 서버에 재료 찜 목록 선택된 항목들만 삭제 요청
	    $.ajax({
	      url: "wishlist/ingre/deleteSelected.do",
	      type: "POST",
	      contentType: "application/json",
	      data: JSON.stringify(ingreIdxArray),
	      success: function(data) {
					if (data === "success") {
		        location.reload();
		      }
	      },
	      error: function() {
	      	alert("재료 찜 목록 삭제 실패");
	      }
	    });
    }
  </script>
</body>
</html>
