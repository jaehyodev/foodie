/* 사이드바가 스크롤바를 따라다니게 만듬 */

// 기본 위치(top)값
var floatPosition = parseInt($(".sidebar__item").css('top'))

// scroll 인식
$(window).scroll(function() {

	// 현재 스크롤 위치
	var currentTop = $(window).scrollTop();
	var bannerTop = currentTop + floatPosition + "px";

	//이동 애니메이션
	$(".sidebar__item").stop().animate({
		"top" : bannerTop
	}, 500);

}).scroll();