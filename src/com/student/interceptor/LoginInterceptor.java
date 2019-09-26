package com.student.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.student.entity.User;

public class LoginInterceptor implements HandlerInterceptor {
	//登录认证功能，身份授权
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
		//获取请求的uri
    	System.out.println("进入拦截器");
    	String url = request.getRequestURI();
		 //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制 
    	if (url.indexOf("/login.do") >= 0) {
    		return true; 
		}
        //获取session
        HttpSession session = request.getSession();
       User user = (User) session.getAttribute("user_session");
         //判断session中是否有用户数据，如果有，则返回true，继续向下执行
         if (user != null) {
           return true;
        }
         //不符合条件的给出提示信息，并转发到登录页面
      request.getRequestDispatcher("/login.jsp").forward(request, response);
      //response.sendRedirect("/login.jsp");
       return false;
    }
    //静茹handler方法后，返回modeldandview之前执行
    //应用场景 modelandview出发：将公用的模型如：菜单导航，在这里传到试图，也可以在这里统一视图，
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    	
    }
    //统一异常处理，日志处理
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    	System.out.println("拦截器放行");
     }
}
