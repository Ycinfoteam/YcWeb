<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<table id="admindg"></table>

<script type="text/javascript">
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#admindg').edatagrid({
        	url: 'backadmin_findBackadmin.action',	//查询时加载的URL
            saveUrl: 'backadmin_addBackadmin.action',
            updateUrl: 'backadmin_updateBackadmin.action',
            destroyUrl: 'backadmin_deleteBackadmin.action',
            
        	pagination:false,	//显示分页   
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"管理员管理",
        	iconCls:"icon-save",//图标
        	idField:"adminname",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"adminname",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[{
           	 	field:'adminname',
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
           	 	field:'adminpwd',
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
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#admindg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
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
    })();
</script>
