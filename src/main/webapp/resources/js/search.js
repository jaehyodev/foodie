/* 검색 기능 */

function search() {
	var keyword = document.getElementById("input-search").value;
	if (keyword.trim() !== "") {
		var baseUrl = "/search/";
		var url = baseUrl + encodeURIComponent(keyword);
		location.href = url;
	} else {
		showPopup("검색어를 입력해주세요.");
	}
}

function setupSearch() {
	var input = document.getElementById("input-search");
	input.addEventListener("keydown", function(event) {
		if (event.key === "Enter") {
			event.preventDefault();
			search();
		}
	});
}

window.onload = setupSearch;