<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Foodie</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
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
            <a href="/"><img src="resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
            	<!-- 찜 -->
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <!-- 장바구니 -->
                <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> 로그인 / 회원가입</a>
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
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">주부 레시피</a></li>
                            <li><a href="#">키즈 레시피</a></li>
                            <li><a href="#">자취생 레시피</a></li>
                            <li><a href="#">다이어트 레시피</a></li>
                            <li><a href="#">캠핑 레시피</a></li>
                            <li><a href="recipe">파티 레시피</a></li>
                            <li><a href="#">야식 레시피</a></li>
                            <li><a href="shopgrid">재료 사러가기</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
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
    <section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
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
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 장바구니 목록출력!! 반복문 사용-->
                            <c:forEach items="${ingre_list}" var="ingre">
                            	<tr>
                            		<td class="shoping__cart__item">
                                        <img src="resources/img/cart/cart-1.jpg" alt="">
                                        <h5>${ingre_name}</h5>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                            		<td class="shoping__cart__total">
                                        ${ingre_price }원
                                    </td>
                                    <!-- 해당항목삭제 -->
                                    <td class="shoping__cart__item__close">
                                    	<a href=""><span class="icon_close"></span></a>
                                    </td>
                            	</tr>                            
                            </c:forEach>
                            
                            </tbody>
                        </table>
                            <!-- 반복문 끝 -->
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="resources/img/cart/cart-1.jpg" alt="">
                                        <h5>${ingre_name }</h5>
                                    </td>
                                    
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="2">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${ingre_price }원
                                    </td>
                                    <!-- 해당항목삭제 -->
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="resources/img/cart/cart-2.jpg" alt="">
                                        <h5>장바구니 목록 예시2</h5>
                                    </td>
                                    
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        15200원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="resources/img/cart/cart-3.jpg" alt="">
                                        <h5>유기농 바나나</h5>
                                    </td>
                                    
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        5300원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="shopdetail" class="primary-btn cart-btn">쇼핑 계속하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            장바구니 수정</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>총 결제금액</h5>
                        <ul>
                            <li>상품금액 <span>28000원</span></li>
                            <li>배송비 <span>3000원</span></li>
                            <li>결제예정금액 <span>31000원</span></li>
                        </ul>
                        <a href="checkout" class="primary-btn">구매하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/mixitup.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
</body>
</html>