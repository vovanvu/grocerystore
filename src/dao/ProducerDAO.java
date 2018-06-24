package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import model.ConnectDTB;
import model.Customer;
import model.Producer;

public class ProducerDAO implements ObjectDAO {
	public static Map<String, Producer> producerMap = getLoadProducerDTB();

	private static Map<String, Producer> getLoadProducerDTB() {
		Map<String, Producer> listProducer = new HashMap<String, Producer>();
		try {
			ResultSet rs = ConnectDTB.chonDuLieu("select * from PRODUCER");
			while (rs.next()) {
				String producerID = rs.getString(1);
				String producerName = rs.getString(2);
				String address = rs.getString(3);
				listProducer.put(producerID, new Producer(producerID, producerName, address));
			}
			return listProducer;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean add(Object obj) {
		Producer producer = (Producer) obj;
		producerMap.put(producer.getProducerID(), producer);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement("insert into PRODUCER values(?,?,?)");
			statement.setString(1, producer.getProducerID());
			statement.setString(2, producer.getProducerName());
			statement.setString(3, producer.getAddress());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public boolean edit(Object obj) {
		Producer producer = (Producer) obj;
		producerMap.replace(producer.getProducerID(), producer);
		Connection connection = new ConnectDTB().getConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("update PRODUCER set PRODUCERNAME=?,ADDRESS=? where PRODUCERID=?");
			statement.setString(3, producer.getProducerID());
			statement.setString(1, producer.getProducerName());
			statement.setString(2, producer.getAddress());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(String producerID) {
		producerMap.remove(producerID);
		String sql = "delete from PRODUCER where PRODUCERID='" + producerID + "'";
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
	// ProducerDAO dao = new ProducerDAO();
	// Producer producer = new Producer("PR1", "toyotaaaaa", "Jaqqqpan");
	// dao.add(producer);
	// dao.edit(producer);
	// dao.delete("PR1");
	// }
}
