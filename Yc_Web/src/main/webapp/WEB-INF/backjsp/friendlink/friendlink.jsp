
 
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
}·

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
</style>



<table id="friendlinkdg">
</table>

<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveFood()" style="width: 90px">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#friendlinklg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#friendlinkdg').edatagrid({
        	url: 'friendlink_findPartFriendLinks.action',	//查询时加载的URL
            saveUrl: 'friendlink_addFriendLink.action',
            updateUrl: 'friendlink_updateFriendLink.action', 
            destroyUrl: 'friendlink_deleteFriendLink.action',
            
        	pagination:true,	//不分页
        	pageSize:10,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"友情链接管理",
        	iconCls:"icon-save",//图标
        	idField:"flid",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"flid",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"desc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'flid',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 },{
           	 	field:'title',
           	 	title:'链接标题',
           	 	width:100,
           	 	align:'center',
           		editor:{
					type:'validatebox',
					options:{
						required:true
					}
				}
           	 },{
           	 	field:'hyperlink',
           	 	title:'链接地址',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
					type:'validatebox',
					options:{
						required:true
					}
				}
           	  } /* ,{
           	 	field:'target',
           	 	title:'target',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
					type:'validatebox',
					options:{
						required:true
					}
				}
           	  } */ ,{
             	 field:'account',
               	 title:'排序',
               	 width:100,
               	 align:'center',
               	editor:{
					type:'validatebox',
					options:{
						required:true
					}
				}
              }
           	 ]],
           	 
           //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler: function(){
					$('#friendlinkdg').edatagrid('addRow')
				}
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#friendlinkdg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#friendlinkdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#friendlinkdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    });
    

</script>
 