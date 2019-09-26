<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uTF-8">
<title>用户注册页面</title>
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/demo/demo.css">
    <script type="text/javascript" src="/SSMProject/js/jquery.min.js"></script>
    <script type="text/javascript" src="/SSMProject/js/jquery.easyui.min.js"></script>

</head>
<body> 
<!-- <form id="regForm" > 
	账	号：<input type="text" name="id" id="ID"/> <br/>  
	昵	称：<input type="text" name="userName" id="Name"/> <br/> 
	密	码：<input type="password" name="userPassword" id="psd"/><br/> 
	确认密码：<input type="password"  name="userPassword" id="psd1"/><br/> 
	<input type="button" id="addUser" value="提交注册" onclick="checkForm()" >  
	<input type="button" value="去登录"   onclick="window.location.href='logout.do'">  
</form>  -->
    <h2>注册信息</h2>
    <p>请认真填写注册信息</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="注册信息" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="regForm" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox"  id="ID"  name="id" style="width:100%" data-options="label:'ID：',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="Name" name="userName" style="width:100%" data-options="label:'昵称:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-passwordbox" id="psd" name="userPassword" style="width:100%" data-options="label:'密码:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-passwordbox"  id="psd1" name="userPassword" style="width:100%" data-options="label:'确认密码:',required:true">
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" id="reg"  style="width:80px">注册</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="window.location.href='logout.do'" style="width:80px">登录</a>
        </div>
    </div>
<script type="text/javascript"> 
	//ajax请求提交
	 $(function(){
		 $("#reg").click(function () {
		 if(checkForm()){
		 	}
		 });
	});
		function  addUserclick(){
		  	  $.post(
		    		"reg.do",//服务器地址
		    		{	"id":$("#ID").val(),
		    			"userName":$("#Name").val(),
		    			"userPassword":$("#psd").val(),
		    		}, //请求数据
		    function(result){
		  	if(result=="1"){
		    		alert("恭喜你:注册成功"+"请记住你的id号："+$("#ID").val());
		    		fomrReset()
		    		window.location.href="logout.do";
		    	}else{
		    		alert("该用户ID:"+$("#ID").val()+"已存在！请重新注册");
		    	}
		    },'json') 
			}
	 //清空表单
	function fomrReset()
	{
	       document.getElementById("regForm").reset();

 	}
	//验证表单
          function checkForm(){
        		var id=$("#ID").val();
        		var name=$("#Name").val();
        		var psd=$("#psd").val();
        		var psd1=$("#psd1").val();
        	  if(id.length==0 || id.length>12){
        		  alert("请输入账号");
        		  return false;
        	  }
        	  if(name.length==0){
        		  alert("请输入用户昵称");
        		  return false;
        	  }
        	  if(psd.length==0){
        		  alert("请输入密码");
        		//  alert(psd.val);
        		  return false;
        	  }
        	  if(name.length>12){
        		  alert("用户昵称太长了");
        		  return false;
        	  }
        	  if(psd.length<6 || psd.length>12){
        		  alert("密码长度应在6-12位");
        		  return false;
        	  }
       	 	 if(psd!=psd1){
        		  alert("两次密码不一致，请重新输入");
        		  return false;
        	  }
       	 	 addUserclick();
 	  }
</script>
</body> 
</head>
</html>