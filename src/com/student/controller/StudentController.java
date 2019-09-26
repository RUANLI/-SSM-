package com.student.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.student.entity.Page;
import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.Student;
import com.student.entity.User;
import com.student.service.PermissionService;
import com.student.service.StudentService;
import com.student.service.UserService;



@RequestMapping("controller")
@Controller//StudentController装配Ioc
@Transactional
public class StudentController {
	//自动装配Service
	@Autowired
	@Qualifier("studentService") 
	private StudentService  studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	@Autowired
	@Qualifier("userService") 
	private UserService  userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Autowired
	@Qualifier("permissionService") 
	private PermissionService  permissionService;
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	//返回主表
	@RequestMapping("result")
	public String result() {
		return "result" ;
	}

	
	 /*根据学号删除
	 @RequestMapping("deleteStudentByNo") 
		public String deleteStudentByNo(@RequestParam("stuNo") Integer stuNo ) {
		if(null!=stuNo) { 
			studentService.deleteStudentByNo(stuNo) ;
			return"result"; 
			} 
		return "result"; 
		}*/
	 //下载文件
	 @RequestMapping("download")
	 public ResponseEntity<byte[]> download(HttpServletRequest request) throws Exception {

		 ServletContext servletContext = request.getServletContext();
		 String fileName = "自考教材.xlsx";
		 String realPath = servletContext.getRealPath("/download/" + fileName);//得到文件所在位置
		 InputStream in = new FileInputStream(new File(realPath));//将该文件加入到输入流之中
		 byte[] body = null;
		 body = new byte[in.available()];// 返回下一次对此输入流调用的方法可以不受阻塞地从此输入流读取（或跳过）的估计剩余字节数
		 in.read(body);//读入到输入流里面

		 fileName = new String(fileName.getBytes("gbk"), "iso8859-1");//防止中文乱码
		 HttpHeaders headers = new HttpHeaders();//设置响应头
		 headers.add("Content-Disposition", "attachment;filename=" + fileName);
		 HttpStatus statusCode = HttpStatus.OK;//设置响应吗
		 ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
		 return response;
	 }
		 //根据学号删除deleteStudentWithPaocedure
	@RequestMapping("deleteStudentByNo")
	public String deleteStudentByNo(@RequestParam("stuNo") Integer stuNo ,Map<String,Object> map) {
		if(null!=stuNo) {
			studentService.deleteStudentWithPaocedure(stuNo) ;
			return "result";	
		}
		return "result";	
	}
	/**
	 * 删除所选中学生
	 */
	@RequestMapping("del")
	public String del(@RequestParam("stuNos")String stuNos ) {
		String[] stuNo = stuNos.split(",");
		for (int i = 0; i < stuNo.length; i++) {
			try {
				int a = Integer.parseInt(stuNo[i]);
				studentService.deleteStudentByNo(a);
			} catch (Exception e) {
			}
		}
		return "result";
	}
	//修改页面
	@RequestMapping("updateStudentByNoEdit")
	public String updateStudentByNoEdit(@RequestParam("stuNo")  Integer stuNo ,Model model) throws Exception{
		//直接传Integer stuNo 报错 
		// Integer No=Integer.parseInt(stuNo);
		List<Student> student=studentService.queryStudentByNo(stuNo) ;
		model.addAttribute("student", student);
		return "uploadPage" ;		
	} 
	//根据学号修改
	@ResponseBody
	@RequestMapping("uploadStudentByNo")
	public String uploadStudentByNo(Student student ,Model model) {
		int count=studentService.uploadStudentByNo(student);
		if(count==0) {
			return "0";
		}
		return "1";
	}
	//增加页面
	@RequestMapping("addStudentEdit")
	public String addStudentEdit(Model model) {
			return "add" ;		
		} 
	//增加学生
/*	 @RequestMapping("addStudent")
	 @ResponseBody
	 public String addStudent(Student student){
		 List<Student> student1=studentService.queryStudentByNo(student.getStuNo()); 
		 if(student1.size()!=0) {//list==null判断是否有这个集合 list.size()==0;判断这个集合有没有东西
			 //String msg="该学号已存在，请重新输入";
	    		return "0" ;
	    	}else {
	    		studentService.addStudent(student);
	    		//String msg="添加学生成功 ";
	    		return "1" ; 
	    		} 
	    	}
	    	*/
	//存储过程增加学生
	 @RequestMapping("addStudent")
	 @ResponseBody
	 public String addStudent(Student student){
		 List<Student> student1=studentService.queryStudentByNo(student.getStuNo()); 
		 if(student1.size()!=0) {//list==null判断是否有这个集合 list.size()==0;判断这个集合有没有东西
			 //String msg="该学号已存在，请重新输入";
	    		return "0" ;
	    	}else {
	    		try {
	    			studentService.addStudentWithProcedure(student);
	    		}
	    		catch(Exception e) {
	    			 e.printStackTrace();
	    			 return "2" ;  
	    		}
	    		return "1" ; 
	    		}
	    	}
	  
