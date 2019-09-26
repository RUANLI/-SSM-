package com.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.student.entity.Page;
import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.User;

public interface UserMapper {
	//增加用户
	public void addUser(User User);
	//增加管理员
	public void addAdminr(User User);
	//修改用户角色
	public void uploadUserPrivate(Map<String,Object> map);
	//查看用户角色
	public int queryUserRole(User user);
	//管理员验证
	public User queryUserIsWho (User user);
	//登录查询
	public User queryUserByUser(User user);
	//注册查询
	public User queryUserById(Integer id);
	//删除用户
	public int deleteUserById(int id);
	public int deleteUserByIdWithProcedure(int id);
	//查看所有用户
	public List<User> queryUsers();
	//查看用户总数
	public int getTotalCount();
	//根据用户总数
	public void getTotalCountWithProcedure(Map<String,Object> params );
	//分页查询所有用户
	public List<User> queryUserByPage(Page page);
	//角色权限表
	public List<Role> queryRole();
	//动态菜单查询
	public List<Permission> queryMenuById(@Param("id")int id);
	//根据用户id查询资源
	public List<Permission> findResourceById(@Param("id")int id);
	//查看所有角色
	@Select("Select  * from  role r where r.r_id<>3")
	public List<Role> AllRole();
	//查询角色状态
	public Role queryRoleStastus(int r_id);
	
}
