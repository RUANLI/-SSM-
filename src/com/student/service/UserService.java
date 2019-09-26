package com.student.service;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.student.entity.Menu;
import com.student.entity.Page;
import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.Student;
import com.student.entity.User;
public interface UserService {
	//注册普通用户
	public void addUser(User User);
	//登录查询
	public User queryUserByUser(User user);
	//注册查询
	public User queryUserById(Integer id);
	//管理员验证
	public User queryUserIsWho (User user);
	//修改用户权限（角色）
	public void uploadUserPrivate(int r_id,int id);
	//查看用户角色
	public int queryUserRole(User user);
	//增加管理员
	public void addAdminr(User User);
	//删除用户
	public int deleteUserById(int id);
	//删除用户
	public int deleteUserByIdWithProcedure(int id);
	//查看所有用户
	void getTotalCountWithProcedure(Map<String,Object> params );
	//查看用户总数
	public int getTotalCount();
	public List<User> queryUsers();
	//分页查询 currentPage当前页码  pageSize显示的数据条数
	public List<User> queryUserByPage(Page page);
	//角色权限表
	public List<Role> queryRole();
	//动态菜单查询
	public List<Permission> queryMenuById(int id);
	//根据用户id查询资源
	public List<Permission> findResourceById(int id);
	//查看所有角色
	public List<Role> AllRole();
	//查询角色状态
	public Role queryRoleStastus(int r_id);
}
