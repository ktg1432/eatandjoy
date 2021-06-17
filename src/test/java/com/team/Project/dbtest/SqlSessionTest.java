package com.team.Project.dbtest;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
public class SqlSessionTest {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void sqlSessionFactoryTest() {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			Connection connection = session.getConnection();
			log.info("'Session 객체 : " + session + "'");
			log.info("Connection 객체 :" + connection + "'");
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
