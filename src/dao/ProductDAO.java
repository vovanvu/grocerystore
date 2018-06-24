package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDTB;
import model.Product;

public class ProductDAO implements ObjectDAO {
	public static Map<String, Product> productMap = getLoadProductDTB();

	@Override
	public boolean add(Object obj) {
		Product product = (Product) obj;
		productMap.put(product.getProductID(), product);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("insert into PRODUCT values(?,?,?,?,?)");
			statement.setString(1, product.getProductID());
			statement.setString(2, product.getProductName());
			statement.setString(3, product.getPrice());
			statement.setString(4, product.getImage());
			statement.setString(5, product.getProducerID());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean edit(Object obj) {
		Product product = (Product) obj;
		productMap.replace(product.getProductID(), product);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(
					"update PRODUCT set PRODUCTNAME=?,PRICE=?,IMAGE=?,PRODUCERID=? where PRODUCTID=?");
			statement.setString(5, product.getProductID());
			statement.setString(1, product.getProductName());
			statement.setString(2, product.getPrice());
			statement.setString(3, product.getImage());
			statement.setString(4, product.getProducerID());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String productID) {
		productMap.remove(productID);
		String sql = "delete from PRODUCT where PRODUCTID='" + productID + "'";
		try {
			ConnectDTB.thucThiSQL(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	private static Map<String, Product> getLoadProductDTB() {
		Map<String, Product> listProduct = new HashMap<String, Product>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("select * from product");
			while (rs.next()) {
				String productID = rs.getString(1);
				String productName = rs.getString(2);
				String price = rs.getString(3);
				String image = rs.getString(4);
				String producerID = rs.getString(5);
				listProduct.put(productID, new Product(productID, productName, price, image, producerID));
			}
			return listProduct;
		} catch (SQLException e) {
			System.out.println("Error at load Product database");
			e.printStackTrace();
		}
		return null;
	}

	// public static void main(String[] args) {
	// ProductDAO productDAO = new ProductDAO();
	// productDAO.add(new Product("P1", "moto", "11", "red", "12"));
	// productDAO.edit(new Product("P1", "wwww", "11", "red", "8"));
	// productDAO.delete("P1");
	// }
}
