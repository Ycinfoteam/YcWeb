<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 40px;
}

.fitem input {
	width: 160px;
}

.fitem textarea{
	font-size: 14px;
	width: 160px;
	height:70px;
}

</style>

    
<table id="show_jobtype"></table>
<div id="jobdlg" class="easyui-dialog"
	style="width: 280px; height: 200px; padding: 10px 20px" closed="true"
	buttons="#fooddlg-buttons">
	<div class="ftitle">
		添加新职务
	</div>
	<form id="jobfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				职务:
			</label>
			<input name="j_name" class="easyui-textbox" required="true">
		</div>
	</form>
</div>

<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveJobType()" style="width: 90px">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#jobdlg').dialog('close')"
		style="width: 90px">取消</a>
</div>



<script type="text/javascript"> 

$(function(){
  $('#show_jobtype').datagrid({
    	url: 'findAllJobType',	//查询时加载的URL
    	pagination:true,	//显示分页
    	pageSize:2,		//默认分页的条数
    	pageList:[2,4,6],	//可选分页条数
    	fitColumns:true,	//自适应列
    	fit:true,	//自动补全
    	title:"方向类型管理", 
    	iconCls:"icon-save",//图标
    	idField:"j_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
    	rownumbers:"true",	//显示行号
    	nowrap:"true",	//不换行显示
    	sortName:"j_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
    	sortOrder:"desc",	//排序方式
    	striped:true,	//交替显示背景
    	columns:[[
		{
       	 	field:'ck',
			checkbox:true,
			formatter:function(value,row,index){				
					return row;
			}
		 },{
       	 	field:'j_id',
       	 	title:'编号',
       	 	width:50,
       	 	align:'center',
       	 	hidden:true,
       	 },{
       	 	field:'j_name',
       	 	title:'方向',
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


function saveJobType(){
	
	var j_name=$('input[name="j_name"]').val();
	
	$.ajax({
		url:"addJobType",
		type:"post",
		dataType:"json",
		data:{
			j_name:j_name
		},
		success:function(data){
			if(data==1){
				$.messager.alert('确认','添加成功','info');
				$('#jobdlg').dialog('close');
				$('#show_jobtype').edatagrid('reload'); 
			}
		}
	});
}

function deleteJobType(){
	var j_id=new Array();
	var rows = $('#show_jobtype').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		j_id.push(rows[i].j_id);
	}
	$.ajax({
 		url:"deleteJobType",
 		type:"post",
		dataType:"json",
		data:{
			j_id:j_id
		},
 		success:function(data){
 			if(data==1){
				$('#show_jobtype').datagrid('reload');
				$('#show_jobtype').datagrid('clearSelections');
			}
 		}
 	});
}

</script>

