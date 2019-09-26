<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息增加页面</title>
	    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	    
	    <script>
			$(document).ready(function(){
				$("#add").click(function () {
				});
			});	 
	    var student={"stuNo":$("#no").val(),
	    			"stuName":$("#name").val(),
	    			"stuClass":$("#sclass").val(),
	    			"stuChinese":$("#chinese").val(),
	    			"stuMath":$("#math").val(),
	    			"stuEnglish":$("#english").val(),
	    		};
	     function fomrReset()
	    {
	       document.getElementById("addForm").reset();
		 }
 	    function  addclick(){
	    $.post(
	    		"addStudent.do",//服务器地址
	    		{"stuNo":$("#no").val(),
	    			"stuName":$("#name").val(),
	    			"stuClass":$("#sclass").val(),
	    			"stuChinese":$("#chinese").val(),
	    			"stuMath":$("#math").val(),
	    			"stuEnglish":$("#english").val(),
	    		}, //请求数据
	    function(result){
	  	if(result=="1"){
	    		alert("增加成功");
	    		 fomrReset();
	    	}else{
	    		alert("学号重复增加失败");
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
			if(no.length<=0){
				alert("学号不能为空");
				return;
			}
			if(name.length<=0){
				alert("学生姓名不能为空");
				return;
			}
			if(sclass.length<=0){
				alert("学生班级不能为空");
				return;
			}
			if(chinese.length>3 || chinese.length==0)
			{
				alert("语文成绩范围填写错误");
				return;
			}
			if(math.length>3 || math.length==0)
			{
				alert("数学成绩范围填写错误");
				return;
			}
			if(english.length>3 ||  english.length==0)
			{
				alert("英语成绩范围填写错误");
				return;
			}
				addclick();	
		}
	    </script>
</head>
<body>
<!-- 	<script>	
	function test(){
		alert($("#myFrom").val);
	}
	</script> -->

	<!--  <form id="addForm" action="addStudent.do" method="post"> -->
	 <form id="addForm"  onsubmit="return check()">
		学生学号<input type="text" id="no" name="stuNo"><br/> 
		学生姓名<input type="text" id="name" name="stuName"><br/> 
		学生班级<input type="text" id="sclass" name="stuClass"><br/> 
		语文成绩<input type="text" id="chinese" name="stuChinese"><br/> 
		数学成绩<input type="text" id= "math" name="stuMath"><br/> 
		英语成绩<input type="text" id="english" name="stuEnglish"><br/> 
	<!--     <input type="submit" id="addclick"  value="提交学生信息"/> -->
	     <input type=button id="add"  value="提交学生信息" onclick="check()"/>
	    <input type="button" value="增加完毕"  onclick="window.location.href='Result.do'"/>
	</form>
	</body>
<script>


</script>
</html>