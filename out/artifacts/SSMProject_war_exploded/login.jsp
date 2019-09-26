<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uTF-8">
    <title>登陆页面</title>
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/demo/demo.css">
    <script type="text/javascript" src="/SSMProject/js/jquery.min.js"></script>
    <script type="text/javascript" src="/SSMProject/js/jquery.easyui.min.js"></script>
</head>
<body> 
   <h2 style="position:absolute;top:50px;left:500px">欢迎来到登陆页面</h2>
    <p style="position:absolute;top:65px;left:500px">请输入您的用户名和密码！</p>
<!-- <form id="myForm" action="controller/login.do" onsubmit="return checkFrom()" method="post">  
	用户名：<input type="text" name="id" id="value_1"/> <br/> 
	密　码：<input type="text" name="userPassword" id="value_2" /><br/> 
	<input type="submit" value="登陆" id="111"> 
	<input type="button" value="注册"  onclick="window.location.href='controller/regPage.do'">
</form>  -->
<script type="text/javascript"> 
          $(function(){
          		$("#login").click(function () {
          			checkFrom();
			});
       });
          function checkFrom(){
        	  var id=$("#value_1").val();
        	  var password=$("#value_2").val();
        	  if(id.length==""){
        		  alert("请输入账号");
        		  return;
        	  }
        	  if(password.length==""){
        		  alert("请输入密码");
        		  return;
        	  }
        	  if(password.length<6 || password.length>12){
        		  alert("密码长度需6-12位");
        		  return;
        	  }
           	  $("#myForm").submit();
          }
</script>
 
     <div style="margin:20px 0;position:absolute;top:50px;left:100px;"></div> 
    <form id="myForm" action="controller/login.do"  method="post"> 
    <div class="easyui-panel" style="width:400px;padding:50px 60px;position:absolute;top:100px;left:500px">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="value_1" name="id"  style="width:100%;height:34px;padding:10px" data-options="label:'用户名:'">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-passwordbox" id="value_2" name="userPassword" style="width:100%;height:34px;padding:10px" data-options="label:'密码:'">
        </div>
 <!--        <input type="submit" value="登陆" id="login"> 
		<input type="button" value="注册"  onclick="window.location.href='controller/regPage.do'"> -->
		<div padding:5px 20px>
            <a href="javascript:void(0)" class="easyui-linkbutton" id="login" style="width:80px;position:absolute;top:150px">登录</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location.href='controller/regPage.do'" style="width:80px;position:absolute;top:150px;left:260px">注册</a>
        </div>
    </div>
</form> 

</body> 
</head>
</html>