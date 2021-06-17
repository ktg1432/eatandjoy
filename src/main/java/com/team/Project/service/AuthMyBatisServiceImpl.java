/**
 * 
 */
package com.team.Project.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.Project.domain.AuthMyBatisDao;
import com.team.Project.domain.UsersVO;
import com.team.Project.mapper.UserMapper;

import lombok.extern.log4j.Log4j2;

/**
 * @author javateam
 *
 */
@Service("authMyBatisService")
@Log4j2
public class AuthMyBatisServiceImpl implements AuthMyBatisDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @see com.team.Project.domain.AuthMyBatisDao.springSecuritySample1.service.AuthMyBatisService#hasUsername(java.lang.String)
	 */
	@Override
	public boolean hasUsername(String username) {

		log.info("hasUsername");

		return sqlSession.getMapper(UserMapper.class).hasUsername(username) == 1 ? true : false;
	} //

	/**
	 * @see com.team.Project.domain.AuthMyBatisDao.springSecuritySample1.service.AuthMyBatisService#insertUsers(com.UsersVO.springSecuritySample1.vo.Users,
	 *      java.lang.String)
	 */
	/*
	 * public void insertUsers(String username, String role) {
	 * 
	 * log.info("insertUser");
	 * 
	 * sqlSession.getMapper(UserMapper.class) .insertUser(usersVO);
	 * 
	 * sqlSession.getMapper(UserMapper.class) .insertUserRoles(username , role); }
	 */

	@Override
	public void insertUserRoles(String username, String role) {
		
		log.info("insertUserRoles");
		sqlSession.getMapper(UserMapper.class).insertUserRoles(username, role);

	}

	@Override
	public void insertUsers(UsersVO user) {
		log.info("insertUser");

		sqlSession.getMapper(UserMapper.class).insertUser(user);

	}

	@Override
	public void updatetUser(UsersVO users) {
		log.info("updateUser");
		sqlSession.getMapper(UserMapper.class).updateUser(users);
		
	}

} //