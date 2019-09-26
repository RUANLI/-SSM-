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
            <td>学号</td>
            <td>名字</td>
            <td>班级</td>
            <td>语文成绩</td>
            <td>数学成绩</td>
            <td>英语成绩</td>
         <!-- <td>总成绩</td>  -->
            <td>操作</td>
        <c:forEach items="${stduents}" var="student" varStatus="status" >
            <tr>
            	<td><input type="checkbox" id="boxs" class="boxs" name="boxs" value="${student.stuNo}" onclick="choose('${student.stuNo}')" /></td>
			    <td>${status.count}</td>
			    <td>${student.stuNo}</td>
                <td>${student.stuName}</td>
                <td>${student.stuClass}</td>
				<td>${student.stuChinese}</td>
				<td>${student.stuMath}</td>
				<td>${student.stuEnglish}</td>
	<%-- 	<td>(${student.stuChinese}+${student.stuEnglish}+${student.stuMath})</td> --%>
                <td><form id="uploadInfo" action="updateStudentByNoEdit.do" method="POST">
               			 <button  id="upload" value="${student.stuNo}" name="stuNo" type="submit" >修改</button>
                </form>
               		 <button id="de" value="${student.stuNo}"  type="button" onclick="deleteFunction('${student.stuNo}')">删除</button></td>
            </tr>
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