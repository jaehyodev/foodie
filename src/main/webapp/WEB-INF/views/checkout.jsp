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
<style>
#checkoutInfo .checkoutInfo {
	color: black;
}
</style>
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
		data-setbg="resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>결제</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6>
						<span class="icon_tag_alt"></span> 먹고 싶은 메뉴에 맞게 편리하게 쇼핑해보세요! <a
							href="<c:url value='/' />">계속 쇼핑하기</a>
					</h6>
				</div>
			</div>
			<div class="checkout__form">
				<h4>주문/결제</h4>
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<div class="row">
							<div class="col-lg-6">
								<div class="checkout__input" id="checkoutInfo">
									<p>
										이름<span>*</span>
									</p>
									<input type="text" value="${member.mem_name}" id="member-name"
										class="checkoutInfo">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="checkout__input" id="checkoutInfo">
									<p>
										연락처<span>*</span>
									</p>
									<input type="text" value="${member.mem_phone}"
										id="member-phone" class="checkoutInfo">
								</div>
							</div>
						</div>
						<div class="checkout__input" id="checkoutInfo">
							<p>
								이메일<span>*</span>
							</p>
							<input type="text" value="${member.mem_email}" id="member-email"
								class="checkoutInfo">
						</div>
						<div class="checkout__input" id="checkoutInfo">
							<p>
								주소<span>*</span>
							</p>
							<input type="text" value="${member.mem_addr}" id="member-addr"
								class="checkoutInfo">
						</div>
						<div class="checkout__input">
							<p>
								배송요청사항<span></span>
							</p>
							<input type="text" placeholder="부재시 문앞에 놓아주세요">
						</div>
					</div>
					<!-- 결제예정목록 출력 -->
					<div class="col-lg-4 col-md-6">
						<div class="checkout__order">
							<h4>총 결제금액</h4>
							<div class="checkout__order__products">
								상품 <span>가격</span>
							</div>
							<ul>
								<!-- 장바구니 목록 출력 -->
								<c:forEach items="${cartList}" var="list">
									<li>${list.ingre_name}<span><fmt:formatNumber
												value="${list.ingre_price*list.ingre_cnt}" pattern="#,###" />원</span>
									</li>
								</c:forEach>
							</ul>
							<!-- 50000원 이상 무료배송 로직 -->
							<c:choose>
								<c:when test="${sum>=50000}">
									<div class="checkout__order__subtotal">
										배송비 <span>무료배송</span>
									</div>
									<div class="checkout__order__total">
										총 상품금액 <span id="member-sum"><fmt:formatNumber
												value="${sum}" pattern="#,###" /> <input type="hidden"
											value="${sum}"> 원</span>
									</div>
								</c:when>
								<c:when test="${sum<50000}">
									<div class="checkout__order__subtotal">
										배송비 <span>3,000원</span>
									</div>
									<div class="checkout__order__total">
										총 상품금액 <span id="member-sum"> <fmt:formatNumber
												value="${sum+3000}" pattern="#,###" /> 원
										</span>
									</div>
								</c:when>
								<c:otherwise />
							</c:choose>
							<c:choose>
								<c:when test="${empty member}"></c:when>
								<c:otherwise>
									<div class="checkout__input__checkbox">
										<label for="acc-or"> 결제에 동의하십니까? <input
											type="checkbox" id="acc-or"> <span class="checkmark"></span>
										</label>
									</div>
									<p>
										<b>5만원 이상 구매시 무료배송</b>입니다 .<br> 주문 내용을 다시 한 번 확인해주세요
									</p>
									<div class="checkout__input__checkbox">
										<label for="payment"> 카드결제 <input type="radio"
											name="pay" id="payment" value="card"> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="checkout__input__checkbox">
										<label for="kakaopay"> 카카오페이 <input type="radio"
											name="pay" id="kakaopay" value="kakao"> <span
											class="checkmark"></span>
										</label>
										<button onclick="requestPay()" class="site-btn">결제하기</button>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->


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
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- 결제 api -->
	<script>
		//결제 API
		var IMP = window.IMP;
		IMP.init("imp51542456");
	</script>
</body>
</html>