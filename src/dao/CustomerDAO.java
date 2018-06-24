package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDTB;
import model.Customer;

public class CustomerDAO implements ObjectDAO {
	public static Map<String, Customer> customerMap = getLoadCustomerDTB();

	@Override
	public boolean add(Object obj) {
		Customer customer = (Customer) obj;
		customerMap.put(customer.getCustomerID(), customer);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("insert into CUSTOMER values(?,?,?,?,?)");
			statement.setString(1, customer.getCustomerID());
			statement.setString(2, customer.getCustomerName());
			statement.setString(3, customer.getUserName());
			statement.setString(4, customer.getPassWord());
			statement.setString(5, customer.getPhoneNumber());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		Customer customer = (Customer) obj;
		customerMap.replace(customer.getCustomerID(), customer);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(
					"update CUSTOMER set CUSTOMERNAME=?,USERNAME=?,PASSWORD=?,PHONENUMBER=? where CUSTOMERID=?");
			statement.setString(5, customer.getCustomerID());
			statement.setString(1, customer.getCustomerName());
			statement.setString(2, customer.getUserName());
			statement.setString(3, customer.getPassWord());
			statement.setString(4, customer.getPhoneNumber());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String customerID) {
		customerMap.remove(customerID);
		String sql = "delete from CUSTOMER where CUSTOMERID='" + customerID + "'";
		try {
			ConnectDTB.thucThiSQL(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public static Map<String, Customer> getLoadCustomerDTB() {
		Map<String, Customer> listCustomer = new HashMap<String, Customer>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("select * from customer");
			while (rs.next()) {
				String customerID = rs.getString(1);
				String customerName = rs.getString(2);
				String userName = rs.getString(3);
				String passWord = rs.getString(4);
				String phoneNumber = rs.getString(5);
				listCustomer.put(customerID, new Customer(customerID, customerName, userName, passWord, phoneNumber));
			}
			return listCustomer;
		} catch (SQLException e) {
			System.out.println("Error at load Customer database");
			e.printStackTrace();
		}
		return null;
	}

	// public static void main(String[] args) {
	// Customer customer = new Customer("KH8", "Nguyen Ha Kien", "10", "10",
	// "0987222111");
	// CustomerDAO customerDAO = new CustomerDAO();
	// customerDAO.add(customer);
	// customerDAO.delete("KH10");
	// }
}
