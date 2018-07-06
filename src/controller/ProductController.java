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

import dao.CustomerDAO;
import dao.ProductDAO;
import model.ConnectDTB;
import model.Customer;
import model.IdGenerator;
import model.Product;
import sun.rmi.server.Dispatcher;
import dao.ProducerDAO;
import model.Producer;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String func = request.getParameter("function");
		switch (func) {
		case "add":
			RequestDispatcher addDipatcher = request.getRequestDispatcher("product/addProduct.jsp");
			addDipatcher.forward(request, response);
			break;
		case "edit":
			RequestDispatcher editDipatcher = request.getRequestDispatcher("product/editProduct.jsp");
			editDipatcher.forward(request, response);
			break;
		case "delete":
			deleteProduct(request, response);
			break;
		case "detail":
			RequestDispatcher detailDispatcher = request.getRequestDispatcher("product/detailProduct.jsp");
			detailDispatcher.forward(request, response);
			break;
		}
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		new ProductDAO().delete(id);
		response.sendRedirect("showProduct.jsp");
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
			addProduct(request, response);
			break;
		case "edit":
			editProduct(request, response);
			break;
		}
	}

	private void editProduct(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String productID = (String) request.getSession().getAttribute("id");
		String productName = request.getParameter("productName");
		String price = request.getParameter("price");
		String producerID = request.getParameter("producerID");
		request.getSession().removeAttribute("errorMessage");
		Product product = new Product(productID, productName, price, null, producerID);
		new ProductDAO().edit(product);
		response.sendRedirect("showProduct.jsp");

	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String productName = request.getParameter("productName");
		String price = request.getParameter("price");
		String producerID = request.getParameter("producerID");
		// id generate
		// String productID = "";
		// ResultSet rs;
		// String s = "";
		// try {
		// rs = new ConnectDTB().chonDuLieu("select * from product");
		// while (rs.next()) {
		// // if(rs.next())==null => s = ""
		// s = rs.getString(1);
		// s = s.substring(1);
		// }
		// } catch (SQLException e) {
		// e.printStackTrace();
		// }
		// if (s == "") {
		// productID = "P0";
		// } else {
		// int id = Integer.parseInt(s) + 1;
		// productID = "P" + id;
		// }
		String productID = IdGenerator.IDGen("P");
		Product product = new Product(productID, productName, price, null, producerID);
		new ProductDAO().add(product);
		response.sendRedirect("showProduct.jsp");

	}

}
