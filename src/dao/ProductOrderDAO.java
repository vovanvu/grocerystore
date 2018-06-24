package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDTB;
import model.Customer;
import model.ProductOrder;

public class ProductOrderDAO implements ObjectDAO {
	public static Map<String, ProductOrder> orderMap = getLoadOrderDTB();

	@Override
	public boolean add(Object obj) {
		ProductOrder order = (ProductOrder) obj;
		orderMap.put(order.getOrderID(), order);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("insert into PRODUCTORDER values(?,?,?,?,?)");
			statement.setString(1, order.getOrderID());
			statement.setString(2, order.getOrderDate());
			statement.setString(3, order.getTotalPrice());
			statement.setString(4, order.getCustomerID());
			statement.setString(5, order.getProductID());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		ProductOrder order = (ProductOrder) obj;
		orderMap.replace(order.getCustomerID(), order);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(
					"update PRODUCTORDER set ORDERDATE=?,TOTALPRICE=?,CUSTOMERID=?,PRODUCTID=? where ORDERID=?");
			statement.setString(5, order.getOrderID());
			statement.setString(1, order.getOrderDate());
			statement.setString(2, order.getTotalPrice());
			statement.setString(3, order.getCustomerID());
			statement.setString(4, order.getProductID());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String orderID) {
		orderMap.remove(orderID);
		String sql = "delete from PRODUCTORDER where ORDERID='" + orderID + "'";
		try {
			ConnectDTB.thucThiSQL(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	private static Map<String, ProductOrder> getLoadOrderDTB() {
		Map<String, ProductOrder> listOrder = new HashMap<String, ProductOrder>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("select * from productorder");
			while (rs.next()) {
				String orderID = rs.getString(1);
				String orderDate = rs.getString(2);
				String totalPrice = rs.getString(3);
				String customerID = rs.getString(4);
				String productID = rs.getString(5);
				listOrder.put(orderID, new ProductOrder(orderID, orderDate, totalPrice, customerID, productID));
			}
			return listOrder;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// public static void main(String[] args) {
	// ProductOrderDAO dao = new ProductOrderDAO();
	// ProductOrder order = new ProductOrder("OD1", "2001/11/01", "2000", "KH8",
	// "P1");
	// dao.add(order);
	// dao.edit(order);
	// dao.delete("OD1");
	// }

}
