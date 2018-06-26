<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
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
	<jsp:include page="../menu/menu-materialize-navbar.html"></jsp:include>
	<div class="container">
		<div class="row center">
			<h4 class="light-blue-text darken-4 col s12">Thêm đơn hàng</h4>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col s12 m4" id="customer">
				<div>
					<form name="customerForm" action="order" method="post"
						id="customerForm">
						<h5>Thông tin khách hàng:</h5>
						<strong>Mã khách hàng:</strong>
						<p id="selectedCustomerId">Chưa chọn</p>
						<input type="hidden" name="customerIdPost" value=""
							id="customerIdPost"> <strong>Tên khách hàng:</strong>
						<p id="selectedCustomerName">Chưa chọn</p>
						<strong>Ngày đặt hàng:</strong>
						<p id="selectedOrderDate">Chưa chọn</p>
						<input type="hidden" name="orderDatePost" value=""
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
							<option value="SP1">Bao cao su</option>
							<option value="SP2">Gel bôi trơn</option>
							<option value="SP3">Viagra</option>
						</datalist>
						<div class="input-field">
							<input type="number" name="quantity" min="1" id="quantity"
								value="1"> <label for="quantity">Số lượng</label>
						</div>
						<button onclick="addProduct()"
							class="btn waves-effect waves-light ">Thêm sản phẩm</button>
						<hr>
						<h5>
							Tổng cộng: <span id="sum">0</span>
						</h5>
					</div>
					<div class="col s12 m8">
						<h5>Sản phẩm đã thêm</h5>
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
					</div>
				</div>
			</div>
		</div>
		<div class="row center">
			<div class="col s12">
				<button type="submit" form="customerForm"
					class="btn waves-effect waves-light" id="btnAddOrder">Thêm
					đơn hàng</button>
			</div>
		</div>
	</div>
	<jsp:include page="../footer/footer-materialize.html"></jsp:include>
	<script type="text/javascript">
		$("#order").addClass("disabledbutton");

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
			}
		}
		var count = 0;
		var rowCount;

		function addProduct() {
			var pdata = document.getElementById("productId").value;
			if (pdata == "") {
				alert("Vui lòng nhập mã sản phẩm!");
			} else {
				count++;
				var productId = document.getElementById("productId").value;
				var quantity = document.getElementById("quantity").value;
				var row = "";
				var delbtn = "<button onclick=deleteProduct(" + count
						+ ")  > Xoá </button>";
				var productName = $(
						"#lstProductId option[value='" + productId + "']")
						.text();
				row += "<tr id=" + count + "><td>" + count + "</td><td>"
						+ productId + "</td><td>" + productName + "</td><td>"
						+ quantity + "</td><td>" + delbtn + "</td></tr>";
				var newBody = document.getElementById("productTableBody").innerHTML
						+ row;
				document.getElementById("productTableBody").innerHTML = newBody;
				document.getElementById("productId").value = "";
				document.getElementById("quantity").value = "1";
				//
				rowCount = $('#cart tr').length - 1;
				$("#sum").text(rowCount);
			}
		}

		function deleteProduct(id) {
			$("#" + id).remove();
			rowCount = $('#cart tr').length - 1;
			$("#sum").text(rowCount);
		}
	</script>
</body>

</html>