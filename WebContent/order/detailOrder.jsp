<%@page import="dao.OrderDAO"%>
<%@page import="dao.OrderItemDAO"%>
<%@page import="model.Order"%>
<%@page import="model.ConnectDTB"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thông tin đơn đặt hàng</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/form-validate.js"></script>
</head>
<body>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<div class="container">
	<ul class="breadcrumb">
			<li><a href="index.jsp">Trang chủ</a></li>
			<li><a href="showOrder.jsp">Quản lý đơn hàng</a></li>
			<li><a href="#">Thông tin đơn đặt hàng</a></li>
		</ul>
		<h2>Thông tin đơn đặt hàng</h2>
		<%
			String id = request.getParameter("id");
			Order order = OrderDAO.orderMap.get(id);
		%>
		<%=order.getOrderDate()%>
		<div class="row"></div>
	</div>
</body>
</html>