	  		//返回页面
			@RequestMapping("Result")
			public String addStudentResult(Model model) {
					return "result" ;		
			} 
	//分页管理员查询
	@RequestMapping("queryStudentByPage")
	public String queryStudentByPage(Model model,
			@RequestParam(required=true,defaultValue="1") Integer currentPage,
			@RequestParam(required=false,defaultValue="5") Integer pageSize,Student student){
       //分页操作
		int totalCount=studentService.getTotalCount();
		Page page=new Page();
		page.setCurrentPage((currentPage-1)*pageSize);
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
       List<Student> students=studentService.queryStudentByPage(page,student); 
       model.addAttribute("stduents",students);	
       model.addAttribute("page",page);
		return "table" ;
	}
	//分页用户查询
	@RequestMapping("queryStudentByPage1")
	public String queryStudentByPage1(Model model,
			@RequestParam(required=true,defaultValue="1") Integer currentPage,
			@RequestParam(required=false,defaultValue="5") Integer pageSize,Student student){
       //分页操作
		int totalCount=studentService.getTotalCount();
		Page page=new Page();
		page.setCurrentPage((currentPage-1)*pageSize);
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
       List<Student> students=studentService.queryStudentByPage(page,student); 
       model.addAttribute("stduents",students);	
       model.addAttribute("page",page);
		return "studentTable" ;
	}
	
