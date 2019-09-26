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
			用户：
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
   		  
	</div>
	<div data-options="region:'west',split:true,title:'管理操作'" style="width:150px;padding:5px">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="学生管理" style="padding:10px">
					<ul class="easyui-tree">
						<li><a id="click1" href="javascript:void(0)"  style="width:120px" onclick="stuTab()">学生列表</a></li>
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
	
	//学生表单信息清除
	function fromClear(){
		$('#editForm').form('clear');
	}

	
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

</script>
</html>