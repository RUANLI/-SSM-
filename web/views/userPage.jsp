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
	<h1>系统用户操作管理员界面</h1>
<form id="select" style="float:left;" action="queryUser。do" method="post">
	<input type="text"  name="id" id="id"/>
	<input type="button"  value="查询管理员"  onclick="loadPage(1)">
 </form>
<form id="add" style="float:inherit;" action="addStudentEdit.do" method="post">
	<input type="submit" value="增加管理员" />
	<input type="button" value="多选删除"  onclick="deleteStudents()"/>
	<!-- <input type="button" value="修改多个学生"  onclick="window.location.href='test.do'"/> -->
	<input type="button" value="退出登录"  onclick="window.location.href='logout.do'"/>
</form>
	<% HttpSession s = request.getSession();%>
	管理员：<span style="font: 200;"><%=s.getAttribute("user_Name")%></span>	

<div id="UsertableDiv">
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
        });
        
        function loadPage(currentPage){
        	
        	var id = $('#id').val();
        	
        	$.post('queryUser.do',{
            	'currentPage':currentPage,
            	'pageSize':pageSize,
            	'id':id
            },function(result){
            	$('#UsertableDiv').html(result);
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
        //单选删除
        function deleteFunction(id){
    	//  	var x;
        	var r=confirm("确定删除"+id+"号学生？");
        	if (r==true){
               	$.post('deleteUser.do',
               	{
                	'id':id
                },function(result){
                	$('#UsertableDiv').html(result);
                	alert("删除成功");
                })
        	}
        }

      //删除所选中的学生
        function deleteStudents(){
             //判断至少写了一项
             var checkedNum = $("input[name='boxs']:checked").length;
             if(checkedNum==0){
                 alert("请至少选择一项!");
                 return false;
             }
             if(confirm("确定删除所选学生?")){
             var checkedList = new Array();
             $("input[name='boxs']:checked").each(function(){
                 checkedList.push($(this).val());
             });
          	$.post('del.do',
                   	{
          			"ids":checkedList.toString()
                    },function(result){
                    	$('#UsertableDiv').html(result);
                    	alert("删除成功");
                    })
             }
     }
 		 //修改提交
       		 function updateFunction(id){
       			var r=confirm("确定修改该用户权限？");
            	if (r==true){
                   	$.post('uploadUserPrivate.do',
                   	{
                    	'id':id
                    },function(result){
                    	if(result==1){
                    		alert("修改成功");
                    	$('#UsertableDiv').html();
                    	}else{
                    	alert("服务器问题修改失败");
                    	}
                    })
            	}
       		 }
        function allcheck() {
            var nn = $("#allboxs").is(":checked"); //判断th中的checkbox是否被选中，如果被选中则nn为true，反之为false
                if(nn == true) {
                    var namebox = $("input[class^='boxs']");  //获取name值为boxs的所有input
                    for(i = 0; i <namebox.length; i++) {
                        namebox[i].checked=true;    //js操作选中checkbox
                    }
                    alert("全选");
                }
                if(nn == false) {
                    var namebox = $("input[class^='boxs']");
                    for(i = 0; i < 5; i++) {
                        namebox[i].checked=false;
                    }
                }
               
        } 
        </script>  
</html>