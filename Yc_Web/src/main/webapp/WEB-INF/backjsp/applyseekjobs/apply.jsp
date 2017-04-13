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
	width: 80px;
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

    
<table id="show_apply"></table>

<div id="toolbar">
		<label>条件查询：</label> 
		<input id="findBytype" class="easyui-combobox" name="dept"  
   			 data-options="valueField:'j_name',textField:'j_name',url:'showJobType'" />
   			  
		<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" 
			data-options="iconCls:'icon-search'" onclick="findApplyBytype()" >查询</a>
		<a id="btn2" href="javascript:void(0)" class="easyui-linkbutton" 
			data-options="iconCls:'icon-ok'" onclick="checkStatus()" >已审核</a> 
</div>

<script type="text/javascript"> 



$('#show_apply').datagrid({
	toolbar: '#toolbar'
});

$(function(){
  $('#show_apply').datagrid({
    	url: 'findAllApply',	//查询时加载的URL
    	pagination:true,	//显示分页
    	pageSize:2,		//默认分页的条数
    	pageList:[2,4,6],	//可选分页条数
    	fitColumns:true,	//自适应列
    	fit:true,	//自动补全
    	title:"应聘信息管理", 
    	iconCls:"icon-save",//图标
    	idField:"a_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
    	rownumbers:"true",	//显示行号
    	nowrap:"true",	//不换行显示
    	sortName:"a_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
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
       	 	field:'a_id',
       	 	title:'ID',
       	 	width:50,
       	 	align:'center',
       	 	hidden:true,
	     },{
       	 	field:'a_name',
       	 	title:'姓名',
       	 	width:50,
       	 	align:'center',
       	 },{
       	 	field:'a_tel',
       	 	title:'联系电话',
       	 	width:50,
       	 	align:'center',
       	 },{
       	 	field:'a_email',
       	 	title:'邮箱',
       	 	width:50,
       	 	align:'center',
         },{
       	 	field:'a_orientation',
       	 	title:'就职方向',
       	 	width:50,
       	 	align:'center',
       	 formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
 			//必须返回一个字符串、用于替换被加formatter的单元格。
 			if (value == 1) {
 				return 'Java工程师';
 			}
 			if (value == 2) {
 				return '大数据工程师';
 			}
 			if(value==3){
 				return 'Web前端工程师';
 			}
 			if(value==4){
 				return '嵌入式工程师';
 			}
 			
 		}
 	} , 
       	 {
       	 	field:'a_detail',
       	 	title:'个人简介',
       	 	width:50,
       	 	align:'center',
       	 },{
       	 	field:'a_status',
       	 	title:'审核状态',
       	 	width:100,
       	 	align:'center',
       		formatter: function(value,row,index){
				if (value==1){
					return "已审核";
				} else {
					return "未审核"; 
				}
			},
       	  }]],
	});
});

function findApplyBytype(){
	var a_orientation=$('#findBytype').combobox('getValue');

	$('#show_apply').datagrid({
		queryParams:{a_orientation:a_orientation}
	});
}

function checkStatus(){
	var a_id= new Array();
	var rows = $('#show_apply').datagrid('getSelections');
 	for(var i=0;i<rows.length;i++){
 		a_id.push(rows[i].a_id);
	} 
 	$.ajax({
 		url:"updateApply",
 		type:"post",
		dataType:"json",
		data:{
			a_id:a_id
		},
 		success:function(data){
 			if(data==1){
				$('#show_apply').datagrid('reload');
				$('#show_apply').datagrid('clearSelections');
			}
 		}
 	});
}

</script>

