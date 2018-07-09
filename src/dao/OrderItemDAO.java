package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDTB;
import model.Customer;
import model.OrderItem;
import model.ThousandSeparator;

public class OrderItemDAO implements ObjectDAO {
	public static Map<String, OrderItem> orderItemMap = getLoadOrderDTB();

	public static Map<String, String> getLoadTotalItemPrice() {
		Map<String, String> res = new HashMap<String, String>();
		try {
			String query = "SELECT ODI.OrderItemId, (PD.PRICE*ODI.Quantity) AS GIATIENMOIMON FROM OrderItem ODI JOIN PRODUCT PD ON ODI.ProductId = PD.PRODUCTID";
			ResultSet rs = ConnectDTB.chonDuLieu(query);
			while (rs.next()) {
				String orderId = rs.getString(1);
				System.out.println(orderId);
				String totalPrice = rs.getString(2);
				totalPrice = ThousandSeparator.thousandSeparator(totalPrice);
				totalPrice = totalPrice + " \u20AB";
				System.out.println(totalPrice);
				res.put(orderId, totalPrice);
			}
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean add(Object obj) {
		OrderItem orderItem = (OrderItem) obj;
		orderItemMap.put(orderItem.getOrderItemId(), orderItem);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("INSERT INTO OrderItem VALUES(?,?,?,?)");
			statement.setString(1, orderItem.getOrderItemId());
			statement.setString(2, orderItem.getProductID());
			statement.setString(3, orderItem.getQuantity());
			statement.setString(4, orderItem.getOrderId());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		OrderItem orderItem = (OrderItem) obj;
		orderItemMap.replace(orderItem.getOrderItemId(), orderItem);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("UPDATE OrderItem SET ProductId=?,Quantity=?,OrderId=? where OrderItemId=?");
			statement.setString(4, orderItem.getOrderItemId());
			statement.setString(1, orderItem.getProductID());
			statement.setString(2, orderItem.getQuantity());
			statement.setString(3, orderItem.getOrderId());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String orderItemId) {
		orderItemMap.remove(orderItemId);
		String sql = "DELETE FROM OrderItem WHERE OrderItemId='" + orderItemId + "'";
		try {
			ConnectDTB.thucThiSQL(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	private static Map<String, OrderItem> getLoadOrderDTB() {
		Map<String, OrderItem> listOrder = new HashMap<String, OrderItem>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("SELECT * FROM OrderItem");
			while (rs.next()) {
				String orderItemId = rs.getString(1);
				String productId = rs.getString(2);
				String quantity = rs.getString(3);
				String orderId = rs.getString(4);
				listOrder.put(orderItemId, new OrderItem(orderItemId, productId, quantity, orderId));
			}
			return listOrder;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Map<String, OrderItem> getOrderItemByOrderId(String orderId) {
		Map<String, OrderItem> res = new HashMap<String, OrderItem>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("SELECT * FROM OrderItem WHERE OrderId='" + orderId + "'");
			while (rs.next()) {
				String orderItemId = rs.getString(1);
				String productId = rs.getString(2);
				String quantity = rs.getString(3);
				res.put(orderItemId, new OrderItem(orderItemId, productId, quantity, orderId));
			}
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		OrderItemDAO dao = new OrderItemDAO();
		//dao.getOrderItemByOrderId("OD1632");
		// OrderItem order = new OrderItem("OD1", "P1", "10", "O1");
		// dao.add(order);
		// dao.edit(order);
		// dao.delete("OD1");
	}

}
