<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="hero__search">
	<div class="hero__search__form">
		<form action="#">
			<input type="text" placeholder="푸디 제품, 요리명 등 다양하게 검색해보세요 !"
				id="input-search">
			<button type="button" class="site-btn" onclick="search()">검색</button>
		</form>
	</div>
	<div class="header__wishlist__cart">
		<div class="header__wishlist ml-5">
			<a href=<c:url value='/wishlist'/>><i class="fa fa-heart"></i></a>
		</div>
		<div class="header__cart ml-5">
			<a href=<c:url value='/cart'/>><i class="fa fa-shopping-bag"></i></a>
		</div>
	</div>
</div>
<script src="<c:url value='/resources/js/search.js' />"></script>

<script>
	function openLoginPopup() {
	    // 새 창을 엽니다.
	    var popupWidth = 400;
	    var popupHeight = 300;
	    var popupX = (window.screen.width / 2) - (popupWidth / 2);
	    var popupY = (window.screen.height / 2) - (popupHeight / 2);
	    window.open('/login-popup', 'loginPopup', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX);
	}
</script>