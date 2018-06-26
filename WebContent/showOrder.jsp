<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Order"%>
<%@ page import="dao.OrderDAO"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%
	Map<String, Order> mapOrder = OrderDAO.orderMap;
	// map for get customerName
	Map<String, Customer> mapCustomer = CustomerDAO.customerMap;
	//set for get orderDate
	Set<String> setDate = OrderDAO.setOrderDate;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quản lý đơn hàng</title>
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
		<h2>Quản lý đơn hàng</h2>
		<div class="row">
			<div class="col-md-2">
				<div class="dropdown">
					<button class="btn btn-primary dropdown-toggle" type="button"
						data-toggle="dropdown">
						Chọn ngày hiển thị <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="dropdown?function=alldate">Tất cả ngày</a></li>
						<%
							for (String date : setDate) {
						%>
						<li><a href="dropdown?function=datefilter&date=<%=date%>"><%=date%></a></li>
						<%
							}
						%>

					</ul>
				</div>
			</div>
			<div class="col-md-2 col-md-offset-3 col-xs-2 col-xs-offset-5">
				<a href="order?function=add"><button type="button"
						class="btn btn-success">Thêm đơn hàng</button></a>
			</div>

		</div>
		<br>

		<table id="datatable-buttons"
			class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên khách hàng</th>
					<th>Mã đơn hàng</th>
					<th>Ngày đặt hàng</th>
					<th>Tổng tiền</th>
					<th>Chức năng</th>
				</tr>
			</thead>
			<tbody>
				<%
					int count = 0;
					for (Order order : mapOrder.values()) {
						count++;
				%>
				<tr>
					<td><%=count%></td>
					<td><%=mapCustomer.get(order.getCustomerId()).getCustomerName()%></td>
					<td><%=order.getOrderId()%></td>
					<td><%=order.getOrderDate()%></td>
					<td><%=100000%></td>
					<td><a href="order?function=edit&id=<%=order.getOrderId()%>"><button
								class="btn btn-primary btn-sm">Sửa</button></a> <a
						href="order?function=delete&id=<%=order.getOrderId()%>"><button
								class="btn btn-warning btn-sm">Xoá</button></a> <a
						href="order?function=detail&id=<%=order.getOrderId()%>"><button
								class="btn btn-default btn-sm">Chi tiết</button></a></td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
<!-- jQuery -->
<script src="vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->

<!-- Datatables -->
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
</html>