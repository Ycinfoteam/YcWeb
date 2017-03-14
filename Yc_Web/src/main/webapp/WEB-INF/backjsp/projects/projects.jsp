<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath %>">
<script src="backjs/ckeditor.js"></script>
 <link type="text/css" rel="stylesheet" href="backcss/icon.css"/>
<!--第二步：引入easyui皮肤样式 themes/default/easyui.css    images文件夹拷贝-->
<link type="text/css" rel="stylesheet" href="backcss/easyui.css"/>
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
   
   <table id="projectdg">
</table>
<div id="honordlg" class="easyui-dialog"
	 style=" display:none; width: 1070px; height: 480px;padding: 10px 20px" closed="true"  buttons="#fooddlg-buttons">
	<div class="ftitle">
		
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
			<input name="p_time" class="easyui-textbox"></input>
		
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
<div id="fooddlg-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		 iconCls="icon-ok"  onclick="saveHonor()"
		style="width: 90px">Save</a>
	<a class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#honordlg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>
<script type="text/javascript" src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" src="backjs/jquery.form.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#projectdg').edatagrid({
		  	url: "projects",	//查询时加载的URL
            saveUrl: "projects_add",
            updateUrl: "projects_update", 
            destroyUrl: "projects_delete",
            loadMsg:'正在加载项目信息...',
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"学员项目管理",
        	iconCls:"icon-save",//图标
        	idField:"p_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"p_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'p_id',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'p_name',
           	 	title:'项目名',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		},
           	 	
           	 },{
           	 	field:'p_pic',
           	 	title:'项目图片',
           	 	width:100,
           	 	align:'center',
           	 formatter : function(value, row, index) {
 				if(value!=null && value!=''){
 					value=value.replace(",","");
 					value=value.substring(22);
 					return '<img src="../'+value+'" width="100px" height="100px" />';
 				}else{
 					return '无图片';
 				}
 				}},
           	 {
           	 	field:'p_developer',
           	 	title:'开发者',
           	 	width:100,
           	 	align:'center',
           	 editor:{
        	 		type:'validatebox',
        	 		options:{
        	 			required:true,
        	 		}
        		},
           	 },{
            	 	field:'p_time',
               	 	title:'开发时间',
               	 	width:100,
               	 	align:'center',
               	editor:{
         	 		type:'datebox',
         	 		options:{
         	 			required:true,
         	 		}
         		},
            	 },	
               	 	
            {
         	 	field:'p_addr',
           	 	title:'项目发布地址',
           	 	width:100,
           	 	align:'center',
           	 editor:{
        	 		type:'validatebox',
        	 		options:{
        	 			required:true,
        	 		}
        		},
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
				handler : function() {$('#honordlg').dialog({
					title:'添加学员项目',
					width : 400,
					height : 550,
					closed : false,
					cache : false,
					modal:true
						}
				);$('#honorfm').form('clear');
				}
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#projectdg').edatagrid('destroyRow');
					$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#projectdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#projectdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	
    	
    });
    
	  function saveHonor(){
		//有错误
		$("#honorfm").ajaxSubmit({
				type : "POST",
				url : "projects_add",
				contentType : "application/x-www-form-urlencoded",
				success : function(data1) {
					if(  data1==1){	
						$.messager.alert('Info','添加成功'); 
					}
				
				}
			});
		$('#honordlg').dialog('close');
			$('#projectdg').edatagrid('load');
			
		}
	  $('input[name="p_time"]').datebox({
			required:true
		});
</script>
