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
						<h2>알레르기 / 비선호 식재료</h2>
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
							<li><a href="update-pw">비밀번호 변경</a></li>
							<li><a href="delete">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="mypage__content">
						<form action="/foodie/update-allergy" method="post">
							<input type="hidden" name="deleteAllergy" id="deleteAllergy"
								value=""> <input type="hidden" name="deleteDislike"
								id="deleteDislike" value="">
							<div class="allergy__dislike__container">
								<table>
									<thead>
										<tr>
											<th colspan="4"><h4>알레르기</h4></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="allergy" items="${allergyInfo}"
											varStatus="status">
											<c:if test="${status.index % 4 == 0}">
												<tr>
											</c:if>
											<td><label> <input class="check" type="checkbox"
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
											<th colspan="5"><h4>비선호 식재료</h4></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dislike" items="${dislikeInfo}"
											varStatus="status">
											<c:if test="${status.index % 5 == 0}">
												<tr>
											</c:if>
											<td><label> <input class="check" type="checkbox"
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
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>

	<script>
	  // 현재 위치에서 /foodie/updateAllergy 액션을 가진 폼을 form 변수에 저장
	  const form = document.querySelector('form[action="/foodie/update-allergy"]');

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
	<!-- 알레르기/비선호 수정하기 클릭 시 팝업창 띄우기 -->
	<script>
      document.addEventListener('DOMContentLoaded', function() {
       // JSP에서 자바스크립트로 플래시 속성을 전달
       var updateStatus = '<c:out value="${updateStatus}" />';
   
       // 회원 정보 수정 성공
       if (updateStatus === 'success') {
            // 새 창을 엽니다.
            var popupWidth = 400;
            var popupHeight = 300;
            var popupX = (window.screen.width / 2) - (popupWidth / 2);
            var popupY = (window.screen.height / 2) - (popupHeight / 2);
            showPopup("알레르기 및 비선호 식재료 수정에 성공했습니다.");
       }
    });
   </script>

</body>
</html>