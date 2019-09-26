<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理系统</title>
<style>
* {
	margin: 0;
	padding: 0;
}
.left {
	float: left;
	position: fixed;
	left: 5px;
	top: 10px;
}

.right {
	float: right;
	position: fixed;
	right: 5px;
	top: 8px;
}
</style>
<%-- <!-- 按钮权限判断 empty判断是否为空-->
<c:forEach items="${permissions}" var="ps">
<c:if test="${not empty(ps.p_title) && !(ps.p_title eq '修改学生')}">
	<style type="text/css">
#editStu {
	display:block;
}
</style>
</c:if>
</c:forEach> --%>
<!-- ------------------- -->
<link rel="stylesheet" type="text/css"
	href="/SSMProject/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="/SSMProject/js/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="/SSMProject/js/demo/demo.css">
<script type="text/javascript" src="/SSMProject/js/jquery.min.js"></script>
<script type="text/javascript" src="/SSMProject/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/SSMProject/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="/SSMProject/js/jquery.ztree.all-3.5.min.js"></script>
</head>
<body class="easyui-layout">
	<div class="header" data-options="region:'north',border:false"
		style="height: 60px; background: #0f66ab; padding: 10px">
		<div class="left" style="display: inline-block; position: fixed;">
			<h1 style="color: white;">学生在线管理平台</h1>
		</div>
		<div class="right"
			style="display: inline-block; position: absolute; top: 15px; right: 10px; color: white;">
			<p>
				<strong class="easyui-tooltip" title="2条未读消息"> <%--         	<% HttpSession s = request.getSession();%> --%>
					${roleName}： <%-- 			<span style="font: 200;"><%=s.getAttribute("user_Name")%></span>	 --%>
					<span>${user_session.userName}</span>
				</strong>:欢迎您！<a href="logout.do">安全退出</a>
		</div>
		<%--       <c:if test="${session.menus!=null}" >
        	<c:forEach items="${session.menus}"	var="menu">
        		rel=""
        	</c:forEach>
        </c:if> --%>

	</div>
	<!-- 	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px"></div> -->
	<div
		data-options="region:'east',split:true,collapsed:true,title:'管理操作'"
		style="background: #0f66ab; width: 200px; padding: 10px">
		<!-- <div id="editStudentDialog" class="easyui-dialog" title="编辑菜单" style="width:300px;height:300px" data-options="closed:true,resizable='true',
   			href:'studentTable'"
   		> -->
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<ul id="mt"></ul>
		</div>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="$('#editStudentDialog').dialog('open')">Open</a>
		<div id="addPerTreeDialog" class="easyui-dialog" title="权限新增"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#appendForm'), 
   				buttons: [{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       	if(ajaxaddcheck()){
                       	 	ajaxadd();
                        }
                       $('#addPerTreeDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#addPerTreeDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="addRoleDialog" class="easyui-dialog" title="增加角色"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#addRoleForm'), 
   				buttons: [{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       	 addRoleclick();
                       $('#addRoleDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#addRoleDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="addUserDialog" class="easyui-dialog" title="增加用户"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#addUserForm'), 
   				buttons: [{
                    text:'清除',
                    iconCls:'icon-remove',
                    handler:function(){
                 	 fromClear();
                    }
                },{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       	 addUserclick();
                       $('#addUserDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#addUserDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="editUserDialog" class="easyui-dialog" title="修改权限"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#editUserForm'), 
   				buttons: [{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       	 editUserclick();
                       $('#editUserDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#editUserDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="addStudentDialog" class="easyui-dialog" title="新增信息"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#addForm'), 
   				buttons: [{
                    text:'清除',
                    iconCls:'icon-remove',
                    handler:function(){
                 	 fromClear();
                    }
                },{
                    text:'刷新',
                    iconCls:'icon-reload',
                    handler:function(){
                     stuFormLoad();
                    }
                },{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                        if(addstucheck()){
                       	 addstuclick();
                        }
                       $('#addStudentDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#addStudentDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="editStudentDialog" class="easyui-dialog" title="编辑信息"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true, content:$('#editForm'),
   				buttons: [{
                    text:'清除',
                    iconCls:'icon-remove',
                    handler:function(){
                 	 fromClear();
                    }
                },{
                    text:'刷新',
                    iconCls:'icon-reload',
                    handler:function(){
                     stuFormLoad();
                    }
                },{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                        if(editcheck){
                       	 uploadstuclick();
                        }
                       $('#editStudentDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#editStudentDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
		<div id="permissionDialog" class="easyui-dialog" title="权限管理"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#mp'), 
   				buttons: [{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       $('#permissionDialog').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#permissionDialog').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px"></div>
			 <input id="stop" class="easyui-switchbutton" checked style="width:100px;height:30px">
			<div id="StoppermissionById" class="easyui-dialog" title="角色权限禁用"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#stop'), 
   				buttons: [{
                    text:'保存',
                    iconCls:'icon-ok',
                    handler:function(){
                       	 StopRoleonclick();
                       $('#StoppermissionById').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#StoppermissionById').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 200px; padding: 10px"></div>
		<div id="UploadpermissionById" class="easyui-dialog" title="权限赋予"
			data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#up'), 
   				buttons: [{
                    text:'确定',
                    iconCls:'icon-ok',
                    handler:function(){
                       	 getRoleChecked();
                       $('#UploadpermissionById').dialog('close');
                    }
                },{
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function(){
                      $('#UploadpermissionById').dialog('close');
                    }
                }]
            "
			style="width: 300px; height: 300px; padding: 10px">
			<ul id="up" class="easyui-tree"></ul>
		</div>
		<form id="editForm" class="addForm" method="post"
			enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>学生学号:</td>
					<td><input readonly id="stuNo" class="easyui-textbox"
						type="text" autocomplete="off" name="stuNo"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>学生姓名:</td>
					<td><input id="stuName" class="easyui-textbox" type="text"
						name="stuName" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>学生班级:</td>
					<td><input id="stuClass" class="easyui-textbox" type="text"
						name="stuClass"></input></td>
				</tr>
				<tr>
					<td>语文成绩:</td>
					<td><input id="stuChinese" class="easyui-textbox" type="text"
						name="stuChinese"></input></td>
				</tr>
				<tr>
					<td>数学成绩:</td>
					<td><input id="stuMath" class="easyui-textbox" type="text"
						name="stuMath"></input></td>
				</tr>
				<tr>
					<td>英语成绩:</td>
					<td><input id="stuEnglish" class="easyui-textbox" type="text"
						name="stuEnglish"></input></td>
				</tr>
			</table>
		</form>
		<form id="addForm" class="addForm" method="post"
			enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>学生学号:</td>
					<td><input id="astuNo" class="easyui-textbox" type="text"
						autocomplete="off" name="stuNo" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>学生姓名:</td>
					<td><input id="astuName" class="easyui-textbox" type="text"
						name="stuName" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>学生班级:</td>
					<td><input id="astuClass" class="easyui-textbox" type="text"
						name="stuClass"></input></td>
				</tr>
				<tr>
					<td>语文成绩:</td>
					<td><input id="astuChinese" class="easyui-textbox" type="text"
						name="stuChinese"></input></td>
				</tr>
				<tr>
					<td>数学成绩:</td>
					<td><input id="astuMath" class="easyui-textbox" type="text"
						name="stuMath"></input></td>
				</tr>
				<tr>
					<td>英语成绩:</td>
					<td><input id="astuEnglish" class="easyui-textbox" type="text"
						name="stuEnglish"></input></td>
				</tr>
			</table>
		</form>
		<form id="addRoleForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>角色ID:</td>
					<td><input id="rid" class="easyui-textbox" type="text"
						autocomplete="off" name="r_id"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>角色昵称:</td>
					<td><input id="rname" class="easyui-textbox" type="text"
						autocomplete="off" name="r_name"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
			</table>
		</form>
		<form id="addUserForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>用户ID:</td>
					<td><input id="a_id" class="easyui-textbox" type="text"
						autocomplete="off" name="id"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>用户昵称:</td>
					<td><input id="a_name" class="easyui-textbox" type="text"
						autocomplete="off" name="name"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>用户密码:</td>
					<td><input id="a_psd" class="easyui-textbox" type="text"
						autocomplete="off" name="psd"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>角色:</td>
					<td><select id="a_p_id" class="easyui-combobox" name="r_id"
						data-options="
                   	url:'AllRole.do',
                    method:'post',
           			valueField:'r_id',
                    textField:'r_name',
                    panelHeight:'auto',
                    " style="width: 100%">
					</select></td>
				</tr>
			</table>
		</form>
		
		<form id="editUserForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>用户ID:</td>
					<td><input readonly id="u_id" class="easyui-textbox"
						type="text" autocomplete="off" name="id"
						data-options="required:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>用户昵称:</td>
					<td><input readonly id="u_name" class="easyui-textbox"
						type="text" autocomplete="off" name="name"
						data-options="required:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>角色昵称:</td>
					<td><select id="ur_id" class="easyui-combobox" name="p_id"
						data-options="
                   	url:'AllRole.do',
                    method:'post',
           			valueField:'r_id',
                    textField:'r_name',
                    panelHeight:'auto',
                    " style="width: 100%">
					</select>
					</td>
				</tr>
			</table>
		</form>
		<form id="appendForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
			<input id="productId" type="hidden" name="id" />
			<table>
				<tr>
					<td>新增的权限ID:</td>
					<td><input readonly id="appendPid" class="easyui-textbox" type="text"
						autocomplete="off" name="p_id"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>权限父节点:</td>
					<td><input readonly id="appendParentid" class="easyui-textbox" type="text"
						autocomplete="off" name="parent_id"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>权限标题:</td>
					<td><input id="appendPtitle" class="easyui-textbox" type="text"
						name="p_title"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
				<tr>
					<td>权限url:</td>
					<td><input id="appendPurl" class="easyui-textbox" type="text"
						name="p_url"
						data-options="required:true,novalidate:true" style="width: 100%"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<div  data-options="region:'west',split:true,title:'管理操作'"
		style="width: 150px; padding: 5px">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<%-- <div title="${menus.menu0}" style="padding:10px"></div> --%>

			<!-- ---------------------- -->

			<!-- ---------------------- -->

			<%-- 	<c:forEach items="${menus}" var="ms"> --%>
			<div title="${menus.menu0}" style="padding: 10px;">
				<ul class="easyui-tree">
					<c:forEach items="${permissions}" var="ps">
						<%-- <c:if test="${ps.p_id!=1&&ps.p_id!=2&&ps.p_id!=3&&ps.p_id!=4&&ps.p_id!=5}"> --%>
						<c:if test="${ps.parent_id==2}">
							<li><a href="javascript:void(0)" style="width: 120px"
								onclick="${ps.p_url}">${ps.p_title}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div title="${menus.menu1}" style="padding: 10px">
				<ul class="easyui-tree">
					<c:forEach items="${permissions}" var="ps">
						<c:if test="${ps.parent_id==3}">
							<li><a href="javascript:void(0)" style="width: 120px"
								onclick="${ps.p_url}">${ps.p_title}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div title="${menus.menu2}" style="padding: 10px">
				<ul class="easyui-tree">
					<c:forEach items="${permissions}" var="ps">
						<c:if test="${ps.parent_id==4}">
							<li><a href="javascript:void(0)" style="width: 120px"
								onclick="${ps.p_url}">${ps.p_title}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div title="${menus.menu3}" style="padding: 10px">
				<ul class="easyui-tree">
			<!-- 	<a href="#" class="easyui-tree" onclick="getChecked()">授权管理</a> -->
					<c:forEach items="${permissions}" var="ps">
						<c:if test="${ps.parent_id==5}">
							<li><a href="javascript:void(0)" style="width: 120px"
								onclick="${ps.p_url}">${ps.p_title}</a></li>
						</c:if>
					</c:forEach>
						</ul>
				<ul id="mp" class="easyui-tree"></ul>
			</div>
			<%-- 	</c:forEach> --%>
		</div>
	</div>
	<div
		data-options="region:'center',title:'Center',title:'Main Title',iconCls:'icon-ok'">
		<div id="tt" class="easyui-tabs"
			data-options="fit:true,border:false,plain:true">
			<div title="About" data-options="closable:true"
				style="padding: 10px;">
				欢迎来到学生管理页面！
				<div style="margin: 20px 0; position: fixed;"></div>
				<div class="easyui-calendar"
					style="width: 300px; height: 300px; position: absolute; top: 100px; right: 10px;"></div>
			</div>
			<div title="学生信息" data-options="iconCls:'icon-reload'"
				style="padding: 5px">
			 	<div style="margin: 20px 0"></div> 
				<h2>学生信息管理</h2>
				 <div style="padding:5px;">
				 <c:forEach items="${permissions}" var="ps">
				 <c:if test="${ps.p_id==7}">
					<a id="addStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="${ps.p_url}" >${ps.p_title}</a> 
				</c:if>
				 <c:if test="${ps.p_id==8}">
					<a id="deleteStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="${ps.p_url}">${ps.p_title}</a>
				</c:if>
				 <c:if test="${ps.p_id==9}">
					<a id="editStu"   href="#" class="easyui-linkbutton"data-options="iconCls:'icon-edit'" onclick="${ps.p_url}" >${ps.p_title}</a>
				</c:if>
				</c:forEach>
					<a id="loadStu" href="#" class="easyui-linkbutton"data-options="iconCls:'icon-reload'" onclick="tableload()" >刷新表格</a>
				</div> 
				<div style="margin: 20px 0"></div>
				<p>
					<strong>分页栏位置</strong> <select id="p-pos" onchange="changeP()">
						<option>bottom</option>
						<option>top</option>
						<option>both</option>
					</select> <strong>分页栏风格</strong> <select id="p-style" onchange="changeP()">
						<option>manual</option>
						<option>links</option>
					</select>
				</p>
				<div style="margin: 20px 0;">
					<table id="dg" class="easyui-datagrid" style="width: auto"
						data-options="url:'stduentData.do',
							method:'Post',
							title:'学生信息表',
           					rownumbers:'true',
          					pagination:'true',
          					autoRowHeight:'true',
          					fitColumns:'true',
          					striped:'true',
          					multiSort:'true',
          					sortOrder:'desc',
          					remoteSort:false,
          					toolbar:$('#st')">
						<thead>
							<tr>
								<th data-options="field:'ck',checkbox:true"></th>
								<th data-options="field:'stuNo',sortable:'true'" width="100">学号</th>
								<th data-options="field:'stuName'" width="100">名字</th>
								<th data-options="field:'stuClass'" width="100">班级</th>
								<th data-options="field:'stuChinese'" width="100">语文成绩</th>
								<th data-options="field:'stuMath',sortable:true" width="100">数学成绩</th>
								<th data-options="field:'stuEnglish'" width="100">英语成绩</th>
							</tr>
						</thead>
					</table>
				</div>
				<div id="st" style="padding: 3px">
					<span>学生学号:</span> <input name="stuNo"
						style="line-height: 26px; border: 1px solid #ccc"> <span>学生姓名:</span>
					<input name="stuName"
						style="line-height: 26px; border: 1px solid #ccc"> <a
						id="search" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'" onclick="doSearch()">搜索</a>
				</div>
			</div>
		</div>
	</div>
		<div id="utt">
		 <c:forEach items="${permissions}" var="ps">
		 	<c:if test="${ps.p_id==11}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
			<c:if test="${ps.p_id==12}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true" onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
			<c:if test="${ps.p_id==13}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
		</c:forEach>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true"onclick="utload()">刷新</a>
		</div>
		<div id="rtt">
		 <c:forEach items="${permissions}" var="ps">
		 	<c:if test="${ps.p_id==14}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
			<c:if test="${ps.p_id==17}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
			<c:if test="${ps.p_id==18}">
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man',plain:true"onclick="${ps.p_url}">${ps.p_title}</a>
			</c:if>
		</c:forEach>
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true"onclick="rdgload()">刷新</a>
		</div>
	<!--  右键菜单定义如下： -->
<div id="mm" class="easyui-menu" style="width:120px;">
	<div onclick="append()" data-options="iconCls:'icon-add'">追加</div>
	<div onclick="remove()" data-options="iconCls:'icon-remove'">移除</div>
</div>
</body>
<script>
$(function(){
/* 	$('#addStudentDialog').dialog({
		content:$('#editForm')
		}); */
/* 	
	$('#dg').datagrid('sort', {
			sortName: 'stuChinese',
			sortOrder: 'desc'
		}); */
		doSearch();
	$("#tt").tabs({
		onAdd:function(title,index){
			addGrid();
		}
});

	$("#click1").click(function () {
			stuTab();
});
	$("#click2").click(function () {
  			userTab();
});
	$("#click3").click(function () {
			roleTab();
});
	$("#search").click(function(){
			doSearch();
	});
	var checkRow=$("#rdg").datagrid("getChecked");
		$('#stop').switchbutton({
		checked: true,
		 onText:"禁用",
		 offText:"启用",
		value:checkRow[0].r_status,
	 onChange: function(checked){
		StopRoleonclick();
	 }
	});
});
function addStu(){
		//清除from表单input内容
		 $("#addForm input").val("");
			stuAdd();

};
//权限树节点的增加
 function append(){
/* 	 var t = $('#mp');
	 var node = t.tree('getSelected'); */
     /* alert(node.attributes.parent); */
     addTreeFormLoad();
     $('#addPerTreeDialog').dialog('open');
}
/*         function append(){
            var t = $('#mp');
            var node = t.tree('getSelected');
            alert(node.attributes.parent);
            //节点判断
          if(node.attributes.parent=0){
        	  
          } 
            t.tree('append', {
                parent: (node?node.target:null),
                data: [{
                    text: 'new item1'
                },{
                    text: 'new item2'
                }]
            });
            
        } */
        //增加节点的ajax
        function ajaxadd(){
        	$.post(
        			"AddperissionTree.do",//服务器地址
        				{
        				"p_id":$("#appendPid").val(),
        				"p_url":$("#appendPurl").val(),
        				"p_title":$("#appendPtitle").val(),
        				"parent_id":$("#appendParentid").val(),
        				}, //请求数据
        		function(result){
        			if(result==1){
        				alert("添加成功");
        				$('#mp').tree('reload');
        				$('#mt').tree('reload');
						//表单清空
        				$('#appendForm').form('clear');
        				}else{
        				alert("添加失败，服务器问题");	
        				}
        			},'json');
        }
//权限树节点的删除
        function remove(){
            var node = $('#mp').tree('getSelected');
            if(confirm("确定删除"+node.text)){
        		   	$.post('delpermissTree.do',
                           	{
                  			"p_id":node.id,
                            },function(result){
                            	if(result==1){
                            	alert("删除成功");
                            	$('#mp').tree('reload');
                				$('#mt').tree('reload');
                		
                            	}else{
                    				alert("删除失败，服务器问题");	
                				}
                           })
        		}
        }
//获取权限按钮
function getChecked(){
	var nodes = $('#mp').tree('getChecked');
	var s = '';
	for(var i=0; i<nodes.length; i++){
		if (s != '') s += ',';
		s += nodes[i].id;
	}
	$('#permissionDialog').dialog('open');
	//alert(s);
};
//菜单面板
$('#mt').tree({
	lines:true,
    animate: true,
	url: 'AllPermission.do',
/* 	checkbox:'false', */ 
	loadFilter: function(rows){
		return convert(rows);
	}
});
//点击事件
$("#mt").tree({
    onClick:function(node){
    	// alert(node.text); 
    /* 	alert(node.attributes.url); 
    	alert(node.attributes.parent);  */
    	var nodes1 = $('#mt').tree('getChildren');
    	alert(nodes1.length); 
    	//node.attributes
    }
});
//权限列表所有权限
$('#mp').tree({
	url: 'AllPermission.do',
	//checkbox:'true',
	lines:true,
    animate: true,
	loadFilter: function(rows){
		return convert(rows);
	},
    onContextMenu: function(e,node){
        e.preventDefault();
        $(this).tree('select',node.target);
        $('#mm').menu('show',{
            left: e.pageX,
            top: e.pageY
        });
	}	
});
//修改角色权限按钮
function getRoleChecked(){
	var nodes = $('#up').tree('getChecked');
	if(nodes.length==0){
		arelt("请选择分配权限信息！");
		return false;
	}
	var p_ids ='';
	for(var i=0; i<nodes.length; i++){
		if (p_ids != '') p_ids += ',';
		p_ids += nodes[i].id;
	}
	var checkRow=$("#rdg").datagrid("getChecked");
	var r_id =checkRow[0].r_id;
$.post(
	"UploadpermissionByP_ids.do",//服务器地址
		{
		"p_ids":p_ids,
		"r_id":r_id,
		}, //请求数据
function(result){
	if(result==1){
		alert("修改成功");
		}else{
		alert("修改失败，服务器问题");	
		}
	},'json');	
}
	//权限修改		/* getRoleChecked(); */
  function editRole(){
	var checkRow=$("#rdg").datagrid("getChecked");
	if(checkRow.length>1){
		 alert("不可同时编辑多条！");
        return false;
	}
	if(checkRow==0){
		 alert("请最少选择一条！");
       return false;
	}
	var r_id =checkRow[0].r_id;
	$('#UploadpermissionById').dialog('open');
  	$('#up').tree({
		url:'queryPermissionById.do',
        method: 'post',
        queryParams:{
        	r_id:r_id
        	},
    /*   checkbox:function(node){
            if (node.id!=1){
                return true;
               }
           },   */
		checkbox:'true',
		loadFilter: function(rows){
			console.log(convert(rows.permiss));
			return convert(rows.permiss);
		}
	}); 
	 
/* 		$.post(
  		"queryPermissionById.do",//服务器地址
  			{"r_id":checkRow[0].r_id}, //请求数据
  function(result){
  		mp_data = result;
  		alert("修改失败，服务器问题");
  },'json')  */
  			/* getRoleChecked(); */
  }
	//角色禁用
	 function stopRole(){
		var checkRow=$("#rdg").datagrid("getChecked");
	if(checkRow.length>1){
		 alert("请选择需要改变状态的角色！");
        return false;
	}
	if(checkRow==0){
		 alert("请最少选择一条！");
       return false;
	}
	/* var r_id =checkRow[0].r_id; */
	$('#StoppermissionById').dialog('open');
	}
	function StopRoleonclick(){
		var checkRow=$("#rdg").datagrid("getChecked");
		$.post(
		  		"StoppermissionById.do",//服务器地址
		  			{
		  			"r_id":checkRow[0].r_id,
		  			"r_status":checkRow[0].r_status,
		  			},
		  			//请求数据
		  function(result){
				if(result==1){
				alert("修改成功");
				rdgload();
				}else{
		  		alert("修改失败，服务器问题");
		  		rdgload();
				}
		  },'json')
	}

//树形转换
function convert(rows){
		function exists(rows, parent_id){
			for(var i=0; i<rows.length; i++){			
                    if (rows[i].p_id == parent_id)
                    	return true; 		
                        }	
                        return false; 		
                 } 		 		
                 var nodes = [];		
                 // get the top level nodes 		
                 for(var i=0; i<rows.length; i++){		
                     var row = rows[i];
                     console.log(row.checked);
                     if (!exists(rows, row.parent_id)){
                    		 nodes.push({			
                                 id:row.p_id,
                                 text:row.p_title,
                                // state:'closed', 
                                 lines : true,
                                 attributes:{
                                	 url:row.p_url,
                                	 parent:row.parent_id,
                                	 },
                             });
                     }
                 }
                 var toDo = [];		
                 for(var i=0; i<nodes.length; i++){
                     toDo.push(nodes[i]);
                 }
                 while(toDo.length){
                    var node = toDo.shift();	// the parent node 			
                    // get the children nodes 			
                    for(var i=0; i<rows.length; i++){ 				
                        var row = rows[i]; 				
                        if (row.parent_id == node.id){ 					
                            var child = {id:row.p_id,text:row.p_title,checked:row.checked,attributes:{url:row.p_url,parent:row.parent_id}}; 					
                            if (node.children){ 						
                                node.children.push(child); 					
                            } else { 						
                                node.children = [child]; 					
                            } 					
                            toDo.push(child); 				
                         } 			
                     } 		
                 }
                 
                 return nodes; 	
        }
	//增加角色
	function addRoleclick(){
		$.post('addRole.do',
           	{
  			"r_id":$("#rid").val(),
  			"r_name":$("#rname").val(),
            },function(result){
            	/* $('#dg').html(result); */
            	if(result==1){
            		alert("增加成功");
            		rdgload();
            		$('#ur_id').combobox('reload');
            		$('#a_p_id').combobox('reload');
            	/* 	$('#ur_id').combobox('reload','AllRole.do');  */
            	}else{
            		alert("该角色id已经存在！");
            		rdgload();
            	}
       });
	}
	//增加用户
	function addUserclick(){
		$.post('addUserPrivate.do',
               	{
      			"id":$("#a_id").val(),
      			"userName":$("#a_name").val(),
      			"userPassword":$("#a_psd").val(),
      			"r_id":$("#a_p_id").combobox('getValue'),
                },function(result){
                	/* $('#dg').html(result); */
                	if(result==1){
                		alert("增加成功");
                		utload();
                	}else{
                		alert("修改失败");
                		utload();
                	}
           });
	}
	//修改用户权限
	function editUserclick(){
		/* uFormReset();  */
	   	$.post('uploadUserPrivate.do',
               	{
      			"id":$("#u_id").val(),
      			"r_id":$("#ur_id").combobox('getValue'),
                },function(result){
                	/* $('#dg').html(result); */
                	if(result==1){
                		alert("修改成功");
                		utload();
                	}else if(result==0){
                		alert("修改失败 没有该角色");
                		utload();
                	}
                	else{
                		alert("服务器错误：修改失败");
                		utload();
                	}
                });
	}
	function addGrid(){
		$("#ut").datagrid({
		url:'userData.do',
		iconCls:'icon-man',
		columns:[[
		  {field:'ck',checkbox:true},
          {field:'id',title:'用户ID',width:100,sortable:true},
          {field:'userName',title:'用户昵称',width:100},
          {field:'r_name',title:'用户级别',width:100},
   /*        {field:'p_name',title:'用户权限',width:100},
          {field:'p_id',title:'权限等级',width:100,sortable:true} */
          ]],
		fitColumns:true,//允许表格自动缩放，以适应父容器
		pagination : true,//分页
		rownumbers:true,//显示行数  
		sortOrder:'asc',//正排序
		remoteSort:false,
		striped:'true',
		checkbox:true,
		rownumbers:'true',
		toolbar:'#utt'
/* 		toolbar:[{//工具栏
			id:'addu',
            text:'增加用户',
            iconCls:'icon-add',
            handler:function(){addUser()}
        },{
        	id:'delu',
            text:'删除用户',
            iconCls:'icon-clear',
            handler:function(){deleteSelectedUser()}
        },'-',{
        	id:'editu',
            text:'修改权限',
            iconCls:'icon-edit',
            handler:function(){editUser()}
        },'-',{
            text:'刷新',
            iconCls:'icon-reload',
            handler:function(){utload();}
        }] ,
        onClickCell: onClickCell,//单击
        onEndEdit: onEndEdit//编辑行
        */
	});
		//角色表
		$("#rdg").datagrid({
			url:'roleData.do',
			iconCls:'icon-man',
			columns:[[
	          {field:'r_id',title:'角色ID',width:100,sortable:true},
	          {field:'r_name',title:'角色名称',width:100},
	          {field:'r_status',title:'角色状态[0可用||1禁用]',width:100},
	          ]],
			fitColumns:true,//允许表格自动缩放，以适应父容器
			pagination : true,//分页
			rownumbers:true,//显示行数  
			sortOrder:'asc',
			striped:'true',
			remoteSort:false,
			checkbox:true,
			rownumbers:'true',
			toolbar:'#rtt',
/* 		toolbar:[{//工具栏
				id:'addr',
	            text:'增加角色',
	            iconCls:'icon-add',
	            handler:function(){addRole();}
	        },{
	        	id:'delr',
	            text:'角色禁用',
	            iconCls:'icon-clear',
	            handler:function(){stopRole();}
	        },{
	        	id:'editr',
	            text:'修改权限',
	            iconCls:'icon-edit',
	            handler:function(){editRole()}
	        },'-',{
	            text:'刷新',
	            iconCls:'icon-reload',
	            handler:function(){rdgload();}
	        }], 
	        onClickCell: onClickCell,//单击
	        onEndEdit: onEndEdit//编辑行 */
		});
	}
//绑定选项卡
	function userTab(){
	if($("#tt").tabs("exists","用户表")){
			$("#tt").tabs("select","用户表")
			/* $("#tt").tabs("upload","用户表") */
			utload();
		}else{
			$('#tt').tabs('add',{
			    title:'用户表',
			    content:'<div style="margin:20px 0"></div><h2>用户信息管理</h2><table id="ut"></table>',
			    closable:true,
				selected:true,
				iconCls:'icon-man',
			})
		}
	};
	function stuTab(){
		if($("#tt").tabs("exists","学生信息")){
				tableload();
				$("#tt").tabs("select","学生信息")
				/* $("#tt").tabs('update', {
					tab: tab,
					options: {
						title: '新标题',
						href: 'get_content.php'  // 新内容的URL
					}
				}); */
			}else{
				$('#tt').tabs('add',{
				    title:'学生信息',
				    content:'<table id="dg"></table>',
				    closable:true,
					selected:true
				})
			}
		};
		function roleTab(){
			if($("#tt").tabs("exists","角色信息")){
					$("#tt").tabs("select","角色信息")
					rdgload();
					/* $("#tt").tabs("upload","角色信息") */
				}else{
					$('#tt').tabs('add',{
					    title:'角色信息',
					    content:'<div style="margin:20px 0"></div><h2>角色信息管理</h2><table id="rdg"></table>',
					    closable:true,
						selected:true
					})
				}
			};
	///关闭选项卡
	$('#tt').tabs({
		  onBeforeClose: function(title,index){
			var target = this;
			$.messager.confirm('确认','你确认想要关闭'+title,function(r){
				if (r){
					var opts = $(target).tabs('options');
					var bc = opts.onBeforeClose;
					opts.onBeforeClose = function(){};  // 允许现在关闭
					$(target).tabs('close',index);
					opts.onBeforeClose = bc;  // 还原事件函数
				}
			});
			return false;	// 阻止关闭
		  }
		});
	//增加角色
	function addRole(){
		$('#addRoleDialog').dialog('open');	
	}
	//增加用户
	function addUser(){
	$('#addUserDialog').dialog('open');	
	}
	//修改用户
	function editUser(){
		var checkRow=$("#ut").datagrid("getChecked");
		if(checkRow.length>1){
			 alert("不可同时编辑多条！");
	         return false;
		}
		if(checkRow==0){
			 alert("请最少选择一条！");
	        return false;
		}/* if(checkRow){
			
		} */
		if(checkRow[0].r_name=='系统管理员'){
			alert("系统管理员权限不可被修改！");
			return false;
		}
			userFormLoad();
			$('#editUserDialog').dialog('open');
	};
	//增加用户
	
	//获取所选行的学生学号修改
	function getSelectedRow(){
	var checkRow=$("#dg").datagrid("getChecked");
	if(checkRow.length>1){
		 alert("不可同时编辑多条！");
         return false;
	}
	if(checkRow==0){
		 alert("请最少选择一条！");
        return false;
	}
		//学生表单的数据操作
		  stuFormLoad(); 
		$('#editStudentDialog').dialog('open');
	 	/*  stuFormLoad();  */
};	//学生增加
	function stuAdd(){
	var checkRow=$("#dg").datagrid("getChecked");
	if(checkRow.length>0){
		 alert("请取消复选框！");
         return false;
	}
	/* 	alert(checkRow[i].stuNo+222);	 */
		//学生表单的数据操作
		$('#addStudentDialog').dialog('open');
};
	//新增权限信息加载
	function addTreeFormLoad(){
		 var node = $("#mp").tree('getSelected');
		 var nodes1 = $('#mp').tree('getChildren');
	    /*  alert(node.attributes.parent);  */
			$('#appendForm').form('load',{
				parent_id:node.id,
				p_id:nodes1.length+1,
		});
	}
//学生表单信息加载
	function stuFormLoad(){
		var checkRow=$("#dg").datagrid("getChecked");
		 	/* $('#editForm').form('clear');  */
		 	/* alert(checkRow[0].stuNo); */
			$('#editForm').form('load',{
				stuNo:checkRow[0].stuNo,
				stuName:checkRow[0].stuName,
				stuClass:checkRow[0].stuClass,
				stuChinese:checkRow[0].stuChinese,
				stuMath:checkRow[0].stuMath,
				stuEnglish:checkRow[0].stuEnglish
		});
	}
	//用户权限表单信息加载
	function userFormLoad(){
		var checkRow=$("#ut").datagrid("getChecked");
		 	/* $('#editForm').form('clear');  */
		 	/* alert(checkRow[0].stuNo); */
			$('#editUserForm').form('load',{
				id:checkRow[0].id,
				name:checkRow[0].userName,
				p_id:checkRow[0].r_name,
		});
	}
	
	//学生表单信息清除
	function fromClear(){
		$('#editForm').form('clear');
	}
	//用户表单信息刷新
	function uFormReset(){
		var checkRow=$("#ut").datagrid("getChecked");
		$('#editUserForm').form('load',{
			id:checkRow[0].id,
			name:checkRow[0].userName,
			p_id:$("#ur_id").combobox('getText')
		});
	}

	//删除所选行的学生
	function deleteSelectedStudent(){
			var checkRow=$("#dg").datagrid("getChecked");
			 if(checkRow==0){
				 alert("请至少选择一项!");
                 return false;
			 }
		if(confirm("确定删除"+(checkRow.length)+"个学生")){
		for(var i=0;i<checkRow.length;i++){
		
			var stuNos=checkRow[i].stuNo;
		   	$.post('del.do',
                   	{
          			"stuNos":stuNos
                    },function(result){
                    	/* $('#dg').html(result); */
                    	alert("删除成功");
                    	tableload();
                    })
			}
		}
	};
	//删除所选行的用户
	function deleteSelectedUser(){
			var checkRow=$("#ut").datagrid("getChecked");
			 if(checkRow==0){
				 alert("请至少选择一项!");
                 return false;
			 }
		if(confirm("确定删除"+(checkRow.length)+"个学生")){
		for(var i=0;i<checkRow.length;i++){
		
			var id=checkRow[i].id;
		   	$.post('deleteUser.do',
                   	{
          			"id":id
                    },function(result){
                    	/* $('#dg').html(result); */
                    	if(result==1){
                    		alert("删除成功");	
                    		utload();
                    	}else{
                    		alert("删除失败");	
                    		utload();
                    	}
                    })
			}
		}
	};
	//表格数据刷新
	function tableload(){
		$("#dg").datagrid("load");//重新加载表格
		//$("#dg").datagrid("reload");//重新加载当前页
	};
	function utload(){
		$("#ut").datagrid("load");//重新加载表格
		//$("#dg").datagrid("reload");//重新加载当前页
	};
	function rdgload(){
		$("#rdg").datagrid("load");//重新加载表格
	};

    function changeP(){
        var dg = $('#dg');
        dg.datagrid('loadData',[]);
        dg.datagrid({pagePosition:$('#p-pos').val()});
        dg.datagrid('getPager').pagination({
            layout:['list','sep','first','prev','sep',$('#p-style').val(),'sep','next','last','sep','refresh','info']
        });
    }
	function doSearch(){
		$('#dg').datagrid('load',{
			stuNo: $("input[name='stuNo']").val(), 
			stuName: $("input[name='stuName']").val()
		});
	}
	//增加学生
	 	function  addstuclick(){
	    $.post(
	    		"addStudent.do",//服务器地址
	    			{"stuNo":$("#astuNo").val(),
	    			"stuName":$("#astuName").val(),
	    			"stuClass":$("#astuClass").val(),
	    			"stuChinese":$("#astuChinese").val(),
	    			"stuMath":$("#astuMath").val(),
	    			"stuEnglish":$("#astuEnglish").val(),
	    		}, //请求数据
	    function(result){
	  	if(result=="1"){
	    		alert("增加成功");
	    		tableload();
	    	}else if(result=="0"){
	    		alert("学号重复增加失败");
	    	}
	    		alert("服务器异常增加失败");
	  
	    },'json') 
 	    }
	 	
	 	 function ajaxaddcheck(){
 	    		var title=$("#appendPtitle").val();
 	    		var url=$("#appendPurl").val();
			if(title.length<=0){
				alert("权限昵称不能为空");
				return;
			}
			if(url.length<=0){
				alert("权限url不能为空");
				return;
			}
			ajaxadd();
		}
 	    function addstucheck(){
 	    		var no=$("#astuNo").val();
 	    		var name=$("#astuName").val();
 	    		var sclass=$("#astuClass").val();
 	    		var chinese=$("#astuClass").val();
 	    		var math=$("#astuMath").val();
 	    		var english=$("#astuEnglish").val();
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
				addstuclick();
		}
 	    //修改学生信息
 /* 	    	$(document).ready(function(){
				$("#upload").click(function () {
					if(check()){
					//uploadclick();	
					}
				});
	
			}); */
 	    function  uploadstuclick(){
				
	    $.post(
	    		"uploadStudentByNo.do",//服务器地址
	    		{"stuNo":$("#stuNo").val(),
	    			"stuName":$("#stuName").val(),
	    			"stuClass":$("#stuClass").val(),
	    			"stuChinese":$("#stuChinese").val(),
	    			"stuMath":$("#stuMath").val(),
	    			"stuEnglish":$("#stuEnglish").val(),
	    		}, //请求数据
	    function(result){
	  	if(result=="1"){
	    		alert("修改成功");
	    		// fomrReset();
	    		tableload();
	    	}else{
	    		alert("修改失败，服务器问题");
	    	}
	    },'json') 
 	    }
 	    function editcheck(){
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
				uploadstuclick();
		}
</script>
</html>