package com.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.student.entity.Permission;
import com.student.entity.Role;


public interface PermissionMapper {
	//查询所有菜单
	@Select("Select  * from  permission p ")
	public List<Permission> AllPermission();
	//查询根节点
	@Select("select *from permission where parent_id=0")
	public Permission queryRootPermission();
	//根据角色id查询权限
	public List<Permission> queryPermissionById(@Param("r_id")Integer r_id);
	//根据用户id修改权限
	public void UploadpermissionByR_id(Map<String, Object> paramMap);
	//根据用户id删除权限
	public void deletepermissionByR_id(@Param("r_id")Integer r_id);
	//增加角色
	public void addRole(Role role);
	//角色禁用
	public void StoppermissionById(Role role);
	//权限树新增节点
	public void AddperissionTree(Permission permission);
	//权限树删除节点
	public void delpermissTree(Permission permission);
}
