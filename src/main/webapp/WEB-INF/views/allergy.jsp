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
							<li><a href="<c:url value='/recipe/주부'/>">레시피 보러가기</a></li>
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
							<input type="hidden" name="deleteAllergy" id="deleteAllergy"
								value=""> <input type="hidden" name="deleteDislike"
								id="deleteDislike" value="">
							<div class="allergy-container">
								<table>
									<thead>
										<tr>
											<th colspan="4"><h3>알레르기</h3></th>
										</tr>
									</thead>
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
</body>
</html>