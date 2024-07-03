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
		data-setbg="resources/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>장바구니</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Wide Banner Section End -->

	<!-- 장바구니 Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">

						<c:choose>
							<c:when test="${empty member}">
								<!-- 로그인 시 이용가능 -->
								<section class="shoping-cart spad">
									<div class="section-title">
										<h2>로그인 후 이용해주세요.</h2>
									</div>
									<div class="col-lg-12"
										style="display: block; text-align: center;">
										<a href="<c:url value='/login' />" class="primary-btn">로그인하러가기</a>
									</div>
								</section>
							</c:when>
							<c:when test="${empty cartList}">
								<!-- 장바구니가 비었을 때 -->
								<section class="shoping-cart spad">
									<div class="section-title">
										<h2>장바구니에 담긴 상품이 없습니다.</h2>
									</div>
									<div class="col-lg-12"
										style="display: block; text-align: center;">
										<a href="<c:url value='/' />" class="primary-btn">쇼핑하러가기</a>
									</div>
								</section>
							</c:when>
							<c:otherwise>
								<div class="cartCheckbox">
									<input id="checkAll" class="check" type="checkbox" checked
										onclick="toggleCheckboxes(this)"> <a
										href="javascript:deleteSelectedItems()"><span
										class="deleteCart">선택 삭제</span></a>
								</div>
								<table>
									<thead>
										<tr>
											<th class="shoping__product">상품</th>
											<th>알레르기/비선호</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
												<c:forEach items="${cartList}" var="list">
													<tr>
														<c:choose>
															<c:when test="${list.ingre_status eq '알레르기 주의 식품' }">
																<td class="shoping__cart__item"><input
																	id="checkEach" class="check mr-3" type="checkbox" checked
																	data-ingre-idx="${list.ingre_idx}"
																	data-mem-id="${list.mem_id}"> <img
																	src="<c:url value='./resources/img${list.ingre_img }'/>"
																	alt="${list.ingre_name}"
																	style="max-width: 30%; height: auto;">
																	<h5>${list.ingre_name}</h5></td>
																	<td class="shoping__cart__allergy__dislike"><span><img
																		src="<c:url value='/resources/img/warn.svg'/>"
																		style="margin-top: -2px;"></span></td>
															</c:when>
															<c:when test="${list.ingre_status eq '비선호 식품' }">
																<td class="shoping__cart__item"><input
																	id="checkEach" class="check mr-3" type="checkbox" checked
																	data-ingre-idx="${list.ingre_idx}"
																	data-mem-id="${list.mem_id}"> <img
																	src="<c:url value='./resources/img${list.ingre_img }'/>"
																	alt="${list.ingre_name}"
																	style="max-width: 30%; height: auto;">
																	<h5>${list.ingre_name}</h5></td>
																	<td class="shoping__cart__allergy__dislike"><span><img
																		src="<c:url value='/resources/img/dislike.svg'/>"
																		style="margin-top: -2px;"></span></td>
															</c:when>
															<c:otherwise>
																<td class="shoping__cart__item"><input
																	id="checkEach" class="check mr-3" type="checkbox" checked
																	data-ingre-idx="${list.ingre_idx}"
																	data-mem-id="${list.mem_id}"> <img
																	src="<c:url value='./resources/img${list.ingre_img }'/>"
																	alt="${list.ingre_name}"
																	style="max-width: 30%; height: auto;">
																	<h5>${list.ingre_name}</h5></td>
																	<td class="shoping__cart__allergy__dislike"></td>
															</c:otherwise>
														</c:choose>
														<td class="shoping__cart__quantity">
															<div class="quantity">
																<div class="pro-qty">
																	<input type="text" value="${list.ingre_cnt}"
																		name="cntValue">
																</div>
																<input type="hidden" value="${list.basket_idx}"
																	name="idxValue"> <input type="hidden"
																	value="${list.ingre_idx}" name="ingreValue">
															</div>
														</td>
														<td class="shoping__cart__total"><fmt:formatNumber
																value="${list.ingre_price*list.ingre_cnt}"
																pattern="#,###" />원</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>

			<c:choose>
				<c:when test="${empty member}" />
				<c:when test="${empty cartList}" />
				<c:otherwise>
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__btns">
								<a href="javascript:continueShopping()"
									class="primary-btn cart-btn">쇼핑 계속하기</a> <a
									href="javascript:updateCart()"
									class="primary-btn cart-btn cart-btn-right">장바구니 수정</a>
							</div>
						</div>
						<div class="col-lg-6"></div>

						<div class="col-lg-6">
							<div class="shoping__checkout">
								<h5>총 결제금액</h5>
								<ul>
									<c:choose>
										<c:when test="${sum>=50000}">
											<li>상품금액 <span><fmt:formatNumber value="${sum}"
														pattern="#,###" />원</span></li>
											<li>배송비 <span>무료배송</span></li>
											<li>결제예정금액 <span><fmt:formatNumber value="${sum}"
														pattern="#,###" />원</span></li>
										</c:when>

										<c:when test="${sum<50000}">
											<li>상품금액 <span><fmt:formatNumber value="${sum}"
														pattern="#,###" />원</span></li>
											<li>배송비 <span>3,000원</span></li>
											<li>결제예정금액 <span><fmt:formatNumber
														value="${sum+3000}" pattern="#,###" />원</span></li>
										</c:when>
										<c:otherwise />
									</c:choose>
								</ul>
								<a href="checkout" class="primary-btn">구매하기</a>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</section>
	<!-- 장바구니 Section End -->
	
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

</body>
</html>
