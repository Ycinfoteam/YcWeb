
 
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="${basePath }ckeditor/ckeditor.js"></script>
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
</style>



<table id="applydg">
</table>

<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveApply()" style="width: 90px">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#applydlg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#applydg').edatagrid({
        	url: 'apply_listApply.action',	//查询时加载的URL
          //  saveUrl: 'yyyback/jobandapply.action?op=list',
          //  updateUrl: 'yyyback/jobandapply.action?op=updatejob', 
            destroyUrl: 'apply_deleteApply.action',
            
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"应聘信息管理",
        	iconCls:"icon-save",//图标
        	idField:"aid",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"aid",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"desc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'aid',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'position',
           	 	title:'应聘职位',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'aname',
           	 	title:'姓名',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'tel',
           	 	title:'联系电话',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'address',
           	 	title:'联系地址',
           	 	width:100,
           	 	align:'center',
           	 	
           	  } ,{
           	 	field:'email',
           	 	title:'联系email',
           	 	width:100,
           	 	align:'center',
           	 	
           	  } ,{
           	 	field:'remarks',
           	 	title:'应聘信息',
           	 	width:100,
           	 	align:'center'
           	 	/* editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		 } */
           	  }
           	 
           	 ]],
           	 
           	 //定义按钮
	         toolbar: [{
				text:"删除应聘信息",
				iconCls: 'icon-remove',
				handler: function(){
					$('#applydg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			}/* ,'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#applydg').edatagrid('saveRow')
				}
			} */]
			
    	});
    });
    

</script>
 