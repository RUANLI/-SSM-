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
        	<td>行号</td>
            <td>学号</td>
            <td>名字</td>
            <td>班级</td>
            <td>语文成绩</td>
            <td>数学成绩</td>
            <td>英语成绩</td>
        <c:forEach items="${stduents}" var="student" varStatus="status" >
            <tr>
			    <td>${status.count}</td>
			    <td>${student.stuNo}</td>
                <td>${student.stuName}</td>
                <td>${student.stuClass}</td>
				<td>${student.stuChinese}</td>
				<td>${student.stuMath}</td>
				<td>${student.stuEnglish}</td>
        </c:forEach>
    </table>
	   <a href="javascript:fristPage()">首页</a>
	   <a href="javascript:nextPage()">下一页</a>
	   <a href="javascript:beforePage()">上一页</a>
	   <a href="javascript:lastPage()">尾页</a>
		<input type="hidden" id="totalCount" value="${page.totalCount}"/> 

  	 <h4>学生总数:${page.totalCount}</h4>
<div id="view"></div>
</body>
</html>