package com.student.entity;

import java.util.List;

public class User {
	private Integer id;//用户ID
	private String userName;//用户昵称
	private String userPassword;//用户密码
	private String r_name;//用户角色名称
	private String p_name;//角色权限名称
	private int p_id;//权限级别
	private List<Permission> permissios;
	public User() {
		
	}
	public User(Integer id, String userName, String userPassword) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPassword = userPassword;
	}
	public User(Integer id, String userName, String userPassword, String r_name, String p_name, int p_id) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPassword = userPassword;
		this.r_name = r_name;
		this.p_name = p_name;
		this.p_id = p_id;
	}
	
	public User(Integer id, String userName, String userPassword, String r_name, String p_name, int p_id,
			List<Permission> permissios) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPassword = userPassword;
		this.r_name = r_name;
		this.p_name = p_name;
		this.p_id = p_id;
		this.permissios = permissios;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	
	public List<Permission> getPermissios() {
		return permissios;
	}
	public void setPermissios(List<Permission> permissios) {
		this.permissios = permissios;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userPassword=" + userPassword + ", r_name=" + r_name
				+ ", p_name=" + p_name + ", p_id=" + p_id + ", permissios=" + permissios + "]";
	}
	
	
}
