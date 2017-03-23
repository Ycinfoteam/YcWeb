<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<script src="backjs/ckeditor.js"></script>
<link type="text/css" rel="stylesheet" href="backcss/icon.css" />
<!--第二步：引入easyui皮肤样式 themes/default/easyui.css    images文件夹拷贝-->
<link type="text/css" rel="stylesheet" href="backcss/easyui.css" />
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

<table id="projectdg"></table>
<!-- 修改图片界面 -->
<div id=uploadFiles class="easyui-dialog" style="display:none" 
	closed="true" buttons="#piclg-buttons" >
	<form id="picfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>重新上传图片:</label> <input id="p_pic" name="p_pic" type="file" multiple="multiple"  />
			<img id="updateppicview" src="" style="width:100px;height:100px; display:none "/>
		</div>
		<div class="fitem">
			<label></label>
			<p id="buttons"></p>
		</div>
	</form>
</div>
<!-- 添加界面 -->
<div id="honordlg" class="easyui-dialog"
	style="display: none; width: 1070px; height: 480px; padding: 10px 20px"
	closed="true" buttons="#projects-buttons">
	<div class="ftitle"></div>
	<form id="honorfm" method="post" enctype="multipart/form-data"
		novalidate>
		<div class="fitem">
			<label> 项目名: </label> <input name="p_name" class="easyui-textbox"
				required="true"></input>
		</div>
		<div class="fitem">
			<label> 开发者: </label> <input name="p_developer"
				class="easyui-textbox" required="true"></input>
		</div>
		<div class="fitem">
			<label> 开发时间: </label> <input name="p_time" class="easyui-textbox"></input>

		</div>
		<div class="fitem">
			<label> 项目发布地址: </label> <input name="p_addr" class="easyui-textbox"
				required="true"></input>
		</div>
		<div class="fitem">
			<label> 项目图片: </label> 
			<input id="ap_pic" type="file" name="p_pic" onchange="preppic(this)"/><br/>
		<img id="addppicview" src="" style="width:100px;height:100px;display:none"/>
		</div>
	</form>
</div>
<!-- 修改pic界面按钮 -->
<div id="piclg-buttons" style="display: none;">
	<a class="easyui-linkbutton c6" iconCls="icon-ok" onclick="update()"
		style="width: 90px">Save</a> <a class="easyui-linkbutton"
		iconCls="icon-cancel"
		onclick="javascript:$('#uploadFiles').dialog('close')"
		style="width: 90px">Cancel</a>
</div>
<!-- 添加界面按钮 -->
<div id="projects-buttons" style="display: none;">
	<a class="easyui-linkbutton c6" iconCls="icon-ok"
		onclick="saveprojects()" style="width: 90px">Save</a> <a
		class="easyui-linkbutton" iconCls="icon-cancel"
		onclick="javascript:$('#honordlg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<!-- 图片 -->
<div id="showppic" class="easyui-dialog" 
	style="width: 650px; height: 450px; padding: 10px 20px;display:none" closed="true">
	<img id="ppic" style="width:580px;height:400px;"/>
	
</div>
<script type="text/javascript" src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" src="backjs/jquery.form.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>

