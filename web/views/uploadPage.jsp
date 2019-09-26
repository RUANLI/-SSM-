<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息修改页面</title>
	    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	    
	    <script>
			$(document).ready(function(){
				$("#upload").click(function () {
					if(check()){
					//uploadclick();	
					}
				});
	
			});
 	    function  uploadclick(){
	    $.post(
	    		"uploadStudentByNo.do",//服务器地址
	    			{"stuNo":$("#no").val(),
	    			"stuName":$("#name").val(),
	    			"stuClass":$("#sclass").val(),
	    			"stuChinese":$("#chinese").val(),
	    			"stuMath":$("#math").val(),
	    			"stuEnglish":$("#english").val(),
	    		}, //请求数据
	    function(result){
	  	if(result=="1"){
	    		alert("修改成功");
	    		// fomrReset();
	    		window.location.href="Result.do";
	    	}else{
	    		alert("修改失败，服务器问题");
	    	}
	    },'json') 
 	    }
 	    function check(){
				var no=$("#no").val();
				var name=$("#name").val();
				var sclass=$("#sclass").val();
				var chinese=$("#chinese").val();
				var math=$("#math").val();
				var english=$("#english").val(); 
			if(name.length<=0){
				alert("姓名不能为空");
				return;
			}
			if(sclass.length<=0){
				alert("班级不能为空");
				return;
			}
			if(chinese.length>3)
			{
				alert("语文成绩范围填写错误");
				return;
			}
			if(math.length>3)
			{
				alert("数学成绩范围填写错误");
				return;
			}
			if(english.length>3)
			{
				alert("英语成绩范围填写错误");
				return;
			}
				uploadclick();
		}
	</script>
<body>
    <c:forEach items="${student}" var="student" varStatus="status">
		  <form id="uploadForm"  onsubmit="return check()"> 
		  <!-- 学号不可编辑 -->
		学生学号<input readonly type="text" value="${student.stuNo}" id="no" name="stuNo"><br/> 
		学生姓名<input type="text" value="${student.stuName}" id="name" name="stuName" ><br/> 
		学生班级<input type="text" value="${student.stuClass}" id="sclass" name="stuClass" ><br/> 
		语文成绩<input type="text" value="${student.stuChinese}" id="chinese" name="stuChinese"><br/> 
		数学成绩<input type="text" value="${student.stuMath}" id= "math" name="stuMath"><br/> 
		英语成绩<input type="text" value="${student.stuEnglish}" id="english" name="stuEnglish"><br/> 
		<input type="button" id="upload"  value="提交修改信息"/>
	   <input type="button" value="退出"  onclick="window.location.href='Result.do'"/>  
	 	 </form> 
	  </c:forEach>
</body>
</html>