package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import model.ConnectDTB;
import model.Order;
import model.Producer;;

public class OrderDAO implements ObjectDAO {

	public static Map<String, Order> orderMap = getLoadOrderDTB();
	public static Set<String> setOrderDate = getLoadDate();

	public Map<String, Order> loadOrderFilterByDate(String orderDate) {
		Map<String, Order> res = new HashMap<String, Order>();
		for (Order order : orderMap.values()) {
			if (order.getOrderDate().equals(orderDate)) {
				res.put(order.getOrderId(), order);
			}
		}
		return res;
	}

	public static Set<String> getLoadDate() {
		Set<String> dateSet = new HashSet<String>();
		for (Order order : orderMap.values()) {
			dateSet.add(order.getOrderDate());
		}
		return dateSet;
	}

	public static Map<String, Order> getLoadOrderDTB() {
		Map<String, Order> listOrder = new HashMap<String, Order>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("select * from Orders");
			while (rs.next()) {
				String orderId = rs.getString(1);
				String orderDate = rs.getString(2);
				String customerId = rs.getString(3);
				listOrder.put(orderId, new Order(orderId, orderDate, customerId));
			}
			return listOrder;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean add(Object obj) {
		Order order = (Order) obj;
		orderMap.put(order.getOrderId(), order);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("insert into Orders values(?,?,?)");
			statement.setString(1, order.getOrderId());
			statement.setString(2, order.getOrderDate());
			statement.setString(3, order.getCustomerId());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public boolean edit(Object obj) {
		Order order = (Order) obj;
		orderMap.replace(order.getOrderId(), order);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("update Orders set OrderDate=?,CustomerId=? where OrderId=?");
			statement.setString(3, order.getOrderId());
			statement.setString(1, order.getOrderDate());
			statement.setString(2, order.getCustomerId());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String id) {
		orderMap.remove(id);
		String sql = "delete from Orders where OrderId='" + id + "'";
		try {
			ConnectDTB.thucThiSQL(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	// public static void main(String[] args) {
	// Order order = new Order("OD1", "2018-12-01", "C1");
	// new OrderDAO().delete("OD1");
	// }

}
