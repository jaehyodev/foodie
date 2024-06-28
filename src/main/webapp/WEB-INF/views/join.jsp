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
						<h2>회원가입</h2>
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

	<section class="join-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-8">
					<div class="register-container">
						<div class="mypage__content">
							<!-- form 시작 -->
							<form action="/foodie/join.do" method="post">
								<div class="form-group">
									<label for="id">아이디</label> <label id="label1"></label> <input
										type="text" class="form-control" id="id" name="mem_id"
										placeholder="아이디를 입력하세요" required>
								</div>


								<div class="form-group">
									<label for="password">비밀번호</label> <input type="password"
										class="form-control" id="pw" name="mem_pw"
										placeholder="비밀번호를 입력하세요" required>

								</div>

								<div class="form-group">
									<label for="pwck">비밀번호 확인</label> <label id="label2"></label> <input
										type="password" class="form-control" id="pwck" name="mem_pwck"
										placeholder="비밀번호를 다시 입력하세요" required>
								</div>

								<div class="form-group">
									<label for="name">이름</label> <label id="label2-1"></label> <input
										type="text" class="form-control" id="name" name="mem_name"
										placeholder="이름를 입력하세요" required>
								</div>

								<div class="form-group">
									<label for="email">이메일</label> <label id="label3"></label> <input
										type="email" class="form-control" id="email" name="mem_email"
										placeholder="이메일을 입력하세요" required>
								</div>
								<div class="form-group">
									<label for="phoneNumber">전화번호</label> <label id="label4"></label>
									<input type="tel" class="form-control" id="tel" name="mem_tel"
										placeholder="전화번호를 입력하세요" required>
								</div>
								<div class="form-group">
									<label for="addr">주소</label>
									<button type="button" class="site-btn findAddrBtn"
										onclick="findAddr()">주소 찾기</button>
									<input type="text" class="form-control" id="addr"
										name="mem_addr" readonly required> <input type="text"
										class="form-control" id="extraAddr" name="mem_extraAddr"
										placeholder="나머지 주소를 입력하세요" required>

								</div>

								<table class="join__allergy__dislike">
									<thead>
										<tr>
											<th colspan="4"><h4>알레르기</h4></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="1">알류</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="2">우유</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="3">메밀</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="4">땅콩</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="5">대두</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="6">밀</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="7">고등어</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="8">게</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="9">새우</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="10">돼지고기</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="11">소고기</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="12">닭고기</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="13">복숭아</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="14">토마토</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="15">호두</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="16">잣</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="17">오징어</label></td>
											<td><label><input type="checkbox" class="check"
													name="allergy_list" value="18">조개류</label></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>

								<table class="join__allergy__dislike">
									<thead>
										<tr>
											<th colspan="5"><h4>비선호 식재료</h4></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><label><input type="checkbox" class="check"
													name="dislike_list" value="1">당근</label></td>
											<td><label><input type="checkbox" class="check"
													name="dislike_list" value="2">버섯</label></td>
											<td><label><input type="checkbox" class="check"
													name="dislike_list" value="3">생강</label></td>
											<td><label><input type="checkbox" class="check"
													name="dislike_list" value="4">아보카도</label></td>
											<td><label><input type="checkbox" class="check"
													name="dislike_list" value="5">오이</label></td>
										</tr>
									</tbody>
								</table>
						</div>
						<button type="submit" class="site-btn joinBtn float-center">회원가입</button>
						<br></br>
						<br></br>
						</form>
						<!-- form 끝 -->
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
	<script src="<c:url value='/resources/js/chatbot.js' />"></script>
	<script src="<c:url value='/resources/js/find-addr.js' />"></script>
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="<c:url value='/resources/js/member.js' />"></script>
	<script src="<c:url value='/resozrces/js/search.js' />"></script>
	<!-- 다음 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>

