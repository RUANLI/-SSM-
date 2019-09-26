<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head  lang="en" >
<meta charset="uTF-8">
    <title>登陆页面</title>
    <link href="js/themes/style.css" rel="stylesheet" type="text/css" media="all" />
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/themes/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/demo/demo.css">--%>
<%--
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>--%>

</head>
<body>
<%--
   <h2 style="position:absolute;top:50px;left:500px">欢迎来到登陆页面</h2>
    <p style="position:absolute;top:65px;left:500px">请输入您的用户名和密码！</p>
--%>

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
   <!-- main -->
   <div class="main-w3layouts wrapper">
       <div class="main-agileinfo">
           <div class="agileits-top">
               <form action="controller/login.do" method="post">
                   <input class="text" type="text" name="id" placeholder="姓名" required="">
                   <input class="text" type="password" name="userPassword" placeholder="密码" required="">
                   <div class="wthree-text">
                       <ul>
                           <li>
                               <label class="anim">
                                   <input type="checkbox" class="checkbox" required="">
                                   <span> 记住 ?</span>
                               </label>
                           </li>
                           <li><a href="#">忘记密码 ?</a> </li>
                       </ul>
                       <div class="clear"> </div>
                   </div>
                   <input type="submit" value="登录">
               </form>
               <p>创建一个账号? <a href="controller/regPage.do" > 立即登录!</a></p>
           </div>
       </div>
       <!-- copyright -->
       <div class="w3copyright-agile">
           <p>© 2019 素小黑 . All rights <a href="" title="学海无涯">Reserved</a></p>
       </div>
   <%-- <form id="myForm" action="controller/login.do"  method="post">
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
</form>--%>
       <ul class="w3lsg-bubbles">
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
           <li></li>
       </ul>
   </div>
<!-- //main -->
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
</div>
</body>
</html>
</body>
</html>
