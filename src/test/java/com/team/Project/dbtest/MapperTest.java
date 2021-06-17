package com.team.Project.dbtest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.team.Project.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
public class MapperTest {
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void getTime(){
		log.info("getTime");
		log.info(timeMapper.getTime());
	}
}
