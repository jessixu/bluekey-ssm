package com.ibm.bluekey.utils;

//来自原项目中, src.com.bluekey 下的 User.java
//是否需要与本项目中的 po 对应写为小写? userId → userid

public class UserRemember {

	private int userId;
	private int belongDep;
	private String email;
	private String remember;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBelongDep() {
		return belongDep;
	}
	public void setBelongDep(int belongDep) {
		this.belongDep = belongDep;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}
	
	
	
}
