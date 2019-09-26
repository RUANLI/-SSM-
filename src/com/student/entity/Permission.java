package com.student.entity;

import java.util.ArrayList;
import java.util.List;

public class Permission {
	private Integer p_id;//权限id
	private String  p_url;//资源权限url
	private String  p_title;//资源
	private Integer parent_id;//父节点
	private List<Permission> children=new ArrayList<>();
	private boolean checked=false;
	public Permission() {

	}
	public Permission( String p_title) {
		super();
		this.p_title = p_title;
	}
	public Permission(String p_url, String p_title) {
		super();
		this.p_url = p_url;
		this.p_title = p_title;
	}
	public Permission(Integer p_id, String p_url, String p_title, Integer parent_id) {
		super();
		this.p_id = p_id;
		this.p_url = p_url;
		this.p_title = p_title;
		this.parent_id = parent_id;
	}
	
	
	public Permission(Integer p_id, String p_url, String p_title, Integer parent_id, List<Permission> children,
			boolean checked) {
		super();
		this.p_id = p_id;
		this.p_url = p_url;
		this.p_title = p_title;
		this.parent_id = parent_id;
		this.children = children;
		this.checked = checked;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<Permission> getChildren() {
		return children;
	}
	public void setChildren(List<Permission> children) {
		this.children = children;
	}
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (checked ? 1231 : 1237);
		result = prime * result + ((children == null) ? 0 : children.hashCode());
		result = prime * result + ((p_id == null) ? 0 : p_id.hashCode());
		result = prime * result + ((p_title == null) ? 0 : p_title.hashCode());
		result = prime * result + ((p_url == null) ? 0 : p_url.hashCode());
		result = prime * result + ((parent_id == null) ? 0 : parent_id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Permission other = (Permission) obj;
		if (checked != other.checked)
			return false;
		if (children == null) {
			if (other.children != null)
				return false;
		} else if (!children.equals(other.children))
			return false;
		if (p_id == null) {
			if (other.p_id != null)
				return false;
		} else if (!p_id.equals(other.p_id))
			return false;
		if (p_title == null) {
			if (other.p_title != null)
				return false;
		} else if (!p_title.equals(other.p_title))
			return false;
		if (p_url == null) {
			if (other.p_url != null)
				return false;
		} else if (!p_url.equals(other.p_url))
			return false;
		if (parent_id == null) {
			if (other.parent_id != null)
				return false;
		} else if (!parent_id.equals(other.parent_id))
			return false;
		return true;
	}

	

}
