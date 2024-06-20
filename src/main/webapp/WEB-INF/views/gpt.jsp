<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ChatGPT</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<h1>ChatGPT</h1>
	<div>
		<textarea id="question" rows="4" cols="50"
			placeholder="Ask a question..."></textarea>
		<br />
		<button id="askButton">Ask</button>
	</div>
	<div id="response" style="margin-top: 20px;">
		<h2>Response:</h2>
		<p id="responseText"></p>
	</div>

	<script>
		$(document).ready(function() {
			$('#askButton').click(function() {
				var question = $('#question').val();
				$.ajax({
					url : '<c:url value="/chatbot/ask" />',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify({
						question : question
					}),
					success : function(response) {
						$('#responseText').text(response);
					},
					error : function(xhr, status, error) {
						$('#responseText').text('An error occurred: ' + error);
					}
				});
			});
		});
	</script>
</body>
</html>
