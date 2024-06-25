<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<li class="active"><a href="allergy">알레르기 / 비선호 식재료</a></li>
							<li><a href="update">개인 정보 수정</a></li>
							<li><a href="updatepw">비밀번호 변경</a></li>
							<li><a href="delete">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="mypage__content">


						<form action="/foodie/updateAllergy" method="post">
							<div class="allergy-container">
								<p>session에 저장되어 있는 사용자 ID : ${member.mem_id}</p>
								<p>list 인덱스 0이 가지고 있는 allergy_idx의 값 : ${allergyIdx}</p>
								<table>
									<thead>
										<tr>
											<th colspan="4"><h3>알레르기</h3></th>
										</tr>
									</thead>

									<input type="hidden" name="deleteAllergy" id="deleteAllergy"
										value="">
									<input type="hidden" name="deleteDislike" id="deleteDislike"
										value="">



									<tbody>
										<c:forEach var="allergy" items="${allergyInfo}"
											varStatus="status">
											<c:if test="${status.index % 4 == 0}">
												<tr>
											</c:if>
											<td><label> <input type="checkbox"
													name="allergy_list" value="${status.index + 1}"
													<c:forEach var="joinAllergyIdx" items="${joinAllergyIdx}">
                          						 						<c:if test="${joinAllergyIdx.allergy_idx == status.index + 1}">
                             						 						checked="on" 
                           												</c:if>
                       												</c:forEach>>
													${allergy.allergy_name}
											</label></td>
											<c:if test="${status.index % 4 == 3 or status.last}">
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>




								<div style="height: 55px;"></div>





								<table>
									<thead>
										<tr>
											<th colspan="5"><h3>비선호 식재료</h3></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="dislike" items="${dislikeInfo}"
											varStatus="status">
											<c:if test="${status.index % 5 == 0}">
												<tr>
											</c:if>
											<td><label> <input type="checkbox"
													name="dislike_list" value="${status.index + 1}"
													<c:forEach var="joinDislikeIdx" items="${joinDislikeIdx}">
                          						 						<c:if test="${joinDislikeIdx.dislike_idx == status.index + 1}">
                             						 						checked="on" 
                           												</c:if>
                       												</c:forEach>>
													${dislike.dislike_name}
											</label></td>
											<c:if test="${status.index % 5 == 4 or status.last}">
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<br></br>

							<div class="form-group">
								<button type="submit" class="site-btn">저장하기</button>
							</div>
						</form>

						<p>알레르기와 비선호 식품을 필터링하여 재료를 추천합니다.</p>

						  <script>
  							  // 현재 위치에서 /foodie/updateAllergy 액션을 가진 폼을 form 변수에 저장
  							  const form = document.querySelector('form[action="/foodie/updateAllergy"]');

							  // id가 deleteAllergy인 hidden input 태그를 찾아감
							  const deleteAllergy = document.getElementById('deleteAllergy');
							  const deleteDislike = document.getElementById('deleteDislike');

							  form.addEventListener('submit', function(event) {
							
							  // 현재 문서에서 name이 allergy_list인 모든 input 요소들을 선택하여 변수에 저장
							  const allergy_list = document.querySelectorAll('input[name="allergy_list"]');
							  // 현재 문서에서 name이 dislike_list인 모든 input 요소들을 선택하여 변수에 저장
							  const dislike_list = document.querySelectorAll('input[name="dislike_list"]');
							
					          // 체크 해제된 알레르기의 value 값을 배열로 변환
						      const uncheckAllergy = Array.from(allergy_list)
						      .filter(checkbox => !checkbox.checked)
						      .map(checkbox => checkbox.value);
							
				    		  // 체크 해제된 비선호 식재료의 value 값을 배열로 변환
							  const uncheckDislike = Array.from(dislike_list)
					          .filter(checkbox => !checkbox.checked)
						      .map(checkbox => checkbox.value);
							
				    		  // 체크 해제된 알레르기 값들을 쉼표로 구분된 문자열로 변환하여 hidden input에 저장
						      deleteAllergy.value = uncheckAllergy.join(',');
							
						      // 체크 해제된 비선호 식재료 값들을 쉼표로 구분된 문자열로 변환하여 hidden input에 저장
						      deleteDislike.value = uncheckDislike.join(',');
							  });
						  </script>

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
</body>
</html>