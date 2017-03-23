<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<table id="admindg"></table>

<script type="text/javascript">
	$(function(){
	   $('#admindg').edatagrid({
        	url: 'findAdmin',	//查询时加载的URL
            saveUrl: 'addAdmin',
        	pagination:true,	//显示分页   
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"管理员管理",
        	iconCls:"icon-save",//图标
        	idField:"a_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"a_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	striped:true,
        	columns:[[{
           	 	field:'a_id',
           	 	title:'管理员ID',
           	 	width:100,
           	 	align:'center',
           	 	hidden:true, 
           	 },{
           	 	field:'a_name',
           	 	title:'管理员名',
           	 	width:100,
           	 	align:'center',
           	 	 editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           	 	} 
           	 },{
           	 	field:'a_pwd',
           	 	title:'密码',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           	 	},
           	 	formatter: function(value,row,index){//value:这个单元格真实值，row:表示这一行，index:这一行的索引
					return "******";
				}
           	 }]],
           	 
           	 //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler: function(){
					$('#admindg').edatagrid('addRow')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#admindg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#admindg').edatagrid('cancelRow')
				}
			}]
			
    	});
    });
</script>
