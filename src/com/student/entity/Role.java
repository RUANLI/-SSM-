package com.student.entity;

public class Role {
	private int r_id;//角色ID
	private String r_name;//角色昵称
	private String p_name;//角色权限
	private int p_id;//权限等级
	private int r_status;
	public Role() {
	}
	
	public Role(int r_id, String r_name, String p_name, int p_id, int r_status) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.p_name = p_name;
		this.p_id = p_id;
		this.r_status = r_status;
	}

	public Role(int r_id, String r_name, String p_name, int p_id) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.p_name = p_name;
		this.p_id = p_id;
	}
	
	public int getR_status() {
		return r_status;
	}

	public void setR_status(int r_status) {
		this.r_status = r_status;
	}

	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
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
	@Override
	public String toString() {
		return "Role [r_id=" + r_id + ", r_name=" + r_name + ", p_name=" + p_name + ", p_id=" + p_id + "]";
	}

	
}
