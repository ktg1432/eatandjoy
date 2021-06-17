package com.team.Project.domain;

import org.springframework.security.core.GrantedAuthority;

public class RoleVO implements GrantedAuthority {

	private static final long serialVersionUID = 7464267597005842862L;
	
	private String username;
	private String role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String getAuthority() {
		return this.role;
	}
   
}