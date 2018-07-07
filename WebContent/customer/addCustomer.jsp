<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thêm khách hàng</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/form-validate.js"></script>
</head>
<body>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.jsp">Trang chủ</a></li>
			<li><a href="showCustomer.jsp">Quản lý khách hàng</a></li>
			<li><a href="#">Thêm khách hàng</a></li>
		</ul>
		<h2>Thêm khách hàng</h2>
		<form class="form-horizontal" action="customer?function=add"
			method="post" id="addCustomerForm">
			<div class="form-group">
				<label class="control-label col-sm-3" for="customerName">Tên
					khách hàng</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="customerName"
						placeholder="Nhập tên" name="customerName">
					<p id="error_customerName"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="userName">Tên tài
					khoản</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="userName"
						placeholder="Nhập tên tài khoản" name="userName">
					<p id="error_userName"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="password">Mật
					khẩu</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="password"
						placeholder="Nhập mật khẩu" name="password">
					<p id="error_passWord"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="phoneNumber">Số
					điện thoại</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="phoneNumber"
						placeholder="Nhập số điện thoại" name="phoneNumber">
					<p id="error_phoneNumber"></p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-2">
					<button type="submit" class="btn btn-primary">Thêm</button>
				</div>
			</div>
		</form>
	</div>
	<!-- end container -->

</body>
</html>