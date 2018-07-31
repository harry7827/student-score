package com.sc.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class MyJdbcUtil {
	private static ComboPooledDataSource dataSource=new ComboPooledDataSource();
	
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	public static DataSource getDataSource(){
		return dataSource;
	}
	
	public static void release(ResultSet rs,Statement statement,Connection connection) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs=null;
		}
		if (statement!=null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			statement=null;
		}
		if (connection!=null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connection=null;
		}
	}
}
