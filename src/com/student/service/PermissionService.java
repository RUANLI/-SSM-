package com.student.service;

import java.util.List;
import java.util.Map;

import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.User;

public interface PermissionService{
	//查询菜单
	public List<Permission> AllPermission();
	//查询根节点
	public Permission queryRootPermission();
	//根据id查询权限表
	public List<Permission> queryPermissionById(Integer r_id);
	//根据用户id修改权限
	public void UploadpermissionByR_id(Map<String, Object> paramMap);
	//根据用户id删除权限
	public void deletepermissionByR_id(Integer r_id);
	//增加角色
	public void addRole(Role role);
	//角色禁用
	public void StoppermissionById(Role role);
	//权限树节点新增
	public void AddperissionTree(Permission permission);
	//权限树节点删除
	public void delpermissTree(Permission permission);

}
