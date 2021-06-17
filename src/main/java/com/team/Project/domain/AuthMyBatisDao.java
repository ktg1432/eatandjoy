/**
 * 
 */
package com.team.Project.domain;

/**
 * @author javateam
 *
 */
public interface AuthMyBatisDao {
	
	boolean hasUsername(String username);
	void insertUserRoles(String username, String role);
	
	void insertUsers(UsersVO user);
	void updatetUser(UsersVO user);
} //