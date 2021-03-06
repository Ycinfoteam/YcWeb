<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
       <table id="tedg">
</table>
<div id="telg" class="easyui-dialog"
	 style=" display:none; width: 1070px; height: 480px;padding: 10px 20px" closed="true"  buttons="#fooddlg-buttons">
	<div class="ftitle">
	</div>
	<form id="tefm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				发表人:
			</label>
			<input name="te_time" class="easyui-textbox" required="true"></input>
			</div>
		<div class="fitem">
			<label>
				发表时间:
			</label>
			<input name="te_time" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				发表内容:
			</label>
			<input name="ac_illus" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				浏览次数:
			</label>
			<input name="ac_illus" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				标题:
			</label>
			<input name="ac_illus" class="easyui-textbox" required="true"></input>
			</div>
	</form> 
</div>
<div id="fooddlg-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveHonor()" style="width: 90px">Save</a>
	<a  class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#telg').dialog('close')"
		style="width: 90px">Cancel</a>
<script type="text/javascript" src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" src="backjs/jquery.form.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#tedg').edatagrid({
		  	url: "technology",	//查询时加载的URL
            saveUrl: "technologytechnology_add",
            updateUrl: "technology_update", 
            destroyUrl: "technology_delete",
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"技术支持管理",
        	iconCls:"icon-save",//图标
        	idField:"te_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"te_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"asc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'te_id',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'te_name',
           	 	title:'发表人',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		},
           	 	
           	 },{
           	 	field:'te_time',
           	 	title:'发表时间',
           	 	width:100,
           	 	align:'center',
           	 editor:{
        	 		type:'datebox',
        	 		options:{
        	 			required:true,
        	 		}
        		},
           	 },{
           	 	field:'te_content',
           	 	title:'发表内容',
           	 	width:100,
           	 	align:'center',
           },
           	 ]],
           	 
           	 //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler : function() {$('#telg').dialog({
					title:'添加公司活动',
					width : 400,
					height : 550,
					closed : false,
					cache : false,
					modal:true
						}
				);$('#tefm').form('clear');
				}
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#tedg').edatagrid('destroyRow');
					$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#tedg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#tedg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	
    	
    });
    
	  function saveHonor(){
		  alert('1');
			$("#tefm").ajaxSubmit({
				type : "post",
				url : "activities_add",
				contentType : "application/x-www-form-urlencoded",
				success : function(data1) {
					if(  data1==1){	
						$.messager.alert('Info','添加成功'); 
					}
				
				}
			});
		$('#telg').dialog('close');
			$('#telg').dialog('close');
		}
	  $('input[name="ac_time"]').datebox({
			required:true
		});
</script>
