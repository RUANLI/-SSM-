<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <%-- 引入JQ和Bootstrap --%>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>

    <title>学生管理页面 - 首页</title>
	
    
</head>

<body>
	<h1>学生查看成绩界面</h1>
<form id="select" style="float:left;" action="queryStudentByNo.do" method="post">
	<input type="text"  name="stuNo" id="stuNo"/>
	<input type="button"  value="查询学生"  onclick="loadPage(1)">
 </form>
	<input type="button" value="退出登录"  onclick="window.location.href='logout.do'"/>

	<% HttpSession s = request.getSession();%>
	用户：<span style="font: 200;"><%=s.getAttribute("user_Name")%></span>	

<div id="studentDiv">
</div>
</body>
	<script type="text/javascript">
    	var pageSize = 5;
    	var currentPage=1;
    	var totalCount=$('#totalCount').val();
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
            loadPage(1);
    		$("#upload").click(function () {
    			updateFunction();	
			});
        });
        
        function loadPage(currentPage){
        	
        	var stuNo = $('#stuNo').val();
        	
        	$.post('queryStudentByPage1.do',{
            	'currentPage':currentPage,
            	'pageSize':pageSize,
            	'stuNo':stuNo
            },function(result){
            	$('#studentDiv').html(result);
            })
        }
        //首页
        function fristPage(){
        	currentPage=1;
        	loadPage(currentPage);
        }
        //下一页
        function nextPage(){
        	currentPage=currentPage+1;
        	loadPage(currentPage);
        }
        //上一页
        function beforePage(){
        	currentPage=currentPage-1;
        	loadPage(currentPage);
        }
        //尾页
        function lastPage(){
       	currentPage=Math.ceil($('#totalCount').val()/pageSize);
 
       	loadPage(currentPage);
        }
       </script>
</html>