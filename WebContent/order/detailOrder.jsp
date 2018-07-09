<%@page import="dao.ProductDAO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.OrderItemDAO"%>
<%@page import="model.Order"%>
<%@page import="model.ConnectDTB"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.OrderItem"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.ThousandSeparator"%>
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
<%
	String id = request.getParameter("id");
	Map<String, OrderItem> mapItem = OrderItemDAO.getOrderItemByOrderId(id);
	//map total item price (each orderitem)
	Map<String, String> mapTotalItemPrice = OrderItemDAO.getLoadTotalItemPrice();
	//get total price map (each order)
	Map<String, String> mapTotalPrice = OrderDAO.getLoadTotalPrice();
%>
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
			Order order = OrderDAO.orderMap.get(id);
		%>
		<h4>
			Mã đơn hàng:
			<%=order.getOrderId()%></h4>
		<h4>
			Ngày đặt hàng:
			<%=order.getOrderDate()%></h4>
		<h4>
			Tổng giá trị đơn hàng:
			<%=mapTotalPrice.get(order.getOrderId())%></h4>
		<!-- order item datatable -->
		<table id="datatable-buttons"
			class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên sản phẩm</th>
					<th>Số lượng</th>
					<th>Đơn giá</th>
					<th>Thành tiền</th>
					<th>Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<%
					int count = 0;
					for (OrderItem orderItem : mapItem.values()) {
						count++;
				%>
				<tr>
					<td><%=count%></td>
					<td><%=ProductDAO.productMap.get(orderItem.getProductID()).getProductName()%></td>
					<td><%=orderItem.getQuantity()%> <%
 	String price = ProductDAO.productMap.get(orderItem.getProductID()).getPrice();
 		price = ThousandSeparator.thousandSeparator(price) + " &#8363;";
 %>
					<td><%=price%></td>
					<td><%=mapTotalItemPrice.get(orderItem.getOrderItemId())%></td>
					<td><a
						href="orderItem?function=edit&id=<%=orderItem.getOrderItemId()%>"><button
								class="btn btn-primary btn-sm">Sửa</button></a> <a
						href="orderItem?function=delete&id=<%=orderItem.getOrderItemId()%>"><button
								class="btn btn-warning btn-sm">Xoá</button></a> <a
						href="orderItem?function=detail&id=<%=orderItem.getOrderItemId()%>"><button
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