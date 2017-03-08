
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
</style>



<table id="jobdg">
</table>
<div id="jobdlg" class="easyui-dialog"
	style="width: 600px; height: 480px; padding: 10px 20px" closed="true"
	buttons="#fooddlg-buttons">
	<div class="ftitle">
		添加新招聘信息
	</div>
	<form id="jobfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				招聘职位:
			</label>
			<input name="position" class="easyui-textbox" required="true">
		</div>
		<div class="fitem">
			<label>
				结束日期:
			</label>
			<input name="validtime" class="easyui-textbox" required="true">
		</div>
		<div class="fitem">
			<label>
				招聘人数:
			</label>
			<input name="amount" class="easyui-textbox" required="true">
		</div>
		<div class="fitem">
			<label>
				工资待遇:
			</label>
			<input name="salary" class="easyui-textbox" required="true">
		</div>
		
		<div class="fitem">
			<label>
				招聘详细
			</label>
			<textarea id="add_jobs_detail" ></textarea>
		</div>
	</form>
</div>
<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveJobs()" style="width: 90px">添加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#jobdlg').dialog('close')"
		style="width: 90px">取消</a>
</div>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#jobdg').edatagrid({
        	url: 'yyyback/job_list.action',	//查询时加载的URL
            saveUrl: 'yyyback/job_add.action',
            updateUrl: 'yyyback/job_update.action', 
            destroyUrl: 'yyyback/job_delete.action',
            
        	pagination:true,	//显示分页
        	pageSize:5,			//默认分页的条数 
        	pageList:[5,10,15,20],	//可选分页条数
        	fitColumns:true,	//自适应列
        	/* fit:true,	//自动补全 */
        	title:"招聘信息管理",
        	iconCls:"icon-save",//图标
        	idField:"jid",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"position",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	striped:true,
        	columns:[[
        	{
           	 	field:'jid',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'position',
           	 	title:'招聘职位',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		 }
           	 },{
           	 	field:'validtime',
           	 	title:'结束时间',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'datebox',
           	 		options:{
           	 			required:true,
           	 		}
           	 	},
           	 },{
           	 	field:'amount',
           	 	title:'招聘人数',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		 }
           	  } ,{
           	 	field:'salary',
           	 	title:'工资待遇',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		 }
           	  }
           	 
           	 ]],
           	 	//加载进入标题栏以右键显示
           	 	 onHeaderContextMenu: function(e, field){
					e.preventDefault();
					if (!jobmenu){
						createColumnMenu();
					}
					jobmenu.menu('show', {
						left:e.pageX,
						top:e.pageY
					});
				},
           	 
           	 //定义按钮
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
				handler: function(){
					$('#jobdg').edatagrid('destroyRow');
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#jobdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#jobdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	CKEDITOR.replace('add_jobs_detail');
    });
    
    function saveJobs(){
    	var val = CKEDITOR.instances.add_jobs_detail.getData();
    	
		$("#jobfm").ajaxSubmit({
			type : "post",
			data:{'detail': val},
			url : "yyyback/job_add.action",
			dataType:"json",
			success : function(data) {
				/* var dataObj=eval("("+data+")");
				if(  data.code==1){	
					$.messager.alert('Info','添加招聘信息成功'); 
				} */
				data=parseInt(data);
				if(data>0){
					$.messager.alert('Info','添加招聘信息成功'); 
				}else{
					$.messager.alert('Info','添加招聘信息失败'); 
				}
			}
		});
	    $('#jobdg').edatagrid('load');
		$('#jobdlg').dialog('close');
	}
	
	
	//显示右键弹出框的信息
	/* var jobmenu;
		function createColumnMenu(){
			jobmenu = $('<div/>').appendTo('body');
			jobmenu.menu({
				onClick: function(item){
					if (item.iconCls == 'icon-ok'){
						$('#jobdg').datagrid(showall(), item.name);
						jobmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-ok'
						});
					} else if(item.iconCls == 'icon-none'){
						$('#jobdg').datagrid(shownone(), item.name);
						jobmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-none'
						});
					}else if(item.iconCls == 'icon-cansee'){
						$('#jobdg').datagrid(showcansee(), item.name);
						jobmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-cansee'
						});
					}
				}
			});
				jobmenu.menu('appendItem', {
					text: "显示所有信息",
					name: "显示",
					iconCls: 'icon-ok'
				});
				jobmenu.menu('appendItem', {
					text: "显示的招聘信息",
					name: "显示",
					iconCls: 'icon-cansee'
				});
				jobmenu.menu('appendItem', {
					text: "显示所有不显示的招聘",
					name: "显示",
					iconCls: 'icon-none'
				});
				
		}
		function showcansee(){
				 $('#jobdg').edatagrid('load',{
					type:1,
				}); 
		}
		function shownone(){
				 $('#jobdg').edatagrid('load',{
					type:0,
				}); 	
		}
		function showall(){
				 $('#jobdg').edatagrid('load',{
					type:null,
				}); 
		} */
		//右键弹出框结束

</script>
 