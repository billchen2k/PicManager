package utils;
import javax.sql.*;
import java.sql.*;

public class DatabaseManager {
	static final String DB_URL = "jdbc:mysql://picmanager.billc.io:3306/picmanager";
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String USER = "root";
	static final String PASS = "j2ee4.0";

	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public DatabaseManager() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动加载失败!" + e);
		}
	}

	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("数据库连接失败!");
		}
		return conn;
	}

	public ResultSet executeQuery(String sql) {
		try {
			rs = stmt.executeQuery(sql);
			System.out.println("查询成功：" + sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rs == null) {
			System.out.println("查询失败：" + sql);
		}
		return rs;
	}

	public int executeUpdate(String sql) {
		int result = 0;
		try {
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("执行失败：" + sql);
			result = 0;
		}
		return result;// 执行影响的行数
	}

	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

