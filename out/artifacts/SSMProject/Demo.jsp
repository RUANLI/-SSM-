<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/SSMProject/js/demo/demo.css">
    <script type="text/javascript" src="/SSMProject/js/jquery.min.js"></script>
    <script type="text/javascript" src="/SSMProject/js/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>Complex Layout</h2>
	<p>This sample shows how to create a complex layout.</p>
	<div style="margin:20px 0;"></div>
	<div class="easyui-layout" style="width:700px;height:350px;">
		<div data-options="region:'north'" style="height:50px"></div>
		<div data-options="region:'south',split:true" style="height:50px;"></div>
		<div data-options="region:'east',split:true" title="East" style="width:180px;">
			<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
		</div>
		<div data-options="region:'west',split:true" title="管理操作" style="width:100px;">
			<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="学生管理" style="padding:10px;">
					content1
				</div>
				<div title="用户管理" data-options="selected:true" style="padding:10px;">
					content2
				</div>
				<div title="Title3" style="padding:10px">
					content3
				</div>
			</div>
		</div>
		<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
			<div class="easyui-tabs" data-options="fit:true,border:false,plain:true">
				<div title="About" data-options="href:'_content.html'" style="padding:10px"></div>
				<div title="DataGrid" style="padding:5px">
					<table class="easyui-datagrid"
							data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
						<thead>
							<tr>
								<th data-options="field:'itemid'" width="80">Item ID</th>
								<th data-options="field:'productid'" width="100">Product ID</th>
								<th data-options="field:'listprice',align:'right'" width="80">List Price</th>
								<th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
								<th data-options="field:'attr1'" width="150">Attribute</th>
								<th data-options="field:'status',align:'center'" width="50">Status</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>