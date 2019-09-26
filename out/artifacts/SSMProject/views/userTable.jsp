<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<table id="mytable" border="1" >
        <tr>
        	<td><input id="allboxs"  onclick="allcheck()" type="checkbox" value="${status.current}"/></td>
        	<td>行号</td>
            <td>用户ID</td>
            <td>用户昵称</td>
            <td>用户级别</td>
            <td>用户权限</td>
            <td>权限等级</td>
            <td>操作</td>
        <c:forEach items="${users}" var="user" varStatus="status" >
            <tr>
            	<td><input type="checkbox" id="boxs" class="boxs" name="boxs" value="${user.id}" onclick="choose('${user.id}')" /></td>
			    <td>${status.count}</td>
			    <td>${user.id}</td>
                <td>${user.userName}</td>
				<td>${user.r_name}</td>
				<td>${user.p_name}</td>
				<td>${user.p_id}</td>
                <td><button  id="upload" value="${user.id}"  type="button" onclick="updateFunction('${user.id}')">修改权限</button>
					 <button id="de" value="${user.id}"  type="button" onclick="deleteFunction('${user.id}')">删除用户</button></td>
            </tr>
        </c:forEach>
    </table>
	   <a href="javascript:fristPage()">首页</a>
	   <a href="javascript:nextPage()">下一页</a>
	   <a href="javascript:beforePage()">上一页</a>
	   <a href="javascript:lastPage()">尾页</a>
		<input type="hidden" id="totalCount" value="${page.totalCount}"/> 

  	 <h4>用户总数:${page.totalCount}</h4>
<div id="view"></div>
</body>
</html>