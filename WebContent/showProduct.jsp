<%@page import="model.ThousandSeparator"%>
<%@page import="dao.ProducerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.Product"%>
<%
	Map<String, Product> mapProduct = ProductDAO.productMap;
%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý sản phẩm</title>
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Datatables -->
<link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="menu/menu.jsp"></jsp:include>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.jsp">Trang chủ</a></li>
			<li><a href="#">Quản lý sản phẩm</a></li>
		</ul>
		<h2>Quản lý sản phẩm</h2>
		<div class="row">
			<div
				class="col-md-2 col-md-offset-3 col-sm-2 col-sm-offset-3 col-xs-2 col-xs-offset-2"></div>
			<a href="product?function=add"><button type="button"
					class="btn btn-success">Thêm sản phẩm</button></a>
		</div>

		<table id="datatable-buttons"
			class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Giá sản phẩm</th>
					<th>Mã nhà cung cấp - Tên NCC</th>
					<th>Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<%
					int count = 0;
					for (Product product : mapProduct.values()) {
						count++;
				%>
				<tr>
					<td><%=count%></td>
					<td><%=product.getProductName()%></td>
					<%
						String price = product.getPrice();
							price = ThousandSeparator.thousandSeparator(price) + " &#8363;";
					%>
					<td><%=price%></td>
					<td><%=product.getProducerID()%> - <%=ProducerDAO.producerMap.get(product.getProducerID()).getProducerName()%></td>
					<td><a
						href="product?function=edit&id=<%=product.getProductID()%>"><button
								class="btn btn-primary btn-sm">Sửa</button></a> <a
						href="product?function=delete&id=<%=product.getProductID()%>"><button
								class="btn btn-warning btn-sm">Xoá</button></a> <a
						href="product?function=detail&id=<%=product.getProductID()%>"><button
								class="btn btn-default btn-sm">Chi tiết</button></a></td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<!-- jQuery -->
	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="build/js/custom.min.js"></script>
</body>
</html>