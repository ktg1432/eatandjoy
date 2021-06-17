package com.team.Project.domain;

public class UsersVO {
	
	private String username;
	private String password;
	private int enabled;
	
	public UsersVO() {
		
	}
	
	public UsersVO(String username, String password, int enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", enabled=" + enabled + "]";
	}
	

}
