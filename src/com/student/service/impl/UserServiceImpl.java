package com.student.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.student.entity.Menu;
import com.student.entity.Page;
import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.User;
import com.student.mapper.UserMapper;
import com.student.service.UserService;

public class UserServiceImpl implements UserService {
	private UserMapper userMapper;
	
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	//增加普通用户
	@Override
	public void addUser(User User) {
		userMapper.addUser(User);
	}
	//删除用户
	@Override
	public int deleteUserById(int id) {
		return userMapper.deleteUserById(id);	
	}
	//查看所有用户
	@Override
	public	List<User>  queryUsers() {
		return userMapper.queryUsers();
	}
	//分页查询用户
	@Override
	public List<User> queryUserByPage(Page page) {		;
		return userMapper.queryUserByPage(page);
	}
	//登陆验证
	public User queryUserByUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.queryUserByUser(user);
	}
	@Override
	//注册验证
	public User queryUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.queryUserById(id);
	}
	@Override
	public void getTotalCountWithProcedure(Map<String, Object> params) {
		userMapper.getTotalCountWithProcedure(params);;	
	}
	@Override
	public int  deleteUserByIdWithProcedure(int id) {
		return	userMapper.deleteUserByIdWithProcedure(id);
		
	}
	//修改用户权限(角色）
	@Override
	public void uploadUserPrivate(int r_id,int id) {
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("r_id",r_id);
		map.put("id",id);
		userMapper.uploadUserPrivate(map);
	}
	//增加管理员用户
	@Override
	public void addAdminr(User User) {
		userMapper.addAdminr(User);
		
	}
	//管理员验证
	@Override
	public User queryUserIsWho(User user) {
		return userMapper.queryUserIsWho(user);
	}
	//用户总数
	@Override
	public int getTotalCount() {
		int	totalCount=userMapper.getTotalCount();
		return totalCount;
	}
	//查看用户角色
	@Override
	public int queryUserRole(User user) {
		return userMapper.queryUserRole(user);
	}
	//角色权限表
	@Override
	public List<Role> queryRole() {
		return userMapper.queryRole();
	}
	//动态菜单查询
	@Override
	public List<Permission> queryMenuById(int id) {
		// TODO Auto-generated method stub
		return userMapper.queryMenuById(id);
	}
	//根据用户id查询资源
	@Override
	public List<Permission> findResourceById(int id) {
		// TODO Auto-generated method stub
		return userMapper.findResourceById(id);
	}
	//查看所有角色
	@Override
	public List<Role> AllRole() {

		return userMapper.AllRole();
	}
	//查询角色状态
	@Override
	public Role queryRoleStastus(int r_id) {
		return userMapper.queryRoleStastus(r_id);
	}



}
