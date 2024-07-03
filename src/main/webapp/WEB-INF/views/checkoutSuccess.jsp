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

	<!-- Hero Section Begin -->
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
	<!-- Hero Section End -->

	<!-- Wide Banner Section Begin -->
   <section class="breadcrumb-section set-bg"
      data-setbg="resources/img/breadcrumb.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="breadcrumb__text">
                  <h2>주문/결제</h2>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Wide Banner Section End -->

    <!-- 결제정보 Section Begin -->
    <section class="shoping-cart spad">
      <div class="section-title">
         <h2>주문이 정상적으로 완료되었습니다 !</h2>                  
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="shoping__cart__table">
                  <table>
                     <thead>
                        <tr>
                           <th>주문번호</th>
                           <th>${cart.order_idx}</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th>받는 사람</th>
                           <td>${cart.mem_name} ( ${cart.mem_phone} )</td>
                        </tr>
                        <tr>
                           <th>받는 주소</th>
                           <td>${cart.order_addr}</td>
                        </tr>
                        <tr>
                           <th>주문 일시</th>
                           <td>${cart.ordered_at}</td>
                        </tr>
                        <tr>
                           <th>결제 금액</th>
                           <td><fmt:formatNumber value="${cart.total_amount}" pattern="#,###"/>원</td>                           
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <div class="col-lg-12">
            <span style="display: block; text-align: center;">
               <a href="<c:url value='/mypage' />" class="primary-btn">주문 상세보기</a>               
            </span>            
         </div>
      </div>
   </section>
  <!-- 결제정보 Section End -->

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
	<script src="<c:url value='/resources/js/other-category-list.js' />"></script>
	<script src="<c:url value='/resources/js/search.js' />"></script>

</body>
</html>