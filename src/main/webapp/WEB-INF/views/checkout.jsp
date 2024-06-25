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
	<style>
	#checkoutInfo .checkoutInfo{
		color: black;
	}
	</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
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
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 먹고 싶은 메뉴에 맞게 편리하게 쇼핑해보세요! <a href="shopgrid">계속 쇼핑하기</a>
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>주문/결제</h4>
                <form action="#"><!-- 수정하기! -->
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input" id="checkoutInfo">
                                        <p>이름<span>*</span></p>
                                        <input type="text" value="${member.mem_name}" id="member-name" class="checkoutInfo">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input" id="checkoutInfo">
                                        <p>연락처<span>*</span></p>
                                        <input type="text" value="${member.mem_phone}" id="member-phone" class="checkoutInfo">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input" id="checkoutInfo">
                                <p>이메일<span>*</span></p>
                                <input type="text" value="${member.mem_email}" id="member-email" class="checkoutInfo">
                            </div>
                            <div class="checkout__input" id="checkoutInfo">
                                <p>주소<span>*</span></p>
                                <input type="text" value="${member.mem_addr}" id="member-addr" class="checkoutInfo">
                                <input type="text" placeholder="주소 세부사항" class="checkoutInfo">
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
                                	<div class="checkout__order__total">총 상품금액 <span id="member-sum">${sum}원</span></div>
                                </c:when>
                                <c:when test="${sum<50000 }">
                                	<div class="checkout__order__subtotal">배송비 <span>3000원</span></div>
                                	<div class="checkout__order__total">총 상품금액 <span id="member-sum">${sum+3000}원</span></div>
                                </c:when>
                                <c:otherwise>
                                	<div class="checkout__order__subtotal">배송비 <span>0원</span></div>
                                	<div class="checkout__order__total">총 상품금액 <span>0원</span></div>
                                </c:otherwise>                               
                                </c:choose>
                                
                               
                                <c:choose>
                                	<c:when test="${empty member }"></c:when>
                                	<c:otherwise>
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
                                        <input type="radio" name="pay" id="payment" value="card">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="kakaopay">
                                        카카오페이
                                        <input type="radio" name="pay" id="kakaopay" value="kakao">
                                        <span class="checkmark"></span>
                                    </label>
                                <button onclick="requestPay()" class="site-btn">결제하기</button>
                                </div>
                                	</c:otherwise>
                                </c:choose>
                                
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
	<script src="<c:url value='/resources/js/popup.js' />"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script><!-- 결제 api -->

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	
</body>
<script>
		
		//결제 api
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp51542456");

		//user정보 불러오기
		var merchant_uid = 12128; //주문번호
		var userSum = parseInt(document.querySelector('#member-sum').innerText); //결제 총액
		var userName = document.querySelector('#member-name').value;
		var userPhone = document.querySelector('#member-phone').value;
		var userEmail = document.querySelector('#member-email').value;
		var userAddr = document.querySelector('#member-addr').value;

		function requestPay() {
			console.log(document.querySelector('#member-sum'));
			event.preventDefault();//새로고침 방지
			var checkbox = document.getElementById("acc-or"); //결제동의 체크 시 결제가능
			var selectedOption = document.querySelector('input[name="pay"]:checked'); //결제방법 선택
			var selectedValue = selectedOption.value;
			if(selectedOption){
				if(selectedValue === "card"){ //카드결제
					payInfo = "html5_inicis";
				}else if (selectedValue === "kakao"){ //카카오페이
					payInfo = "kakaopay";
				}else{
					alert("결제방법을 선택해주세요");
				}
			}
			if(checkbox.checked){ //결제 동의 시
				IMP.request_pay({
					pg : payInfo,
					pay_method : "card",
					merchant_uid : merchant_uid, // 주문번호
					name : "Foodie",
					amount : userSum, // 결제 총액
					buyer_email : userEmail, //user email
					buyer_name : userName, //이름
					buyer_tel : userPhone, //번호
					buyer_addr : userAddr, //주소
					buyer_postcode : "01181",
				}, function(rsp) { // callback
					//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
					console.log(rsp)
					if(rsp.success){ //주문완료
						console.log(userAddr)
						$.ajax({
							url : "checkoutSuccess",
							type : "get",
							data : {
								"merchant_uid":rsp.merchant_uid,
								"userAddr":rsp.buyer_addr,
								"userSum":rsp.paid_amount
								},//주문번호,주소,총액
							success : function(){
								showPopup("주문이 완료되었습니다", rsp.merchant_uid);
							},
							error : function(){
								console.log("전송실패")
							}
						})
						
					}else{
						showPopup("결제가 취소되었습니다")
					}
						
						
				});
			}
			
		}
	</script>
</html>