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
    <h2>Row Editing in DataGrid</h2>
    <p>Click the row to start editing.</p>
    <div style="margin:20px 0;"></div>
    
    <table id="rdg" class="easyui-datagrid" title="Row Editing in DataGrid" style="width:700px;height:auto"
            data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#tb',
                url: 'roleData.do',
                method: 'post',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit
            ">
        <thead>
            <tr>
						<th data-options="field:'r_id',sortable:'true'" width="100" >角色ID</th>
						<th data-options="field:'r_name'" width="100">角色级别</th>
						<th data-options="field:'p_name'" width="100">角色权限</th>
						<th data-options="field:'p_id'" width="100">权限等级</th>
            </tr>
        </thead>
    </table>
 
    <div id="tb" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">Append</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">Remove</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">Accept</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
    </div>
    
    <script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#rdg').datagrid('validateRow', editIndex)){
            $('#rdg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                $('#rdg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#rdg').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#rdg').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }
    function onEndEdit(index, row){
        var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'r_name'
        });
        row.productname = $(ed.target).combobox('getText');
    }
    function append(){
        if (endEditing()){
            $('#rdg').datagrid('appendRow',{status:'P'});
            editIndex = $('#rdg').datagrid('getRows').length-1;
            $('#rdg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#rdg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    function accept(){
        if (endEditing()){
            $('#rdg').datagrid('acceptChanges');
        }
    }
    function reject(){
        $('#rdg').datagrid('rejectChanges');
        editIndex = undefined;
    }
    function getChanges(){
        var rows = $('#rdg').datagrid('getChanges');
        alert(rows.length+' rows are changed!');
    }
    </script>
</body>
</body>
</html>