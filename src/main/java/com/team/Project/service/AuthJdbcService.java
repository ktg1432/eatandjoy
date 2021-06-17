package com.team.Project.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.team.Project.domain.UsersVO;

import lombok.extern.log4j.Log4j2;
/*
 * Spring JDBC를 사용 : javateacher
 */
@Repository("authJdbcService")
@Log4j2
public class AuthJdbcService {
	
	private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {

		this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    public boolean hasUsername(String username) {
    	
    	boolean flag = false;
    	String sql = "SELECT * FROM tbl_users WHERE username=?";
    	
    	log.info("hasUsername : " + username);
    	
    	try {
    		
    		 UsersVO userVO = (UsersVO)this.jdbcTemplate
    				 				 .queryForObject(sql, 
								   				     new Object[]{ username },
								   				     new BeanPropertyRowMapper<UsersVO>(UsersVO.class));
    		 
    		 flag = userVO != null ? true : false;
    		 
		} catch (Exception e) {
			flag=false;
		}
    	
    	return flag; // 
    } //
    
    
    public void insertUsers(UsersVO usersVO, String role) {
    	
    	log.info("insertUsers");
    	
    	String sql  = "INSERT INTO tbl_users VALUES (?,?,1)";
    	String sql2 = "INSERT INTO tbl_user_roles VALUES "
    				+ "(tbl_user_roles_seq.nextval,?,?)";
    	
    	this.jdbcTemplate.update(sql, 
    							 new Object[] { usersVO.getUsername(), 
											    usersVO.getPassword() });
    	
    	this.jdbcTemplate.update(sql2, 
    							 new Object[] { usersVO.getUsername(),
											    role });
    	
    } //
    public void updateUser(UsersVO users, String role) {
    	
    	String sql = "UPDATE tbl_users set (?,?,1)";
    	this.jdbcTemplate.update(sql, new Object[] {users.getUsername(), users.getPassword()});
    	
    }
} //