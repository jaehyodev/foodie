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
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
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
    <section class="hero">
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
                            <form action="#">
                                <input type="text" placeholder="">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
   								<button onclick="openChatbot()" id="chatbot-btn"><i class="fa fa-comments"></i></button>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>재료 추천받기</h5>
                                <span>24시간 챗봇 상담</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>갑각류 알레르기도 먹을 수 있는</span>
                            <h2>맛있는 <br />해산물 레시피</h2>
                            <p></p>
                            <a href="#" class="primary-btn">지금 보러가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
        	<div class="section-title">
            	<h2>✨요즘 뜨는 레시피✨</h2>
                </div>
                <div class="featured__controls">
                	<ul>
                    	<li>지금이 가장 맛있게 먹을 찬스 !</li>
                    </ul>
                </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-1.jpg">
                            <h5><a href="#">명란마요초밥</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-2.jpg">
                            <h5><a href="#">매콤홍합탕</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-3.jpg">
                            <h5><a href="#">들기름 막국수</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-4.jpg">
                            <h5><a href="#">마늘통삼겹구이</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-5.jpg">
                            <h5><a href="#">두부참치전</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->
    
    <br></br>
    
    <section class="categories">
        <div class="container">
        	<div class="section-title">
            	<h2>✨Best 레시피✨</h2>
                </div>
                <div class="featured__controls">
                	<ul>
                    	<li>가장 인기있는 레시피만 모아 보세요 !</li>
                    </ul>
                </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-1.jpg">
                            <h5><a href="#">대파파스타</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-2.jpg">
                            <h5><a href="#">고추장크림떡볶이</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-3.jpg">
                            <h5><a href="#">칠리새우덮밥</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-4.jpg">
                            <h5><a href="#">차돌된장찌개</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="resources/img/categories/cat-5.jpg">
                            <h5><a href="#">전복버터밥</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    


    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>🥗Personal 레시피🥗</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food1.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                                
                            </ul>
                            <h5><a href="#">양배추스테이크</a></h5>
                        <p>스테이크는 고기로만 만들 수 있다는 편견을 깨트린 양배추스테이크</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food2.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                             
                            </ul>
                            <h5><a href="#">훈제오리고기포케</a></h5>
                        <p>아직 포케가 익숙하지 않은 분이라면 오리고기로 토핑을 한 훈제오리고기포케에 도전해보세요 !</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="resources/img/blog/sidebar/food3.png" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> July 7,2024</li>
                                
                            </ul>
                            <h5><a href="#">훈제연어포케</a></h5>
                            <p>해산물이 들어간 가장 대표적인 포케</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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
    <script>
        function openChatbot() {
            window.open("/personalrecipe/chatbot", "PersonalTalk", "width=400,height=600");
        }
    </script>
</body>
</html>