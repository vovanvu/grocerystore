<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>VGStore</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">


<style type="text/css">
.cha {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 170px;
}

.con {
	margin: auto;
}

#git {
	width: 150px;
}

body {
	background: #107896;
	color: #FFF;
}
</style>
</head>
<body>
	<jsp:include page="menu/menu.jsp"></jsp:include>
	<div class="cha">
		<h2 class="con">VGStore - Best Grocery Item For The Best Life</h2>
		<h3 class="con">Basic CRUD Web App Project using JSP/Servlet -
			Java</h3>
		<a id="git" class="btn btn-default con" href="https://github.com/vovanvu/grocerystore" target="blank"><i
			class="fa fa-github fa-lg" id="github-icon"></i> Source on <i>GitHub</i></a>
	</div>
</body>
</html>