package controller;

import model.Order;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;

/**
 * Servlet implementation class DropdownController
 */
@WebServlet("/dropdown")
public class DropdownController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DropdownController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String date = request.getParameter("date");
		OrderDAO.orderMap = OrderDAO.getLoadOrderDTB();
		OrderDAO.setOrderDate = OrderDAO.getLoadDate();
		String function = request.getParameter("function");
		if (function == null) {
			response.sendRedirect("showOrder.jsp");
		}
		if (function.equals("alldate")) {
			OrderDAO.orderMap = OrderDAO.getLoadOrderDTB();
			response.sendRedirect("showOrder.jsp");
		} else {
			Map<String, Order> mapOrder = new OrderDAO().loadOrderFilterByDate(date);
			OrderDAO.orderMap.clear();
			OrderDAO.orderMap.putAll(mapOrder);
			response.sendRedirect("showOrder.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
