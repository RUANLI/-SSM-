package Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.student.entity.Menu;
import com.student.entity.Page;
import com.student.entity.Permission;
import com.student.entity.Role;
import com.student.entity.Student;
import com.student.entity.User;
import com.student.service.PermissionService;
import com.student.service.StudentService;
import com.student.service.UserService;

	@Transactional
public class Test {
	//增加学生
	public static void testaddstduent() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		StudentService studentService = (StudentService)context.getBean("studentService") ;
		Student student = new Student();
		student.setStuNo(77);
		student.setStuClass("9班");
		student.setStuName("老王");
		student.setStuChinese(339);
		student.setStuMath(339);
		student.setStuEnglish(339);
		studentService.addStudent(student);
		studentService.addStudent(student);
	}
	//修改测试
	public static void testuploadstduent() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		StudentService studentService = (StudentService)context.getBean("studentService") ;
		Student student = new Student();
		student.setStuNo(2);
		student.setStuClass("9班");
		student.setStuName("老王");
		student.setStuChinese(339);
		student.setStuMath(339);
		student.setStuEnglish(339);
		studentService.uploadStudentByNo(student);
	}
	public static void queryStudentByNo() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		StudentService studentService = (StudentService)context.getBean("studentService") ;
	
		int stuNo=2;
		List<Student> student1 =studentService.queryStudentByNo(stuNo);
		System.out.println(student1);
	}
	//学生分页
		public static void queryStudentByPage() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			StudentService studentService = (StudentService)context.getBean("studentService") ;
			Page page=new Page();
			page.setCurrentPage(1);
			page.setPageSize(5);
//			int courrentPage=page.getCurrentPage();
//			int pageSize=page.getPageSize();
			List<Student> students=studentService.queryStudentByPage(page, null);
			for(Student student:students) {
				System.out.println("学生"+student);
			}	
		}public static void addStudent() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			StudentService studentService = (StudentService)context.getBean("studentService") ;
			Student student=new Student(100,"22","222",11,22,33);
			List<Student> student1=studentService.queryStudentByNo(student.getStuNo());
			int i;	
			if(null!=student1) {
				i=1;
			}else {
				i=0;
		} 
			System.out.println("id"+i);
	}
	
		/*
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 */
	//增加用户
	public static void testadduser() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		User user = new User(11, "老李", "123456");
		userService.addUser(user);
		System.out.println("添加用户"+user);
	}
	//查询全部用户
	public static void testqueryAllUser() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		List<User> users=userService.queryUsers();
		for(User user:users) {
			System.out.println("用户"+user);
		}
	}
	//用户分页
	public static void queryUserByPage() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		Page page=new Page();
		page.setCurrentPage(1);
		page.setPageSize(2);
		
		List<User> users=userService.queryUserByPage(page);
		for(User user:users) {
			System.out.println("用户"+user);
		}	
	}
	//用户删除
	public static void deleteUserById() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		User user = new User(24, "老李", "123456");
		int result=userService.deleteUserById(user.getId());
		if(result>0) {
			System.out.println("删除成功"+user+result);	
		}else {
			System.out.println("删除失败"+result);
		}
	}
	public static void login() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		User user=new User(1,null,"12345");
		User user1=userService.queryUserByUser(user);
	if(null!=user1) {
		System.out.println("success");
	}else {
		System.out.println("error");	
	}
}
	//查询全部用户
	public static void queryAllUserProcedure() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		//通过map给 存储过程指定输入参数
			Map<String,Object> params = new HashMap<>();
			params.put("id", "1") ;//指定存储过程的输入参数gName的值是g1	
