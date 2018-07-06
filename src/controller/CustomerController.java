package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDAO;
import model.ConnectDTB;
import model.Customer;
import model.IdGenerator;

/**
 * Servlet implementation class Process
 */
@WebServlet("/customer")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String func = request.getParameter("function");
		switch (func) {
		case "add":
			RequestDispatcher addDispatcher = request.getRequestDispatcher("customer/addCustomer.jsp");
			addDispatcher.forward(request, response);
			break;
		case "edit":
			RequestDispatcher editDispatcher = request.getRequestDispatcher("customer/editCustomer.jsp");
			editDispatcher.forward(request, response);
			break;
		case "delete":
			deleteCustomer(request, response);
			break;
		case "detail":
			RequestDispatcher detailDispatcher = request.getRequestDispatcher("customer/detailCustomer.jsp");
			detailDispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fix encode Vietnamese
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String func = request.getParameter("function");
		switch (func) {
		case "add":
			addCustomer(request, response);
			break;
		case "edit":
			editCustomer(request, response);
			break;
		}

	}

	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String customerID = request.getParameter("id");
		new CustomerDAO().delete(customerID);
		response.sendRedirect("showCustomer.jsp");
	}

	private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String customerID = (String) request.getSession().getAttribute("id");
		String customerName = request.getParameter("customerName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		Customer customer = new Customer(customerID, customerName, userName, password, phoneNumber);
		new CustomerDAO().edit(customer);
		response.sendRedirect("showCustomer.jsp");
	}

	private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String customerName = request.getParameter("customerName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		// id generate
		// String customerID = "";
		// ResultSet rs;
		// String s = "";
		// try {
		// rs = new ConnectDTB().chonDuLieu("select * from customer");
		// while (rs.next()) {
		// // if(rs.next())==null => s = ""
		// s = rs.getString(1);
		// s = s.substring(1);
		// }
		// } catch (SQLException e) {
		// e.printStackTrace();
		// }
		// if (s == "") {
		// customerID = "C0";
		// } else {
		// int id = Integer.parseInt(s) + 1;
		// customerID = "C" + id;
		// }
		String customerID = IdGenerator.IDGen("C");
		Customer customer = new Customer(customerID, customerName, userName, password, phoneNumber);
		new CustomerDAO().add(customer);
		response.sendRedirect("showCustomer.jsp");
	}

}
