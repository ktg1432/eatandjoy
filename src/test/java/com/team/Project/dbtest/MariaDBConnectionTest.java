package com.team.Project.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;

import lombok.extern.log4j.Log4j;

@Log4j
public class MariaDBConnectionTest {
	
	String url ="jdbc:mariadb://localhost:3306/db?user=eatnjoy&password=1234";
	
	@Test
	public void connectionTest() throws SQLException {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url);
			log.info("### connection :" + connection + "- 연결 성공 ###");
		} catch (ClassNotFoundException e) {
				e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
