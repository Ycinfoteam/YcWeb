<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="backjs/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="backcss/easyui.css">
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



<table id="honordg">
</table>
<div id="honordlg" class="easyui-dialog"
	style="width: 1070px; height: 480px; padding: 10px 20px" closed="true"
	buttons="#fooddlg-buttons">
	<div class="ftitle">
		添加新学员项目
	</div>
	<form id="honorfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				项目名:
			</label>
			<input name="p_name" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				开发者:
			</label>
			<input name="p_developer" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				开发时间:
			</label>
			<input name="p_time" class="easyui-datebox" data-options="formatter:myformatter.parser:myparser"></input>
		
			</div>
			<div class="fitem">
			<label>
				项目发布地址:
			</label>
			<input name="p_addr" class="easyui-textbox" required="true"></input>
		</div>
		<div class="fitem">
			<label>
				项目图片:
			</label>
			<input name="p_pic" type="file" />
		</div>
		
	</form>
</div>
<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveHonor()" style="width: 90px">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#honordlg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<script type="text/javascript">
	function myformatter(date){
		var y=date.getFullYear();
		var m=date.getMonth()+1;
		var d=date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(S){
		if(!s)return new Date();
		var ss=(s.split('-'));
		var y=parseInt(ss[0],10);
		var m=parseInt(ss[1],10);
		var d=parseInt(ss[2],10);
		if(!isNaN(y)&&!isNaN(m)&&!isNaN(d)){
			return new Date(y,m-1,d);
		}else{
			return new Date();
		}
	}
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#honordg').edatagrid({
        	url: "info_list.action?type=资质荣誉",	//查询时加载的URL
            saveUrl: "info_addInfo.action?type=资质荣誉",
            updateUrl: "info_updateInfo.action?type=资质荣誉", 
            destroyUrl: "info_deleteInfo.action?type=资质荣誉",
            
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"资质荣誉管理",
        	iconCls:"icon-save",//图标
        	idField:"iid",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"createtime",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'iid',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'title',
           	 	title:'荣誉标题',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		},
           	 	
           	 },{
           	 	field:'picture',
           	 	title:'缩略图',
           	 	width:100,
           	 	align:'center',
           	 }/* ,{
           	 	field:'state',
           	 	title:'是否显示',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'combobox',
           	 		options:{
           	 			//required:true,
           	 			data:[{text:'显示',value:'1'},{text:'不显示',value:'0'}]
           	 		}
           	 	},
           	 	formatter : function(value, rowData, index) {  //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
						//必须返回一个字符串、用于替换被加formatter的单元格。
						if(   value==0){
							return '不显示';
						}
						if(value==1){
							return '显示';
						};
				}
           	 } */
           	 ]],
           	 
           	 //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler : function() {  
                    $('#honordlg').dialog('open').dialog('setTitle','新增荣誉');
            		$('#honorfm').form('clear');
                }  
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#honordg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#honordg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#honordg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	
    	
    });
    
    function saveHonor(){
		$("#honorfm").ajaxSubmit({
			type : "post",
			url : "info_addInfo.action?type=资质荣誉",
			success : function(data1) {
				var dataObj=eval("("+data1+")");
				if(  dataObj.code==1){	
					$.messager.alert('Info','添加成功'); 
				}
			}
		});
		$('#honordg').edatagrid('load');
		$('#honordlg').dialog('close');
	}
	
</script>
