<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理系统</title>
<style>
        *{
            margin: 0;
            padding: 0;
        }
        .left{
            float: left;
            position: fixed;
            left: 5px;
            top: 10px;
        }
        .right{
            float: right;
            position: fixed;
            right: 5;
            top: 8px;
        }
 </style>
	<link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/demo/demo.css">
    <script type="text/javascript" src="/SSMProject/js/jquery.min.js"></script>
    <script type="text/javascript" src="/SSMProject/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/SSMProject/js/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div class="header" data-options="region:'north',border:false" style="height:60px;background:#0f66ab;padding:10px,">
    	<div class="left" style="display:inline-block;position:fixed;">
        	<h1 style="color:white;">学生在线管理平台</h1>
        </div>
        <div class="right" style="display:inline-block;position:absolute;top: 15px;right: 10px;color:white;">
        	<p><strong class="easyui-tooltip" title="2条未读消息">
        	<% HttpSession s = request.getSession();%>
			系统管理员：
			<span style="font: 200;"><%=s.getAttribute("user_Name")%></span>	
			</strong>:欢迎您！<a href="logout.do">安全退出</a>
        </div>
   </div>
<!-- 	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px"></div> -->
	<div data-options="region:'east',split:true,collapsed:true,title:'管理操作'" style="background:#0f66ab;width:200px;padding:10px">
   		<!-- <div id="editStudentDialog" class="easyui-dialog" title="编辑菜单" style="width:300px;height:300px" data-options="closed:true,resizable='true',
   			href:'studentTable'"
   		> -->
   		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#editStudentDialog').dialog('open')">Open</a>
   		     <div id="addUserDialog" class="easyui-dialog" title="增加用户" data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#addUserForm'), 
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
            " style="width:300px;height:300px;padding:10px">
        </div>	
   		  <div id="editUserDialog" class="easyui-dialog" title="修改权限" data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#editUserForm'), 
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
            " style="width:300px;height:300px;padding:10px">
        </div>	
   		  	<div id="addStudentDialog" class="easyui-dialog" title="新增信息" data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true,content:$('#addForm'), 
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
            " style="width:300px;height:300px;padding:10px">
        </div>	
   		<div id="editStudentDialog" class="easyui-dialog" title="编辑信息" data-options="iconCls:'icon-save', closed:true,draggable:true,modal:true, content:$('#editForm'),
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
            " style="width:300px;height:300px;padding:10px">
        </div>
            <form id="editForm" class="addForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
            <input id="productId" type="hidden" name="id" />
            <table>
                <tr>
                    <td>学生学号:</td>
                    <td><input readonly id="stuNo" class="easyui-textbox" type="text" autocomplete="off" name="stuNo" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>学生姓名:</td>
                    <td><input id="stuName" class="easyui-textbox" type="text" name="stuName" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>学生班级:</td>
                    <td><input id="stuClass"  class="easyui-textbox" type="text" name="stuClass" ></input></td>
                </tr>
                <tr>
                    <td>语文成绩:</td>
                    <td><input id="stuChinese" class="easyui-textbox" type="text" name="stuChinese" ></input></td>
                </tr>
                <tr>	
                    <td>数学成绩:</td>
                    <td><input id="stuMath" class="easyui-textbox" type="text" name="stuMath" ></input></td>
                </tr>
                <tr>
                    <td>英语成绩:</td>
                    <td><input id="stuEnglish" class="easyui-textbox"  type="text" name="stuEnglish" ></input></td>
                </tr>
            </table>
        </form>
        <form id="addForm" class="addForm" method="post" enctype="multipart/form-data"<%--上传图片--%>>
            <input id="productId" type="hidden" name="id" />
            <table>
                <tr>
                    <td>学生学号:</td>
                    <td><input id="astuNo" class="easyui-textbox" type="text" autocomplete="off" name="stuNo" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>学生姓名:</td>
                    <td><input id="astuName" class="easyui-textbox" type="text" name="stuName" data-options="required:true"></input></td>
                </tr>
                <tr>
                    <td>学生班级:</td>
                    <td><input id="astuClass"  class="easyui-textbox" type="text" name="stuClass" ></input></td>
                </tr>
                <tr>
                    <td>语文成绩:</td>
                    <td><input id="astuChinese" class="easyui-textbox" type="text" name="stuChinese" ></input></td>
                </tr>
                <tr>
                    <td>数学成绩:</td>
                    <td><input id="astuMath" class="easyui-textbox" type="text" name="stuMath" ></input></td>
                </tr>
                <tr>
                    <td>英语成绩:</td>
                    <td><input id="astuEnglish" class="easyui-textbox"  type="text" name="stuEnglish" ></input></td>
                </tr>
            </table>
        </form>
        <form id="addUserForm"  method="post" enctype="multipart/form-data"<%--上传图片--%>>
            <input id="productId" type="hidden" name="id" />
            <table>
                <tr>
                    <td>用户ID:</td>
                    <td><input  id="a_id" class="easyui-textbox" type="text" autocomplete="off" name="id" data-options="required:true,novalidate:true"style="width:100%"></input></td>
                </tr>
                <tr>
                    <td>用户昵称:</td>
                    <td><input  id="a_name" class="easyui-textbox" type="text" autocomplete="off" name="name" data-options="required:true,novalidate:true"style="width:100%"></input></td>
                </tr>
                 <tr>
                    <td>用户密码:</td>
                    <td><input  id="a_psd" class="easyui-textbox" type="text" autocomplete="off" name="psd" data-options="required:true,novalidate:true"style="width:100%"></input></td>
                </tr>
                <tr>
                    <td>角色:</td>
                    <td>
                    <select id="a_p_id" class="easyui-combobox" name="r_id" data-options="required:true"style="width:100%">
                                    <option value="0">用户</option>
                					<option value="1">管理员</option>
                					<option value="2">超级管理员</option>
                    </select>
                 	</td>
                </tr>
            </table>
        </form>
        <form id="editUserForm"  method="post" enctype="multipart/form-data"<%--上传图片--%>>
            <input id="productId" type="hidden" name="id" />
            <table>
                <tr>
                    <td>用户ID:</td>
                    <td><input readonly id="u_id" class="easyui-textbox" type="text" autocomplete="off" name="id" data-options="required:true"style="width:100%"></input></td>
                </tr>
                 <tr>
                    <td>用户昵称:</td>
                    <td><input readonly id="u_name" class="easyui-textbox" type="text" autocomplete="off" name="name" data-options="required:true"style="width:100%"></input></td>
                </tr>
                <tr>
                    <td>权限等级:</td>
                    <td><select id="p_id" class="easyui-combobox" name="p_id" data-options="required:true"style="width:100%">
                                    <option value="1">用户</option>
                					<option value="2">管理员</option>
                					<option value="3">系统管理员</option>
                    </select></td>
                </tr>
            </table>
        </form>
	</div>
	<div data-options="region:'west',split:true,title:'管理操作'" style="width:150px;padding:5px">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="学生管理" style="padding:10px">
					<ul class="easyui-tree">
						<li><a id="click1" href="javascript:void(0)"  style="width:120px" onclick="stuTab()">学生列表</a></li>
					</ul>
				</div>
				<div title="用户管理" style="padding:10px;">
					<ul class="easyui-tree">
						<li><a  href="javascript:void(0)"  style="width:120px" onclick="stuTab()">学生列表</a></li>
                		<li><a id="click2" href="javascript:void(0)" data-options="iconCls:'icon-reload',closable:true">用户管理</a></li>
                	</ul>
				</div>
				<div title="管理员管理" style="padding:10px">
					<ul class="easyui-tree">
						<li><a  href="javascript:void(0)"  style="width:120px" onclick="stuTab()">学生列表</a></li>
                		<li><a  href="javascript:void(0)" data-options="iconCls:'icon-reload',closable:true" onclick="userTab()">用户管理</a></li>
                    	<li><a id="click3" href="javascript:void(0)" data-options="iconCls:'icon-reload',closable:true">角色权限</a></li>
