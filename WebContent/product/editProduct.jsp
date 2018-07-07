<%@page import="dao.ProducerDAO"%>
<%@page import="model.Producer"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sửa sản phẩm</title>
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
	<%
		String id = request.getParameter("id");
		request.getSession().setAttribute("id", id);
		Product product = ProductDAO.productMap.get(id);
		if (product != null) {
	%>
	<jsp:include page="../menu/menu.jsp"></jsp:include>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.jsp">Trang chủ</a></li>
			<li><a href="showProduct.jsp">Quản lý sản phẩm</a></li>
			<li><a href="#">Sửa sản phẩm</a></li>
		</ul>
		<h2>Sửa sản phẩm</h2>
		<form class="form-horizontal" action="product?function=edit"
			method="post" id="addProductForm">
			<div class="form-group">
				<label class="control-label col-sm-3" for="productName">Tên
					sản phẩm</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="productName"
						placeholder="Nhập tên sản phẩm" name="productName"
						value="<%=product.getProductName()%>">
					<p id="error_productName"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="price">Giá sản
					phẩm</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="price"
						placeholder="Nhập giá" name="price"
						value="<%=product.getPrice()%>">
					<p id="error_price"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="producerID">Mã
					nhà cung cấp</label>
				<div class="col-sm-6 ">
					<input type="text" class="form-control" id="producerID"
						placeholder="Nhập mã nhà cung cấp" list="listProducer"
						name="producerID" value="<%=product.getProducerID()%>">
					<datalist id="listProducer"> <%
 	for (Producer producer : ProducerDAO.producerMap.values()) {
 %>
					<option value="<%=producer.getProducerID()%>"><%=producer.getProducerName()%></option>
					<%
						}
					%> </datalist>
					<p id="error_producerID"></p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-2">
					<button type="submit" class="btn btn-primary">Sửa</button>
				</div>
			</div>
		</form>
		<%
			}
		%>
	</div>
	<!-- end container -->

</body>
</html>