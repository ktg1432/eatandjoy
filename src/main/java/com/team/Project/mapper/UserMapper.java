/**
 * 
 */
package com.team.Project.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.Project.domain.RoleVO;
import com.team.Project.domain.UsersVO;

/**
 * mapper
 * 
 * @author 
 *
 */
public interface UserMapper {
	
	UsersVO getUserByUsername(String userName);
	RoleVO getUserRolesByUsername(String userName);
	
	int hasUsername(String username);
	
	UsersVO loadUserByUsername(String userName);
	void insertUser(@Param("tbl_users") UsersVO usersVO);
	void insertUserRoles(@Param("username") String username, 
						 @Param("role") String role);
	
	void updateUser(@Param("tbl_users") UsersVO usersVO);

}