<!--                 		<li><a id="click4" href="javascript:void(0)" data-options="iconCls:'icon-reload',closable:true">系统参数</a></li>
                        <li><a id="click5" href="javascript:void(0)" data-options="iconCls:'icon-reload',closable:true">操作日志</a></li> -->
                	</ul>
				</div>
			</div>
	</div>
	<div data-options="region:'center',title:'Center',title:'Main Title',iconCls:'icon-ok'">
		<div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
				<div title="About" data-options="closable:true"style="padding:10px;">欢迎来到学生管理页面！
				    <div style="margin:20px 0;position: fixed;"></div>
    				<div class="easyui-calendar" style="width:300px;height:300px;position:absolute;top: 100px;right: 10px;"></div>
				</div>
				<div title="学生信息" data-options="iconCls:'icon-reload'" style="padding:5px">	
					<div style="margin:20px 0"></div>
					<h2>学生信息管理</h2>
						<div style="height:40px;width: 500px">
    					<a id="addStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" >增加学生</a>
    					<a id="deleteStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deleteSelectedStudent()">删除学生</a>
    					<a id="editStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="getSelectedRow()">修改学生</a>
    					<a id="loadStu" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="tableload()">刷新表格</a>
    					</div>
    					<div style="margin:20px 0"></div>
    					<p>
      						<strong>分页栏位置</strong>
       						 <select id="p-pos" onchange="changeP()">
            					<option>bottom</option>
           					 	<option>top</option>
            					<option>both</option>
       						</select>
           					<strong>分页栏风格</strong>
        					<select id="p-style" onchange="changeP()">
           						 <option>manual</option>
           						 <option>links</option>
       						 </select>
    					</p>
    				<div style="margin:20px 0;">
					<table id="dg" class="easyui-datagrid"  style="width:auto"
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
				 <div id="st" style="padding:3px">
        			<span>学生学号:</span>
        			<input name="stuNo" style="line-height:26px;border:1px solid #ccc">
        			<span>学生姓名:</span>
        			<input name="stuName" style="line-height:26px;border:1px solid #ccc">
       				<a id="search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="doSearch()">搜索</a>
    	</div>
			</div>
		</div>
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
	$("#addStu").click(function () {
		//清除from表单input内容
		 $("#addForm input").val("");
			stuAdd();
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
});
	//增加用户
	function addUserclick(){
		$.post('addUserPrivate.do',
               	{
      			"id":$("#a_id").val(),
      			"userName":$("#a_name").val(),
      			"userPassword":$("#a_psd").val(),
      			"r_id":$("#a_p_id").val(),
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
	   	$.post('uploadUserPrivate.do',
               	{
      			"id":$("#u_id").val(),
      			"p_id":$("#p_id").val(),
                },function(result){
                	/* $('#dg').html(result); */
                	if(result==1){
                		alert("修改成功");
                		utload();
                	}else{
                		alert("修改失败");
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
          {field:'p_name',title:'用户权限',width:100},
          {field:'p_id',title:'权限等级',width:100,sortable:true}
          ]],
		fitColumns:true,//允许表格自动缩放，以适应父容器
		pagination : true,//分页
		rownumbers:true,//显示行数  
		sortOrder:'asc',//正排序
		remoteSort:false,
		checkbox:true,
		rownumbers:'true',
		toolbar:[{//工具栏
            text:'增加用户',
            iconCls:'icon-add',
            handler:function(){addUser()}
        },{
            text:'删除用户',
            iconCls:'icon-clear',
            handler:function(){deleteSelectedUser()}
        },'-',{
            text:'修改权限',
            iconCls:'icon-edit',
            handler:function(){editUser()}
        },'-',{
            text:'保存',
            iconCls:'icon-save',
            handler:function(){alert('save')}
        }],
/*        onClickCell: onClickCell,//单击
        onEndEdit: onEndEdit//编辑行 */
	});
		//角色表
		$("#rdg").datagrid({
			url:'roleData.do',
			iconCls:'icon-man',
			columns:[[
	          {field:'r_id',title:'角色ID',width:100,sortable:true},
	          {field:'r_name',title:'角色级别',width:100},
	          {field:'p_name',title:'角色权限',width:100},
	          {field:'p_id',title:'角色等级',width:100,sortable:true}
	          ]],
			fitColumns:true,//允许表格自动缩放，以适应父容器
			pagination : true,//分页
			rownumbers:true,//显示行数  
			sortOrder:'asc',
			remoteSort:false,
			checkbox:true,
			rownumbers:'true',
			toolbar:[{//工具栏
	            text:'增加角色',
	            iconCls:'icon-add',
	            handler:function(){alert('add')}
	        },{
	            text:'删除角色',
	            iconCls:'icon-clear',
	            handler:function(){alert('remove')}
	        },{
	            text:'修改角色',
	            iconCls:'icon-edit',
	            handler:function(){alert('edit')}
	        },'-',{
	            text:'保存',
	            iconCls:'icon-save',
	            handler:function(){alert('save')}
	        }],
	/*         onClickCell: onClickCell,//单击
	        onEndEdit: onEndEdit//编辑行 */
		});
	} 
//绑定选项卡
	function userTab(){
	if($("#tt").tabs("exists","用户表")){
			utload();
			$("#tt").tabs("select","用户表")
			$("#tt").tabs("upload","用户表")
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
				$("#tt").tabs("upload","学生信息")
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
					tableload();
					$("#tt").tabs("select","角色信息")
					$("#tt").tabs("upload","角色信息")
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
		}
		/* 	alert(checkRow[i].stuNo+111111);	 */
			//加载用户权限表
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
	/* 	alert(checkRow[i].stuNo+111111);	 */
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
				p_id:checkRow[0].p_id,
		});
	}
	//学生表单信息清除
	function fromClear(){
		$('#editForm').form('clear');
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
	    	}else{
	    		alert("学号重复增加失败");
	    	}
	    },'json') 
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