package com.bkc.test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnectionTest {
	private static final String DRIVER = "${jdbc.driverClassName}";
	private static final String URL = "${jdbc.url}";
	private static final String ID = "${jdbc.username}";
	private static final String PASS = "${jdbc.password}";

	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		try (Connection conn = DriverManager.getConnection(URL, ID, PASS)) {
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
