// 슬라이드 쇼 관련 코드는 그대로 유지됩니다.
		var slideIndex = 0;
		showSlides();

		function plusSlides(n) {
			slideIndex += n;
			showSlides();
		}

		function showSlides() {
			var slides = document.getElementsByClassName("mySlides");
			if (slideIndex >= slides.length) {
				slideIndex = 0;
			}
			if (slideIndex < 0) {
				slideIndex = slides.length - 1;
			}
			for (var i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slides[slideIndex].style.display = "block";
		}

		setInterval(function() {
			plusSlides(1);
		}, 5000); // 5초마다 슬라이드 변경
		