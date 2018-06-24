package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ConnectDTB {
	// get a connection
	public Connection getConnection() {
		// ket noi local sqlserver
		// String url = "jdbc:sqlserver://localhost:50501;databaseName=GROCERY";
		// String username = "sa";
		// String password = "1";
		// ket noi azure sqlserver, chu y phai dung phien ban sqljdbc 4.2 tro len
		String url = "jdbc:sqlserver://vgrocery.database.windows.net:1433;database=grocery;user=vanvu@vgrocery;password={your_password_here};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
		String username = "vanvu";
		String password = "s29121998@";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection connect = DriverManager.getConnection(url, username, password);
			return connect;
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	// just a connection test
	public boolean createTableIntoDatabase(String tableName, ArrayList<String> column) {
		String sql = "CREATE TABLE " + tableName + " ( ";

		for (int i = 0; i < column.size(); i++) {
			if (i != column.size() - 1) {
				// neu khong phai la cot cuoi cung thi them ","
				sql += column.get(i) + " nvarchar(255), ";
			} else {
				// neu la cot cuoi cung thi them ";"
				sql += column.get(i) + " nvarchar(255); ";
			}
		}
		try {
			Connection connection = getConnection();
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void thucThiSQL(String sql) throws SQLException {
		Connection connection = new ConnectDTB().getConnection();
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql);
	}

	public static ResultSet chonDuLieu(String sql) throws SQLException {
		Connection connection = new ConnectDTB().getConnection();
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}
	// just a connection test
	// private void createTableIntoDatabase() throws SQLException {
	// Connection connection = ConnectDTB.connect();
	// Statement statement = connection.createStatement();
	// String sql = "create table testtable ( col1 varchar(10), col2 varchar(10) )
	// ";
	// statement.executeQuery(sql);
	// }
}
