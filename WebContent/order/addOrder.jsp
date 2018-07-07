<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="dao.ProductDAO"%>

<!DOCTYPE html>
<html>

<head>
<title>Thêm đơn hàng</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<!-- jquey -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.disabledbutton {
	pointer-events: none;
	opacity: 0.4;
}
</style>
</head>
<body>
	<jsp:include page="../menu/menu-materialize-navbar.jsp"></jsp:include>
		<nav>
    <div class="nav-wrapper">
      <div class="col s12">
        <a href="index.jsp" class="breadcrumb">Trang chủ</a>
        <a href="showOrder.jsp" class="breadcrumb">Quản lý đơn hàng</a>
        <a href="#!" class="breadcrumb">Thêm đơn hàng</a>
      </div>
    </div>
  </nav>
	<div class="container">
		<div class="row center">
			<h4 class="light-blue-text darken-4 col s12">Thêm đơn hàng</h4>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col s12 m4" id="customer">
				<div>
					<form action="order" method="post" id="customerForm">
						<h5>Thông tin khách hàng:</h5>
						<strong>Mã khách hàng:</strong>
						<%
							String id;
							if (request.getParameter("id") == null) {
								id = "Chưa chọn";
							} else {
								id = request.getParameter("id");
								session.setAttribute("id", id);
							}
						%>
						<p id="selectedCustomerId"><%=id%></p>
						<input type="hidden" name="customerIdPost" value="<%=id%>"
							id="customerIdPost"> <strong>Tên khách hàng:</strong>
						<%
							String customerName;
							if (request.getParameter("id") == null) {
								customerName = "Chưa chọn";
							} else {
								customerName = CustomerDAO.customerMap.get(request.getParameter("id")).getCustomerName();
							}
						%>
						<p id="selectedCustomerName"><%=customerName%></p>
						<strong>Ngày đặt hàng:</strong>
						<%
							String date;
							if (request.getParameter("orderdate") == null) {
								date = "Chưa chọn";
							} else {
								date = request.getParameter("orderdate");
								session.setAttribute("date", date);
							}
						%>
						<p id="selectedOrderDate"><%=date%></p>
						<input type="hidden" name="orderDatePost" value="<%=date%>"
							id="orderDatePost">
					</form>
				</div>
				<hr>
				<h5>Chọn khách hàng</h5>
				<div class="input-field">
					<input type="text" name="customerId" id="customerId"
						list="lstCustomerId"> <label for="customerId">Chọn
						mã khách hàng</label>
				</div>
				<datalist id="lstCustomerId">
					<%
						for (Customer customer : CustomerDAO.customerMap.values()) {
					%>
					<option value="<%=customer.getCustomerID()%>"><%=customer.getCustomerName()%></option>
					<%
						}
					%>
				</datalist>
				<div class="input-field">
					<input type="date" class="datepicker" id="orderDate" /> <label
						for="orderDate">Chọn ngày đặt hàng</label>
				</div>
				<button onclick="setSelectedCustomer()"
					class="btn waves-effect waves-light" type="submit"
					name="setSelectedCustomer">Chọn khách hàng</button>
			</div>
			<div class="col s12 m8" id="order">
				<div class="row">
					<div class="col s12 m4">
						<div class="input-field">
							<input type="text" name="productId" id="productId"
								list="lstProductId"> <label for="productId">Mã
								sản phẩm</label>
						</div>
						<datalist id="lstProductId">
							<%
								for (Product product : ProductDAO.productMap.values()) {
							%>
							<option value="<%=product.getProductID()%>"><%=product.getProductName()%></option>
							<%
								}
							%>
						</datalist>
						<div class="input-field">
							<input type="number" name="quantity" min="1" id="quantity"
								value="1"> <label for="quantity">Số lượng</label>
						</div>
						<button onclick="addProduct()"
							class="btn waves-effect waves-light ">Thêm sản phẩm</button>
						<hr>
						<h6>
							Số loại sản phẩm: <span id="sum">0</span>
						</h6>
					</div>
					<div class="col s12 m8">
						<h5>Sản phẩm đã thêm</h5>
						<form action="order" id="orderListForm" method="post">
							<table id="cart" class="bordered">
								<tbody id="productTableBody">
									<tr>
										<th>STT</th>
										<th>Mã sản phẩm</th>
										<th>Tên sản phẩm</th>
										<th>Số lượng</th>
										<th>Xoá</th>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row center">
			<div class="col s12">
				<button type="submit" class="btn waves-effect waves-light"
					id="btnAddOrder" onclick="submitForms()">Thêm đơn hàng</button>
			</div>
		</div>
	</div>
	<jsp:include page="../footer/footer-materialize.html"></jsp:include>
	<script type="text/javascript">
	<!--$("#order").addClass("disabledbutton");-->
		function setSelectedCustomer() {
			var selectedId = document.getElementById("customerId").value;
			var selectedDate = document.getElementById("orderDate").value;
			var selectedName = $(
					"#lstCustomerId option[value='" + selectedId + "']").text()
			if (selectedId == "") {
				alert("Bạn chưa chọn khách hàng!");
			} else if (selectedDate == "") {
				alert("Bạn chưa chọn ngày đặt hàng!");
			} else {
				document.getElementById("selectedCustomerId").innerHTML = selectedId;
				document.getElementById("selectedOrderDate").innerHTML = selectedDate;
				document.getElementById("selectedCustomerName").innerHTML = selectedName;
				document.getElementById("customerId").value = "";
				document.getElementById("orderDate").value = "";
				// $("#order,#btnAddOrder").removeClass("disabledbutton");
				$("#customerIdPost").val(selectedId);
				$("#orderDatePost").val(selectedDate);
				//redirect
				window.location.href = "order?function=selectCustomer&id="
						+ selectedId + "&orderdate=" + selectedDate;
			}
		}
		var count = 0;
		var rowCount;

		function addProduct() {
			var pdata = document.getElementById("productId").value;
			//Check if input product is not valid
			var listProductId = document.getElementById("lstProductId");
			var i;
			var falseId = false;
			for (i = 0; i < listProductId.options.length; i++) {
				if (pdata == listProductId.options[i].value) {
					falseId = true;
				}
			}
			if (pdata == "" || falseId == false) {
				alert("Bạn chưa nhập mã sản phẩm hoặc mã sản phẩm sai!");
			} else {
				count++;
				var productId = pdata;
				var quantity = document.getElementById("quantity").value;
				var row = "";
				var delbtn = "<button onclick=deleteProduct(" + count
						+ ")  > Xoá </button>";
				var productName = $(
						"#lstProductId option[value='" + productId + "']")
						.text();
				//row += "<tr id=" + count + "><td>" + count + "</td><td>"
				//		+ productId + "</td><td>" + productName + "</td><td>"
				//		+ quantity + "</td><td>" + delbtn + "</td></tr>";
				//<td><input type="text" name="data" value="stt" disabled="disabled"/></td>

				row += "<tr id=" + count + "><td>"
						+ count
						+ "</td><td><input type=\"text\" name=\"productId\"  value="+productId+" readonly/>"
						+ "</td><td>"
						+ productName
						+ "</td><td><input type=\"number\" name=\"quantity\"  value="+quantity+" />"
						+ "</td><td>" + delbtn + "</td></tr>";

				var newBody = document.getElementById("productTableBody").innerHTML
						+ row;
				document.getElementById("productTableBody").innerHTML = newBody;
				document.getElementById("productId").value = "";
				document.getElementById("quantity").value = "1";
				//
				rowCount = $('#cart tr').length - 1;
				$("#sum").text(rowCount);
				falseId = false;
			}
		}

		function deleteProduct(id) {
			$("#" + id).remove();
			rowCount = $('#cart tr').length - 1;
			$("#sum").text(rowCount);
		}
		submitForms = function() {
			//document.getElementById("customerForm").submit();
			document.getElementById("orderListForm").submit();
		}
	</script>
</body>

</html>