<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
#administrator{
	margin-left:20px;
}
#administrator label{
	margin-left:20px;
	display:inline-block;
	width:70px;
	text-align: center;
	margin-top:30px;
}
#updatebutton{
	margin-top:20px;
	margin-left:90px;
}
#savebutton{
	margin-left:30px;
}
</style>

    
<table id="show_admin"></table>
<div>
	<form id="administrator">
		<label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
		<input name="name" type="text" disabled="true"/><br/>
		<label>联系方式:</label>
		<input name="tel" type="text" disabled="true" /><br/>
		<input id="updatebutton" type="button" value="更改" onclick="update()"/>
		<input id="savebutton" type="button" value="保存" onclick="save()"/>
	</form>
	

</div>


<script type="text/javascript"> 
$(function(){
	$.ajax({
		url:'findAdministrator1',
		type:'post',
		dataType:'json',
		success:function(data){
			$('input[name="name"]').val(data.name);
			$('input[name="tel"]').val(data.tel);
		}
	}); 
	
});

function update(){
	$('input[name="name"]').removeAttr('disabled');
	$('input[name="tel"]').removeAttr('disabled');
}

function save(){
	$('input[name="name"]').attr('disabled', true);
	$('input[name="tel"]').attr('disabled', true);
	var name=$('input[name="name"]').val();
	var tel=$('input[name="tel"]').val();
	$.ajax({
		url:'updateAdministrator',
		type:'post',
		dataType:'json',
		data:{
			name:name,
			tel:tel
		}
	});
	
}

/* $(function(){
  $('#show_admin').datagrid({
    	url: 'findAdministrator',	//查询时加载的URL
    	pagination:true,	//显示分页
    	pageSize:2,		//默认分页的条数
    	pageList:[2,4,6],	//可选分页条数
    	fitColumns:true,	//自适应列
    	fit:true,	//自动补全
    	title:"管理员", 
    	iconCls:"icon-save",//图标
    	rownumbers:"true",	//显示行号
    	nowrap:"true",	//不换行显示
    	sortOrder:"desc",	//排序方式
    	striped:true,	//交替显示背景
    	columns:[[
		{
       	 	field:'name',
       	 	title:'姓名',
       	 	width:50,
       	 	align:'center',
       	 },{
       	 	field:'tel',
       	 	title:'联系电话',
       	 	width:50,
       	 	align:'center',
       	 }]],
       	toolbar: [{
         	text:"增加",
			iconCls: 'icon-add',
			handler : function() {  
                $('#jobdlg').dialog('open').dialog('setTitle','新增案例');
        		$('#jobfm').form('clear');
            }  
		},'-',{
         	text:"删除",
			iconCls: 'icon-remove',
			handler : function() {  
				deleteJobType();
            }  
		}]
	});
});
 */

</script>

