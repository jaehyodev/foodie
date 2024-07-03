<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSP 페이지 설정: 언어는 Java, 콘텐츠 타입은 text/html, 문자 인코딩은 UTF-8 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 코어 태그 라이브러리 선언: URI는 http://java.sun.com/jsp/jstl/core, 접두사는 "c" -->

<!-- Naver NanumSquare Neo 폰트 스타일시트 링크 -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<header class="header">
   <div class="header__top">
      <div class="container">
         <!-- 상단 헤더 부분 -->
         <div class="row">
            <div class="col-lg-6">
               <div class="header__top__left">
                  <!-- 왼쪽 상단 부분: 배송 안내 -->
                  <ul>
                     <li>하루 안에 도착하는 푸디 배송 ~ 🚚</li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-6">
               <div class="header__top__right">
                  <div class="header__top__right__auth">
                     <!-- 인증 및 로그인 부분 -->
                     <c:choose>
                        <c:when test="${empty member}">
                           <!-- 사용자가 로그인하지 않은 경우 -->
                           <span class="auth-link"><a href=<c:url value='/join'/> >회원가입</a></span>
                           <span class="auth-link"><a href=<c:url value='/login'/> >로그인</a></span>
                           <span class="auth-link"><a href=<c:url value='/mypage'/> >마이페이지</a></span>
                        </c:when>
                        <c:otherwise>
                           <!-- 사용자가 로그인한 경우 -->
                           <div class="login-section">
                              <span>${member.mem_name}님</span>
                              <span><a href=<c:url value='/mypage'/> >마이페이지</a></span>
                              <form action="/foodie/logout" method="post" class="logout-form">
                                 <button type="submit" id ="logoutBtn" class="auth-link" style="cursor: pointer;">로그아웃</button>
                              </form>
                           </div>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <div class="col-lg-3">
            <div class="header__logo">
               <!-- 로고 부분 -->
               <a href="/foodie"><img src="<c:url value='/resources/img/logo.png'/>" alt=""></a>
            </div>
         </div>
         <div class="col-lg-6"></div>
         <div class="col-lg-3"></div>
      </div>
   </div>
</header>
