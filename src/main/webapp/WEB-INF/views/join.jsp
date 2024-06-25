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

	<!-- Breadcrumb Section Begin 바꿔야 할 부분-->
	<section class="breadcrumb-section set-bg"
		data-setbg="resources/img/breadcrumb.jpg">
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
	<!-- Breadcrumb Section End -->

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
						<!-- form 시작 -->
						<form action="/foodie/join.do" method="post">
							<div class="form-group">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id" name="mem_id"
									placeholder="아이디를 입력하세요" required>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="pw" name="mem_pw"
									placeholder="비밀번호를 입력하세요" required>
							</div>
							<div class="form-group">
								<label for="pwck">비밀번호 확인</label> <input type="password"
									class="form-control" id="pwck" name="mem_pwck"
									placeholder="비밀번호를 다시 입력하세요" required>
							</div>
							<div class="form-group">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" name="mem_email"
									placeholder="이메일을 입력하세요" required>
							</div>
							<div class="form-group">
								<label for="phoneNumber">전화번호</label> <input type="tel"
									class="form-control" id="tel" name="mem_tel"
									placeholder="전화번호를 입력하세요" required>
							</div>
							<div class="form-group">
								<label for="addr">주소</label>
								<button type="button" onclick="daumPost()">주소 찾기</button>
								<input type="text" class="form-control" id="addr"
									name="mem_addr" required readonly> <input type="text"
									class="form-control" id="extraAddr" name="mem_extraAddr"
									placeholder="나머지 주소를 입력하세요" required>
							</div>

							<label>알레르기 또는 비선호 식재료를 선택해주세요!</label>
							<div class="mypage__content">
								<table>
									<thead>
										<tr>
											<th colspan="4"><h3>알레르기</h3></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><label><input type="checkbox"
													name="allergy_list" value="1">알류</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="2">우유</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="3">메밀</label></td>
											<td><label><input type="checkbox"
													name="allergy_liste" value="4">땅콩</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox"
													name="allergy_list" value="5">대두</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="6">밀</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="7">고등어</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="8">게</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox"
													name="allergy_list" value="9">새우</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="10">돼지고기</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="11">소고기</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="12">닭고기</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox"
													name="allergy_list" value="13">복숭아</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="14">토마토</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="15">호두</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="16">잣</label></td>
										</tr>
										<tr>
											<td><label><input type="checkbox"
													name="allergy_list" value="17">오징어</label></td>
											<td><label><input type="checkbox"
													name="allergy_list" value="18">조개류</label></td>
											<td></td>
											<td></td>
										</tr>
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
										<tr>
											<td><label><input type="checkbox"
													name="dislike_name" value="오이">오이</label></td>
											<td><label><input type="checkbox"
													name="dislike_name" value="버섯">버섯</label></td>
											<td><label><input type="checkbox"
													name="dislike_name" value="당근">당근</label></td>
											<td><label><input type="checkbox"
													name="dislike_name" value="생강">생강</label></td>
											<td><label><input type="checkbox"
													name="dislike_name" value="아보카도">아보카도</label></td>
										</tr>
									</tbody>
								</table>
							</div>

							<br></br>
							<button type="submit" class="site-btn float-center">회원가입</button>
							<br></br>
						</form>
						<!-- form 끝 -->
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
	<!-- 다음 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 주소 찾기 창 띄우기 -->
	<script>
		function findPost() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = data.roadAddress;

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					// document.getElementById('postcode').value = data.zonecode;
					document.getElementById("addr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("extraAddr").focus();
				}
			}).open();
		}
	</script>
</body>
</html>