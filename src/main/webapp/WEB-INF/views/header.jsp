<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="header__top__left">
						<ul>
							<li>하루 안에 도착하는 푸디 배송 ~ 🚚</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="header__top__right">
						<div class="header__top__right__auth">
							<c:choose>
								<c:when test="${empty member}">
									<span class="auth-link"><a href=<c:url value='/join'/>>회원가입</a></span>
									<span class="auth-link"><a href=<c:url value='/login'/>>로그인</a></span>
									<span class="auth-link"><a
										href=<c:url value='/mypage-btn'/>>마이페이지</a></span>
								</c:when>
								<c:otherwise>
									<div class="login-section">
										<h6>${member.mem_id}님,환영합니다!</h6>
										<a href="mypage" class="mypage-btn">마이페이지</a>
										<form action="logout" method="post" class="logout-form">
											<button type="submit" class="logout-btn">로그아웃</button>
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
					<a href="/foodie"><img
						src="<c:url value='/resources/img/logo.png'/>" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6"></div>
			<div class="col-lg-3"></div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>