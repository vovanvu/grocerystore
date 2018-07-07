<%@page import="model.ConnectDTB"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProducerDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thông tin sản phẩm</title>
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
			<li><a href="showProduct.jsp">Quản lý sản phẩm</a></li>
			<li><a href="#">Thông tin sản phẩm</a></li>
		</ul>
		<h2>Thông tin sản phẩm</h2>
		<%
			String id = request.getParameter("id");
			Product product = ProductDAO.productMap.get(id);
		%>
		<div class="row">
			<div class="col-md-3 col-md-offset-2 col-sm-3">Tên sản phẩm:</div>
			<div class="col-md-6 col-sm-9">
				<%=product.getProductName()%>
			</div>
			<div class="col-md-3 col-md-offset-2 col-sm-3">Giá:</div>
			<div class="col-md-6 col-sm-9">
				<%=product.getPrice()%>
			</div>
			<div class="col-md-3 col-md-offset-2 col-sm-3">Mã nhà cung cấp - Tên NCC:</div>
			<div class="col-md-6 col-sm-9">
				<%=product.getProducerID()%> - <%=ProducerDAO.producerMap.get(product.getProducerID()).getProducerName()%>
			</div>
		</div>
	</div>
</body>
</html>