<script type="text/javascript">
	var datagrid;
	var rowEditor = undefined; //用于存放当前要编辑的行
	$(function() {
		datagrid = $('#projectdg').edatagrid(
				{
					url : 'projects', //查询时加载的URL
					saveUrl : "projects_add",
					updateUrl : "projects_update",
					destroyUrl : "projects_delete",
					loadMsg : '正在加载项目信息...',
					pagination : true, //显示分页
					pageSize : 5, //默认分页的条数
					pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 ], //可选分页条数
					fitColumns : true, //自适应列
					fit : true, //自动补全
					title : "学员项目管理",
					iconCls : "icon-save",//图标
					idField : "p_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
					rownumbers : "true", //显示行号
					nowrap : "true", //不换行显示
					sortName : "p_id", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
					sortOrder : "desc", //排序方式
					singleSelect : false,
					//以上的四种增删改查操作，只要失败，都会回掉这个onError
					onError : function(a, b) {
						$.messager.alert("错误", "操作失败");
					},
					striped : true,
					columns : [ [
							{
								field : 'p_id',
								title : '项目名',
								width : 100,
								align : 'center',
								hidden : 'true'
							},
							{
								field : 'p_name',
								title : '项目名',
								width : 100,
								align : 'center',
								editor : {
									type : 'validatebox',
									options : {
										required : true,
									}
								},
							},
							{
								field : 'p_developer',
								title : '开发者',
								width : 100,
								align : 'center',
								editor : {
									type : 'validatebox',
									options : {
										required : true,
									}
								},
							},
							{
								field : 'p_time',
								title : '开发时间',
								width : 100,
								align : 'center',
								editor : {
									type : 'datebox',
									options : {
										required : true,
									}
								},
							},
							{
								field : 'p_addr',
								title : '项目发布地址',
								width : 100,
								align : 'center',
								editor : {
									type : 'validatebox',
									options : {
										required : true,
									}
								},
							},
							{
								field : 'p_pic',
								title : '项目图片',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									if(value!=null && value!=''){
										return '<a href="javascript:void(0)" onclick="showppic()">查看图片</a>';
									}else{
										return '无图片';
									}
					      	 	}
							},
							{
								field : 'cx',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									return '<a href="javascript:updatepic('
											+ row.p_id + ')">修改图片</a>';
								}
							}, ] ],

					//定义按钮 如果没有选择图片应该给予提示
					toolbar : [ {
						text : "增加",
						iconCls : 'icon-add',
						handler : function() {
							$('#honordlg').dialog({
								title : '添加学员项目',
								width : 400,
								height : 550,
								closed : false,
								cache : false,
								modal : true
							});
							$('#honorfm').form('clear');
						}
					}, '-', {
						text : "删除",
						iconCls : 'icon-remove',
						handler : function() {
							$('#projectdg').edatagrid('destroyRow');
							$('#dg').edatagrid('loadData')
						}
					}, '-', {
						text : "保存",
						iconCls : 'icon-save',
						handler : function() {
							$('#projectdg').edatagrid('saveRow')
						}
					}, '-', {
						text : "取消编辑",
						iconCls : 'icon-undo',
						handler : function() {
							$('#projectdg').edatagrid('cancelRow')
						}
					} ]

				});
	});
	//实现图片预览
	function preppic(file){
		var objUrl = getObjectURL(file.files[0]) ;
		document.getElementById("addppicview").style.display='block';
		//console.log("objUrl = "+objUrl) ;
		if (objUrl) {
			$("#addppicview").attr("src", objUrl) ;
		}
	}
		
	

	$("#p_pic").change(function(){
		alert(1);
		var objUrl = getObjectURL(this.files[0]) ;
		document.getElementById("updateppicview").style.display='block';
		//console.log("objUrl = "+objUrl) ;
		if (objUrl) {
			$("#updateppicview").attr("src", objUrl) ;
		}
	}) ;
	//建立一個可存取到該file的url
	function getObjectURL(file) {
		var url = null ; 
		if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ;
		} else if (window.URL!=undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
		} else if (window.webkitURL!=undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file) ;
		}
		return url ;
	}
	//查看图片
	function showppic(){
		var p_pic=$('#projectdg').datagrid('getSelected').p_pic;
		var p_name=$('#projectdg').datagrid('getSelected').p_name;
		p_pic=p_pic.replace(",","");
		p_pic=p_pic.substring(22);
		$("#ppic").attr("src","../"+p_pic);
			$('#showppic').dialog('open').dialog('setTitle',p_name);
		
	}
	
	//添加
	function saveprojects() {
		if ($("#ap_pic").val() == "") {
			$.messager.alert('提示', '请选择一个图片文件，再点击添加');
			return;
		}
		$("#honorfm").ajaxSubmit({
			type : "POST",
			url : "projects_add",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success : function(data1) {
				var dataObj=eval("("+data1+")");
				alert(dataObj.code);
				if (dataObj.code==1) {
					$.messager.alert('Info', '添加成功');
				}
			},
			error : function(data1) {
				var dataObj=eval("("+data1+")");
				alert(dataObj.code);
				$.messager.alert('Info', '系统出现错误请联系管理员');
			}
		});
		$('#honordlg').dialog('close');
		$('#projectdg').edatagrid('reload');

	}
	//修改图片
	function updatepic(id) {
		$('#uploadFiles').dialog({
			title : '修改项目图片',
			width :350,
			height : 280,
			closed : false,
			cache : false,
			queryParams : {
				p_id : id
			}
		});
	}
	function update() {
		var options = $('#uploadFiles').dialog('options');
		var p_id = options.queryParams.p_id;
		if (undefined == p_id) {
			$.messager.alert('提示', '未选中信息');
			return;
		}
		/*if ($("#p_pic").val() == "") {
			$.messager.alert('提示', '请选择一个图片文件，再点击修改');
			return;
		}*/
		$("#picfm").ajaxSubmit({
			type : "POST",
			url : "updatepropic",
			contentType : "application/x-www-form-urlencoded",
			data : {
				p_id : p_id
			},
			dataType : "json",
			success : function(data1) {
				var dataObj=eval("("+data1+")");
				alert(dataObj.code);
				if (dataObj.code==1) {
					$.messager.alert('Info', '添加成功');
				}
			},
			error : function(data1) {
				var dataObj=eval("("+data1+")");
				alert(dataObj.code);
				$.messager.alert('Info', '系统出现错误请联系管理员');
			}
		});
		$('#uploadFiles').dialog('close');
		$('#projectdg').edatagrid('reload');
	}

	$('input[name="p_time"]').datebox({
		required : true
	});
	
	
	
	//自定义表单验证规则
/*	$.extend($.fn.validatebox.defaults.rules, {   
		nameRex: {   
	        validator: function(value, param){  
	        	var reg=/^[\u4E00-\u9FA5A0-9a-zA-Z]{1,10}$/;//只允许英文，数字，中文的组合
	        	if(reg.test(value)){
	        		return true;
	        	}
	        },   
	        message: '请输入中、英文字母、数字，长度1~10位！'  
	    },
	    numberRex:{
	    	validator: function(value, param){  
	        	var reg=/^([1-9][0-9]*)+(.[0-9]{1,2})?$/;//非零开头的最多带两位小数的数字
	        	if(reg.test(value)){
	        		return true;
	        	}
	        },   
	        message: '请输入最多带两位小数的数字！' 
	    },
	    teacherRex:{
	    	validator: function(value, param){  
	        	var reg=/^[\u4E00-\u9FA5A-Za-z]+$/;//只允许英文，中文的组合
	        	if(reg.test(value)){
	        		return true;
	        	}
	        },   
	        message: '请输入英文或中文的教师姓名！' 
	    }
	});*/  
</script>
