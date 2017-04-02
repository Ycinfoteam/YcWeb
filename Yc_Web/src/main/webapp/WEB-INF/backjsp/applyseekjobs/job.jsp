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

    
<table id="show_job"></table>

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
			<!-- <input name="e_position" class="easyui-textbox" required="true"> -->
			<input class="easyui-combobox" name="e_position"  
   			 data-options="valueField:'j_name',textField:'j_name',url:'showJobType'" />
		</div>
		<div class="fitem">
			<label>
				结束日期:
			</label>
			<input name="e_validtime" type="text" class="easyui-datebox" required="true">
		</div>
		<div class="fitem">
			<label>
				招聘人数:
			</label>
			<input name="e_amount" class="easyui-textbox" required="true">
		</div>
		<div class="fitem">
			<label>
				工资待遇:
			</label>
			<input name="e_salary" class="easyui-textbox" required="true">
		</div>
		
		<div class="fitem">
			<label>
				招聘详细:
			</label>
			<textarea id="e_detail" name="e_detail" ></textarea>
		</div>
		<div class="fitem">
			<label>
				招聘地址:
			</label>
			<textarea id="e_addr" name="e_addr" ></textarea>
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
   datagrid=$('#show_job').edatagrid({
    	url: 'findAllEmployInfo',	//查询时加载的URL
    	saveUrl:'updateEmployInfo', 
        updateUrl: 'updateEmployInfo',  
        destroyUrl: 'deleteEmployInfo',
    	pagination:true,	//显示分页
    	pageSize:2,		//默认分页的条数
    	pageList:[2,4,6],	//可选分页条数
    	fitColumns:true,	//自适应列
    	fit:true,	//自动补全
    	title:"招聘信息管理", 
    	iconCls:"icon-save",//图标
    	idField:"e_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
    	rownumbers:"true",	//显示行号
    	nowrap:"true",	//不换行显示
    	sortName:"e_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
    	sortOrder:"desc",	//排序方式
    	//以上的四种增删改查操作，只要失败，都会回掉这个onError
    	onError:function(a,b){
    		$.messager.alert("错误","操作失败");
    	},
    	striped:true,
    	columns:[[
    	{
       	 	field:'e_id',
       	 	title:'编号',
       	 	width:50,
       	 	align:'center',
       	 	
       	 },{
       	 	field:'e_position',
       	 	title:'应聘职位',
       	 	width:50,
       	 	align:'center',
       	 	editor:{
		 		type:'validatebox',
	 			options:{
	 				required:true,
	 			}
 	  		}
       	 },{
       	 	field:'e_amount',
       	 	title:'招聘人数',
       	 	width:50,
       	 	align:'center',
       	 	editor:{
		 		type:'validatebox',
	 			options:{
	 				required:true,
	 			}
 	  		} 	
        },{
       	 	field:'e_validtime',
       	 	title:'有效时间',
       	 	width:50,
       	 	align:'center',
       	 	editor:{
		 		type:'datebox',
	 			options:{
	 				required:true,
	 			}
 	  		}
       	 },{
       	 	field:'e_salary',
       	 	title:'工资待遇',
       	 	width:50,
       	 	align:'center',
       	 	editor:{
		 		type:'validatebox',
	 			options:{
	 				required:true,
	 			}
 	  		}
       	 },{
       	 	field:'e_detail',
       	 	title:'详情',
       	 	width:100,
       	 	align:'center',
       	 	editor:{
		 		type:'validatebox',
	 			options:{
	 				required:true,
	 			}
 	  		}
       	  } ,{
       	 	field:'e_addr',
       	 	title:'投递地址',
       	 	width:50,
       	 	align:'center',
       		editor:{
		 		type:'validatebox',
	 			options:{
	 				required:true,
	 			}
    	  	}
       	  }
       	 ]],
       	 
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
					$('#show_job').edatagrid('destroyRow');
					
					//TODO:   删除后及时刷新
					
					/* $.ajax({
						url:"deleteEmployInfo",
						type:"post",
						dataType:"json", 
						data:{
							'e_id':e_id},
						success:function(data){
							if(data==1){
								$.messager.alert('确认','添加成功','info');
								$('#jobdlg').dialog('close');
								$('#show_job').edatagrid('reload');
							}else{
								$.messager.alert('确认','添加失败','error');
								$('#jobdlg').dialog('close');
							}
						}
					}); */
					
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#show_job').edatagrid('saveRow');
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#show_job').edatagrid('cancelRow');
				}
			}]
	});
});

function saveJobs(){
	
	var e_position=$('input[name="e_position"]').val();
	var e_validtime=$('input[name="e_validtime"]').val();
	var e_amount=$('input[name="e_amount"]').val();
	var e_salary=$('input[name="e_salary"]').val();
	var e_detail=$('textarea[name="e_detail"]').val();
	var e_addr=$('textarea[name="e_addr"]').val();
	
	$.ajax({
		url:"addEmployInfo",
		type:"post",
		dataType:"json", 
		data:{
			e_position:e_position,
			e_validtime:e_validtime,
			e_amount:e_amount,
			e_salary:e_salary,
			e_detail:e_detail,
			e_addr:e_addr},
		success:function(data){
			if(data==1){
				$.messager.alert('确认','添加成功','info');
				$('#jobdlg').dialog('close');
				$('#show_job').edatagrid('reload');
			}else{
				$.messager.alert('确认','添加失败','error');
				$('#jobdlg').dialog('close');
			}
		}
	});
	
}

</script>