//			int count= studentMapper.queryCountByGradeWithProcedure(params) ;//gName :s1
			userService.getTotalCountWithProcedure(params);//调用存储过程，并传入输入参数
			//获取存储过程的输出参数
			Object count = params.get("TotalCount") ;
			System.out.println(count);
		}
	public static void deleteUser1() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		User user=new User();
		user.setId(7);
		userService.deleteUserByIdWithProcedure(user.getId());
		System.out.println("删除用户成功");

	}
	//角色
	public static void queryRole() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		List<Role> role=userService.queryRole();
		System.out.println(role);

	}
	public static void queryUserByPage1() {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService userService = (UserService)context.getBean("userService") ;
		//通过map给 存储过程指定输入参数
		Page page=	new Page();
		page.setTotalCount(10);
		page.setPageSize(3);
		page.setCurrentPage(1);
		User user=	new User();
		user.setId(2);
		user.setP_id(2);
			//System.out.println(users);
		int p_id=userService.queryUserRole(user);
		System.out.println(p_id);
		Map map=new HashMap();
		int r_id=1;
		int id=2;
		userService.uploadUserPrivate(r_id,id);//
		p_id=userService.queryUserRole(user);
		System.out.println(p_id);
		}
	//增加用户加角色
		public static void addUserPrivate() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService = (UserService)context.getBean("userService") ;
			User user = new User(11111, "老李", "123456");
			int id=user.getId();
			int r_id=2;
			userService.addUser(user);
			userService.uploadUserPrivate(r_id, id);
		}
		public static void queryMenu() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService = (UserService)context.getBean("userService") ;
			int id=1;
			List<Permission> menu=userService.queryMenuById(id);
			System.out.println(menu);
			System.out.println(menu.get(1).getP_title()); 
			if(null!=menu) {
				for(int i=0;i<menu.size();i++) {
				System.out.println(menu.get(i).getP_title()); 
				}
			}
		}
		public static void findResouceById() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService = (UserService)context.getBean("userService") ;
			int id=1;
			List<Permission> Permission=userService.findResourceById(id);
			String per=Permission.toString();
			if(Permission.contains("1")) {
				System.out.println("包含");
			}else {
				System.out.println("不包含");
			}

		for(Permission permissions:Permission) {
			System.out.println(permissions.getP_id());
			 System.out.println(permissions.getP_url());
			 System.out.println(permissions.getP_title()); 
			 }
		}
		
		public static void queryRootPermission() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			PermissionService permissionService = (PermissionService)context.getBean("permissionService") ;
			List<Permission> permission=new ArrayList<Permission>();
			/*
			 * //根节点 Permission root=permissionService.queryRootPermission();
			 */
			List<Permission> ps =	permissionService.AllPermission();	
			for(Permission p:ps) {
				//子结点
				Permission child=p;
				System.out.println(child);
				System.out.println(child.getParent_id());
				if(p.getParent_id()==0) {
					permission.add(p);
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
			}
			System.out.println(permission);
			System.out.println(ps);
			
		}
		/*
		 * >>>*/
		public static void queryPermissionById() {
			ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			PermissionService permissionService = (PermissionService)context.getBean("permissionService") ;
				 
			List<Permission> data = new ArrayList<>();
			User user=new User();
			user.setId(1);
				      List<Permission> permissions = permissionService.queryPermissionById(1);
				      for(Permission p: permissions) {
				    	  System.out.println(p.getP_title());  
				    	  data.add(p);
				      }
				      System.out.println(data.get(0).getP_title()+"---"); 
				      System.out.println(permissions.get(0).getP_title());
	 }	
		

		/**
		   * 获取子节点
		   * @param id 父节点id
		   * @param allMenu 所有菜单列表
		   * @return 每个根节点下，所有子菜单列表
		   */
		  public static  List<Permission> getChild(Integer id,List<Permission> allMenu){
			  //子菜单
		    List<Permission> childList = new ArrayList<Permission>();
		    for (Permission nav : allMenu) {
		      // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
		      //相等说明：为该根节点的子节点。
		      if(nav.getParent_id().equals(id)){
		        childList.add(nav);
		      }
		    }
		    //递归
		    for (Permission nav : childList) {
		      nav.setChildren(getChild(nav.getP_id(), allMenu));
		    }
		    //如果节点下没有子节点，返回一个空List（递归退出）
		    if(childList.size() == 0){
		      return new ArrayList<Permission>();
		    }
		    return childList;
		  }
		  
		 public static void testMenu() { 
		 ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		PermissionService permissionService = (PermissionService)context.getBean("permissionService") ;
		  Map<String,List<Permission>> maps = new HashMap<String,List<Permission>>();
		  User user=new User();
		  user.setId(1);
			List<Permission> listMenu = permissionService.queryPermissionById(1);
		 }

			 public static void test1() { 
				 ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
				PermissionService permissionService = (PermissionService)context.getBean("permissionService") ;
				int r_id=1;
				List<Permission> pss =	permissionService.AllPermission();
				List<Permission> ps =permissionService.queryPermissionById(r_id);
				System.out.println(pss.contains(1));
			 		}

	public static void main(String[] args) {
		//testaddstduent();
		//testadduser();
		//testqueryAllUser() ;
		//queryUserByPage();
		//queryStudentByPage();
		//testuploadstduent();
		//queryStudentByNo();
		//addStudent();
		//deleteUserById();
		//login();
		//queryAllUserProcedure();
			//deleteUser1();
		//queryUserByPage1();
		//queryRole();
		//addUserPrivate();
		//queryMenu();
		//findResouceById();
		//queryRootPermission();
		//queryPermissionById();
			//testMenu();
		//test1();
		//addstduent();
	}
}
