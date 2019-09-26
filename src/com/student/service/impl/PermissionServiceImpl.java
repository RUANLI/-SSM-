package com.student.service.impl;

import java.util.List;
import java.util.Map;

import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.User;
import com.student.mapper.PermissionMapper;
import com.student.service.PermissionService;

public  class PermissionServiceImpl implements PermissionService{
	private PermissionMapper permissionMapper;
	public void setPermissionMapper(PermissionMapper permissionMapper) {
		this.permissionMapper = permissionMapper;
	}

	@Override
	public List<Permission> AllPermission() {
		// TODO Auto-generated method stub
		return permissionMapper.AllPermission();
	}
//根节点
	@Override
	public Permission queryRootPermission() {
		// TODO Auto-generated method stub
		return permissionMapper.queryRootPermission();
	}
//根据id查询权限表
@Override
public List<Permission> queryPermissionById(Integer r_id) {
	return permissionMapper.queryPermissionById(r_id);
	}

//根据用户id删除权限
@Override
public void deletepermissionByR_id(Integer r_id) {
	 permissionMapper.deletepermissionByR_id(r_id);
}
//根据用户id修改权限
@Override
public void UploadpermissionByR_id(Map<String, Object> paramMap) {
	permissionMapper.UploadpermissionByR_id(paramMap);
	}
//增加角色
@Override
public void addRole(Role role) {
	permissionMapper.addRole(role);
}
//角色禁用
@Override
public void StoppermissionById(Role role) {
	permissionMapper.StoppermissionById(role);
	}
//权限树新增节点
@Override
public void AddperissionTree(Permission permission) {
	permissionMapper.AddperissionTree(permission);
	}
//权限树删除新增节点
@Override
public void delpermissTree(Permission permission) {
	permissionMapper.delpermissTree(permission);
	}
}
