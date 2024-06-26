function findAddr() {
	new daum.Postcode({
		oncomplete : function(data) {

			var addr = data.roadAddress;

			document.getElementById("addr").value = addr;
			document.getElementById("extraAddr").focus();
		}
	}).open();
}