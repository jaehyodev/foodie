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

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 먹고 싶은 메뉴에 맞게 편리하게 쇼핑해보세요! <a href="index">계속 쇼핑하기</a>
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>주문/결제</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" value="${member.mem_name }">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>연락처<span>*</span></p>
                                        <input type="text" value="${member.mem_phone }">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="text" value="${member.mem_email }">
                            </div>
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="${member.mem_addr }" class="checkout__input__add">
                                <input type="text" placeholder="주소 세부사항">
                            </div>
                            <div class="checkout__input">
                                <p>배송요청사항<span></span></p>
                                <input type="text" placeholder="부재시 문앞에 놓아주세요">
                            </div>
                            <!--  

                           <div class="checkout__input">
                                <p>Country/State<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <p>Create an account by entering the information below. If you are a returning customer
                                please login at the top of the page</p>
                            <div class="checkout__input">
                                <p>Account Password<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Ship to a different address?
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                            -->
                            
                        </div>
                        
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>총 결제금액</h4>
                                <div class="checkout__order__products">상품 <span>가격</span></div>
                                <ul>
                                <!-- 장바구니 목록 출력 -->
                                	<c:forEach items="${cartList}" var="list">
                                		<li>${list.ingre_name}<span>${list.ingre_price*list.ingre_cnt}원</span></li>
                                	</c:forEach>
                               <!-- <li>목록 예시1 <span>7500원</span></li>
                                    <li>목록 예시2 <span>15200원</span></li>
                                    <li>유기농 바나나 <span>5300원</span></li> -->
                                </ul>
                                <!-- 50000원 이상 무료배송 로직 -->
                                <c:choose>
                                <c:when test="${sum>=50000}">
                                	<div class="checkout__order__subtotal">배송비 <span>무료배송</span></div>
                                	<div class="checkout__order__total">총 상품금액 <span>${sum}원</span></div>
                                </c:when>
                                
                                <c:otherwise>
                                	<div class="checkout__order__subtotal">배송비 <span>3000원</span></div>
                                	<div class="checkout__order__total">총 상품금액 <span>${sum+3000}원</span></div>
                                </c:otherwise>                               
                                </c:choose>
                                
                                <%-- <div class="checkout__order__subtotal">배송비 <span>3000원</span></div>
                                <div class="checkout__order__total">총 상품금액 <span>${sum}원</span></div> --%>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        결제에 동의하십니까?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>
                                <b>5만원 이상 구매시 무료배송</b>입니다 .<br>
                                주문 내용을 다시 한 번 확인해주세요
                                </p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        카드결제
                                        <input type="radio" name="pay" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        간편결제(페이)
                                        <input type="radio" name="pay" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button onclick="requestPay()" class="site-btn">결제하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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
	<script src="<c:url value='/resources/js/checkout.js' />"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->

	<script>
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp51542456");
		/* IMP.agency("imp51542456", 'ABC'); */

		function requestPay() {
			IMP.request_pay({
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid : "ORD20180131-0000011", // 주문번호
				name : "신선한 봉투",
				amount : 64900, // 숫자 타입
				buyer_email : "gildong@gmail.com",
				buyer_name : "이승지",
				buyer_tel : "010-1234-8282",
				buyer_addr : "광주광역시 동구 충장동",
				buyer_postcode : "01181",
			}, function(rsp) { // callback
				//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
				console.log(rsp)
			});
		}
	</script>
</body>
</html>