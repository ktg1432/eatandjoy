package com.team.Project.dbtest;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

//XML설정방식 사용 시
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
public class HikariDataSourceTest {
	
	@Autowired
	private DataSource dataSource;
	
	@Test
	public void hikariDataSourceTest() {
		try {
			Connection con = dataSource.getConnection();
			log.info("'Connection 객체 : " + con + "'");
		} catch (SQLException e) {
			fail(e.getMessage());
		} 
	}
}
