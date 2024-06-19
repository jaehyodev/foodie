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
            <a href="index"><img src="resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
            	<!-- 찜 -->
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <!-- 장바구니 -->
                <li><a href="cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <!-- 장바구니 총 금액 -->
        </div>
        <div class="humberger__menu__widget">
            <!-- <div class="header__top__right__language">
                <img src="resources/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                	언어 선택
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div> -->
            <div class="header__top__right__auth">
                <a href="login"><i class="fa fa-user"></i> 로그인 / 회원가입</a>
            </div>
        </div>
        <!-- 상단 메뉴바  -->
        <!-- <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="index">Home</a></li>
                <li><a href="#">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="#">Shop Details</a></li>
                        <li><a href="cart">Shoping Cart</a></li>
                        <li><a href="#">Check Out</a></li>
                        <li><a href="#">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="#">레시피</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav> -->
        <div id="mobile-menu-wrap"></div>
        <!-- <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div> -->
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
    <!-- 카테고리 -->
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
                            <li><a href="#">초간단 레시피</a></li>
                            <li><a href="#">혼밥 레시피</a></li>
                            <li><a href="#">자취생 레시피</a></li>
                            <li><a href="#">손님 접대 레시피</a></li>
                            <li><a href="#">다이어트 레시피</a></li>
                            <li><a href="recipe">제철 요리 레시피</a></li>
                            <li><a href="#">이국적인 요리 레시피</a></li>
                            <li><a href="#">별미 / 야식 레시피</a></li>
                            <li><a href="recipe">디저트 레시피</a></li>
                            <li><a href="#">밑반찬 레시피</a></li>
                            <li><a href="shopgrid">재료 사러가기</a></li>
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

    <!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>레시피</h2>
                        <!-- <div class="breadcrumb__option">
                            <a href="./index.jsp">카테고리</a>
                            <a href="./index.jsp">수산</a>
                            <span>Vegetable’s Package</span>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                        	<!-- 재료 대표 사진 -->
                            <img class="product__details__pic__item--large"
                                src="resources/img/recipe/recipe1.jpg" alt="">
                        </div>
                        <!-- 재료 사진 슬라이더 -->
                        <!-- <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="resources/img/product/corvina.jpg"
                                src="resources/img/product/corvina.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/corvina-2.jpg"
                                src="resources/img/product/corvina-2.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/corvina3.jpg"
                                src="resources/img/product/corvina3.jpg" alt="">
                            <img data-imgbigurl="resources/img/product/corvina4.jpg"
                                src="resources/img/product/corvina4.jpg" alt="">
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>양배추참치덮밥</h3>
                        <!-- <div class="product__details__rating">
                        	평점
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div> -->
                        <!-- 가격 -->
                        <h5>간편하고 손쉽게 완성할 수 있는 양배추덮밥</h5>
                        <br></br>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>양</b> <span>1인분</span></li>
                            <li><b>시간</b> <span>15분 이내</span></li>
                            <li><b>난이도</b> <span>초급</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">재료</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">조리 순서</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>재료</h6>
                                    <p>양배추 200g</p>
                                    <p>현미밥 200g</p>
                                    <p>참치캔 150g</p>
                                    <p>양파 1/2개</p>
                                    <p>마늘 2쪽</p>
                                    <p>올리브유 2큰술</p>
                                    <p>굴소스 1큰술</p>
                                    <p>들기름·파슬리 약간씩</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>조리순서</h6>
                                    <p>1. 양배추는 깨끗이 씻어 꼭지를 제거한 후 적당한 크기로 채 썰어주세요.</p>
                                    <p>2. 양파는 채 썰고, 마늘은 다져주세요.</p>
									<p>3. 중불로 달군 팬에 올리브유를 두르고 다진 마늘을 넣어 향이 올라오면 양파와 양배추를 넣고 볶아주세요.</p>
									<p>4. ③의 숨이 죽으면 현미밥, 참치, 굴소스를 넣어 1분간 볶다가 불을 끄고 들기름을 둘러주세요.</p>
									<p>5. 그릇에 현미밥을 담고 ④를 얹은 후 파슬리를 뿌려 완성해 주세요.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <!-- 관련상품 -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>관련 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/cabbage.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">양배추</a></h6>
                            <h5>3,850원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/garlic.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">깐마늘</a></h6>
                            <h5>3,200원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/onion.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">깐양파</a></h6>
                            <h5>2,800원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/tuna.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">참치</a></h6>
                            <h5>3,340원</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/oyster_sauce.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">굴소스</a></h6>
                            <h5>7,200원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/brownrice.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">현미</a></h6>
                            <h5>8,300원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/olive_oil.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">올리브유</a></h6>
                            <h5>31,500원</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <!-- <div class="product__item">
                    	<input class="check" type="checkbox" checked></input>
                        <div class="product__item__pic set-bg" data-setbg="resources/img/product/tuna.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">참치</a></h6>
                            <h5>3,340원</h5>
                        </div>
                    </div> -->
            		
                </div>
            </div>
        </div>
    </section>
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>대체 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<p class="float-center">대체할 상품이 없습니다.</p>
            	<br></br>
            </div>
            <a href="#" class="primary-btn float-center">선택 상품 장바구니 담기</a>
            <br></br>
        </div>
    </section>
    <!-- Related Product Section End -->
	
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