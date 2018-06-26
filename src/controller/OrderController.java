package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import model.ConnectDTB;
import model.Order;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String func = request.getParameter("function");
		switch (func) {
		case "add":
			RequestDispatcher addDispatcher = request.getRequestDispatcher("order/addOrder.jsp");
			addDispatcher.forward(request, response);
			break;
		case "delete":
			deleteOrder(request, response);
			break;
		}
	}

	private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		new OrderDAO().delete(id);
		response.sendRedirect("showOrder.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerId = request.getParameter("customerIdPost");
		String orderDate = request.getParameter("orderDatePost");
		if (customerId == "" || orderDate == "") {
			RequestDispatcher addDispatcher = request.getRequestDispatcher("order/addOrder.jsp");
			addDispatcher.forward(request, response);
		} else {
			// id
			String orderId = "";
			ResultSet rs;
			String s = "";
			try {
				rs = new ConnectDTB().chonDuLieu("select * from Orders");
				while (rs.next()) {
					// if(rs.next())==null => s = ""
					s = rs.getString(1);
					s = s.substring(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (s == "") {
				orderId = "O0";
			} else {
				int id = Integer.parseInt(s) + 1;
				orderId = "O" + id;
			}
			Order order = new Order(orderId, orderDate, customerId);
			new OrderDAO().add(order);
			response.sendRedirect("showOrder.jsp");
		}
	}

}
