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
<title>Thông tin khách hàng</title>
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
			<li><a href="showCustomer.jsp">Quản lý khách hàng</a></li>
			<li><a href="#">Thông tin khách hàng</a></li>
		</ul>
		<h2>Thông tin khách hàng</h2>
		<%
			String id = request.getParameter("id");
			Customer customer = CustomerDAO.customerMap.get(id);
		%>
		<div class="row">
			<div class="col-md-2 col-md-offset-2 col-sm-3">Tên khách hàng:</div>
			<div class="col-md-6 col-sm-9">
				<%=customer.getCustomerName()%>
			</div>
			<div class="col-md-2 col-md-offset-2 col-sm-3">Tài khoản:</div>
			<div class="col-md-6 col-sm-9">
				<%=customer.getUserName()%>
			</div>
			<div class="col-md-2 col-md-offset-2 col-sm-3">Mật khẩu:</div>
			<div class="col-md-6 col-sm-9">
				<%=customer.getPassWord()%>
			</div>
			<div class="col-md-2 col-md-offset-2 col-sm-3">Số điện thoại:</div>
			<div class="col-md-6 col-sm-9">
				<%=customer.getPhoneNumber()%>
			</div>
		</div>
	</div>
</body>
</html>