	//DataGrid学生表格数据
	@RequestMapping("stduentData")
	@ResponseBody
	/*public List<Student> stduentDataList(Student student,
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=false,defaultValue="10") Integer rows){
       //分页操作
		int totalCount=studentService.getTotalCount();
		Page page1=new Page();
		page1.setCurrentPage((page-1)*rows);
		page1.setPageSize(rows);
		page1.setTotalCount(totalCount);
		page=page1.getCurrentPage();
		rows=page1.getPageSize();
       List<Student> students=studentService.queryStudentByPage(page1,student);
		//map.put("students", students); map.put("page", page); map.put("rows", rows);	 
       return students;
	}*/
	public Map<String,Object> stduentDataList(Student student,
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=false,defaultValue="10") Integer rows){
       //分页操作
		int totalCount=studentService.getTotalCount();
		Page page1=new Page();
		page1.setCurrentPage((page-1)*rows);
		page1.setPageSize(rows);
		page1.setTotalCount(totalCount);
		int total=page1.getTotalCount();
		/* rows=page1.getPageSize(); */
       List<Student> students=studentService.queryStudentByPage(page1,student);
       Map<String,Object> map= new HashMap<String, Object>();
       
       map.put("rows", students);
       map.put("total",total);
		/* map.put("rows",rows); */
		//map.put("students", students); map.put("page", page); map.put("rows", rows);	 
       return map;
	}
	/*
	 * 
	 * 
	 * 
	 * 动态内容操作
	 * 
	 * 
	 * 
	 */
	@RequestMapping("queryMenu")
	@ResponseBody
	public List<Map<String, Permission>> queryMenu(@RequestParam Integer id){
		List<Map<String, Permission>>list =new ArrayList<>();
		Map<String, Permission> map = new HashMap<String, Permission>();  
		Role role=new Role();
		role.setR_id(id);
       //菜单操作
		List<Permission> allMenu = permissionService.queryPermissionById(role.getR_id());
	/*	map.put("target", "1");  
        map.put("parentId", "1");  
        map.put("state", "close");  
        map.put("text", "SpringS");  
        list.add(map);  */
          
 
			return list;
		}
	//动态树节点增加
	@RequestMapping("AddperissionTree")
	@ResponseBody
	public String AddperissionTree(Permission permission){
		if(null!=permission) {
			permissionService.AddperissionTree(permission);
			return "1";
		}else {
			return "0";
		}	
	}
	//动态树节点删除
	@RequestMapping("delpermissTree")
	@ResponseBody
	public String delpermissTree(Permission permission){
		if(null!=permission) {
			permissionService.delpermissTree(permission);
			return "1";
		}else {
			return "0";
		}	
	}
	/*
	 * 
	 * 
	 * 
	 * 角色操作 权限
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
	//所有角色
	@RequestMapping("AllRole")
	@ResponseBody
	public List<Role> AllRole(){
		List<Role> p=userService.AllRole();
			return p;
	}
	//角色状态
	@RequestMapping("StoppermissionById")
	@ResponseBody
	public String StoppermissionById(Role role){
		if(role.getR_status()==0) {
			role.setR_status(1);
			permissionService.StoppermissionById(role);
			return "1";
		}else if(role.getR_status()==1){
			role.setR_status(0);
			permissionService.StoppermissionById(role);
			return "1";
		}else {
			return "0";
		}		
	}
	
	//增加角色
	@RequestMapping("addRole")
	@ResponseBody
	public String addRole(Role role){
		List<Permission> p=permissionService.queryPermissionById(role.getR_id());
		if(p.size()!=0) {
			return "0";
		}
		permissionService.addRole(role);
		return "1";
	}
	//查询权限树
	@RequestMapping("AllPermission")
	@ResponseBody
	public List<Permission> AllPermission(HttpSession session){
		List<Permission> permissions=new ArrayList<Permission>();
		Map<Integer,Permission> permissionMap=new HashMap<Integer,Permission>();
		List<Permission> ps =	permissionService.AllPermission();
	/*	for(Permission p:ps) {
			permissionMap.put(p.getP_id(),p);
		}
		for(Permission p:ps) {
			//子结点
			Permission child=p;
			if(child.getParent_id()==0) {
				permissions.add(p);
			}else {
				for(Permission innerPermission:ps) {
					if(child.getParent_id().equals(innerPermission.getP_id())) {
						//父节点
						Permission parent=innerPermission;
						//组合父子节点的关系
						parent.getChildren().add(child);
						break;
					}
				}
			}
		}*/
		/* session.setAttribute("menu",permissions); */
		return ps;
	}
	//根据用户id分配权限
	@RequestMapping("queryPermissionById")
	@ResponseBody
	public Map<String,Object> queryPermissionById(@RequestParam ("r_id") Integer r_id){
		List<Permission> pss =	permissionService.AllPermission();
		List<Permission> ps =permissionService.queryPermissionById(r_id);
/*		for(int i=0;i<ps.size();i++) {
			for(int j=0;j<pss.size();j++) {
			if(pss.get(j).getP_id()==ps.get(i).getP_id()) {
				pss.remove(j);	
			}
		}
	}*/
		pss.removeAll(ps);
		for(int i=0;i<ps.size();i++){
			ps.get(i).setChecked(true);	
	
			if(ps.get(i).getP_id()==1||ps.get(i).getP_id()==2||ps.get(i).getP_id()==3||ps.get(i).getP_id()==4||ps.get(i).getP_id()==5) { 
				ps.get(i).setChecked(false); 
				}
		}
		ps.addAll(pss);
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("permiss", ps);
		return map;
	}	
	//权限修改
	@RequestMapping("UploadpermissionByP_ids")
	@ResponseBody
	public String UploadpermissionByP_ids(@RequestParam ("p_ids") String p_ids,@RequestParam ("r_id") Integer r_id){
		Set<Integer> pids=new HashSet<Integer>();
		String[] p_id = p_ids.split(","); 
		 if(r_id!=null&&p_ids!=null){ 
			 permissionService.deletepermissionByR_id(r_id);
		for (int i = 0; i < p_id.length; i++) {
			 pids.add(Integer.parseInt(p_id[i]));
		}
		if(pids.contains(2)||pids.contains(3)||pids.contains(4)||pids.contains(5)) {
			pids.add(1);
		}
		if(pids.contains(6)||pids.contains(7)||pids.contains(8)||pids.contains(9)) {
			pids.add(2);
		}
		if(pids.contains(10)||pids.contains(11)||pids.contains(12)||pids.contains(13)) {
			pids.add(3);
		}
		if(pids.contains(14)||pids.contains(16)||pids.contains(17)||pids.contains(18)) {
			pids.add(4);
		}
		if(pids.contains(15)) {
			pids.add(5);
		}
		Map<String,Object> paramMap =new HashMap<String,Object>();
		paramMap.put("r_id", r_id);
		paramMap.put("pids", pids);
		permissionService.UploadpermissionByR_id(paramMap);
		return "1";
	}
		return "0";
	/*	for(int i=0;i<p_titles.size();i++) {
		 for(Permission p_title:p_titles) {
			 permission.get(i).setP_id(p_title);
		  }
		}*/
}


	/*
	 * 
	 * 
	 * 
	 * 用户操作
	 * 
	 * 
	 * 
	 */
	//DataGrid用户表格数据
		@RequestMapping("userData")
		@ResponseBody
		public Map<String,Object> userDataList(User user,
				@RequestParam(required=true,defaultValue="1") Integer page,
				@RequestParam(required=false,defaultValue="10") Integer rows){
	       //分页操作
			int totalCount=userService.getTotalCount();
			Page page1=new Page();
			page1.setCurrentPage((page-1)*rows);
			page1.setPageSize(rows);
			page1.setTotalCount(totalCount);
			int total=page1.getTotalCount();
			/* rows=page1.getPageSize(); */
	       List<User> users=userService.queryUserByPage(page1);
	       Map<String,Object> map= new HashMap<String, Object>();
	       map.put("rows", users);
	       map.put("total",total);
			/* map.put("rows",rows); */
			//map.put("students", students); map.put("page", page); map.put("rows", rows);	 
	       return map;
		}
		//roleData角色信息表
		@RequestMapping("roleData")
		@ResponseBody
		public Map<String,Object> roleData(Role role,
				@RequestParam(required=true,defaultValue="1") Integer page,
				@RequestParam(required=false,defaultValue="3") Integer rows){
	       //分页操作
			Page page1=new Page();
			page1.setCurrentPage((page-1)*rows);
			page1.setPageSize(rows);
			int total=page1.getTotalCount();
			/* rows=page1.getPageSize(); */
	       List<Role> roles=userService.queryRole();
	       Map<String,Object> map= new HashMap<String, Object>();
	       map.put("rows", roles);
	       map.put("total",total);
			/* map.put("rows",rows); */
			//map.put("students", students); map.put("page", page); map.put("rows", rows);	 
	       return map;
		}
	//查询用户
	@RequestMapping("queryUser")
    public String queryUser(Model model,
			@RequestParam(required=true,defaultValue="1") Integer currentPage,
			@RequestParam(required=false,defaultValue="5") Integer pageSize){
        //分页操作
		int totalCount=userService.getTotalCount();
		Page page=new Page();
		page.setCurrentPage((currentPage-1)*pageSize);
		page.setPageSize(pageSize);
		page.setTotalCount(totalCount);
       List<User> users=userService.queryUserByPage(page); 
       model.addAttribute("users",users);	
       model.addAttribute("page",page);
		return "userTable";
    }
	//注册页面
	@RequestMapping("regPage")
	public String regPage(Model model) {
		/* return "register" ; */	
		return "register";
	} 
	//注册功能
	@RequestMapping("reg")
	@ResponseBody
	public String addUser(User user ,Model model) {
		User user1=userService.queryUserById(user.getId());
			if(null!=user1) {
				return "0";		
			}else{
				userService.addUser(user) ;
				return "1";		
			} 
	} 
	//增加用户
	
	@RequestMapping("addUserPrivate")
	@ResponseBody
	public String addUserPrivate(Role role,User user) {
		int r_id=role.getR_id();
		User user1=userService.queryUserById(user.getId());
			if(null!=user1) {
				return "0";		
			}else{
				int id=user.getId();
				userService.addUser(user);
				userService.uploadUserPrivate(r_id, id);
				return "1";		
			} 
	} 
	//删除用户
	@RequestMapping("deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam("id") Integer id ,Model model) {
		int result=userService.deleteUserById(id);
		if(result!=0) {
			return "1" ;		
		}
			return "0";
	} 
	//用户权限修改
	@RequestMapping("uploadUserPrivate")
	@ResponseBody
	public String uploadUserPrivate(@RequestParam("id") int id,Role role) {
		/* User user=userService.queryUserById(id); */
		/* int p_id1=userService.quearyUserRole(user); */
		/* id是修改用户表的用户id  p_id是要修改的角色id  */
		//判断角色是否存在
		List<Role> roles=userService.AllRole();
		List<Integer> r_ids=new ArrayList<>();
		for(Role rs:roles) {
			r_ids.add(rs.getR_id());
		}
		int r_id=role.getR_id();
		if(r_id==3) {
			return "0";
		}
		if(r_ids.contains(r_id)) {
			userService.uploadUserPrivate(r_id,id);
			return "1";	
		}else {
			return "2";		
		}
	}
	//用户登录
	/*
	 * 登陆成功用请求转发 
	 * 登陆失败用重定向
	 */
	@RequestMapping("login")
	public String login(@RequestParam("id") int id ,@RequestParam("userPassword")String userPassword,HttpSession session) throws IOException {
			//用户登录信息
		  User user=new User(id, "zz", userPassword);
		  //验证登录系信息
		  User user2=userService.queryUserByUser(user);
		  int r_id=userService.queryUserRole(user2);
		  Role role=userService.queryRoleStastus(r_id);
		  if(role.getR_status()!=0) {
			  return  "redirect:/login.jsp"; 
		  }
		  if(null!=user2) {
			  //获取权限
			  List<Permission> permissions =permissionService.queryPermissionById(r_id);
			  List<Permission> menu=userService.queryMenuById(id);
			  		Map<String,Object> map=new  HashMap<>();
			  if(null!=menu) {
					for(int i=0;i<menu.size();i++) {
					map.put("menu"+i, menu.get(i).getP_title());	
					}
				}
			  session.setAttribute("user_session",user2);
			  session.setAttribute("user_Name",user2.getUserName());
			 session.setAttribute("permissions",permissions); 
			  session.setAttribute("menus",map);
			  session.setAttribute("roleName", role.getR_name());
			  return "Demo4";
		  }else {
			  return  "redirect:/login.jsp"; 
		  }
	}
/*	public String login(@RequestParam("id") Integer id ,@RequestParam("userPassword")String userPassword,HttpSession session) throws IOException {
		User user=new User(id, "zz", userPassword);
		User user2=userService.queryUserByUser(user);
			if(null!=user2) {
				User user1=userService.queryUserIsWho(user);
				session.setAttribute("user_session",user1);
				session.setAttribute("user_Name",user1.getUserName());
				if(user1.getP_id()==1) {
					return "student";
				}else if(user1.getP_id()==2){
					return "user";
				}else if(user1.getP_id()==3){
				//return "userPage";
					return "Demo4";
				}
			}else{
			
			 return "redirect:/login.jsp"; //重定向到登陆页面
					}
			return "Demo4";
		} */
	//退出登录方法
	@RequestMapping("logout")
		public String logout(HttpSession session){
	         //清除session
		/* session.removeAttribute(arg0); */
		session.invalidate();
			// return "forward:/login.jsp";请求转发
	       //重定向到登录页面的跳转方法
		return  "redirect:/login.jsp";
	   }
}	
