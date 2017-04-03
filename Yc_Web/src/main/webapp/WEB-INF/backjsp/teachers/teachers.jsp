<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<!-- 用于存放教师信息数据表格的表格容器 -->
<table id="tcinfo_datagrid"></table>
<!-- 添加教师信息的模块 -->
<div id="addtc_dialog" class="easyui-dialog" style="width: 350px; height: 600px; padding: 10px 20px;display:none" closed="true"
	buttons="#add-buttons">
	<form id="addtc_form" method="post" enctype="multipart/form-data"  novalidate>
		<div>
		<label>教师姓名: </label> 
		<input id="t_name" name="t_name" type="text" class="validatebox" style="width:50px" 
				required="true" validType="teacherRex" onBlur="checkTcName()">
		<span id="errorMsg"></span>
		</div>
		<div>
		<label>师资头衔:</label>
		<input id="t_title" name="t_title" class="easyui-textbox" style="width:50px"
				required="true" validType="titleRex" >
		</div>
		<div>
		<label>公司职位：</label>
		<input id="t_job" name="t_job" class="easyui-combobox" required="true" style="width:100px"  validType="teacherRex" data-options="   
        valueField: 'j_name',   
        textField: 'j_name',   
        url:'showJobType'"/>
		</div>
		<div>
		<label>座右铭:</label>
		<input id="t_motto" name="t_motto" class="easyui-textbox" style="width:300px"
				required="true" placeholder="请输入积极向上的座右铭" >
		</div>
		<div>
		<label>技术方向:</label>
		<textarea id="t_skill" name="t_skill" class="easyui-textbox" style="width:300px;height:50px;"
				required="true"></textarea>
		</div>
		<div>
		<label>上传照片: </label>
		<input id="picUrl" type="file" name="picUrl" required="true"/><br/>
		<img id="addpreview" src="" style="width:200px;height:200px ;display:none"/>
		</div>
	</form>
</div>
	<div id="add-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="addTeacher()" style="width: 90px">保存</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#addtc_dialog').dialog('close')"
			style="width: 90px">取消</a>
	</div>
<!-- 图片 -->
<div id="showTeachersPic" class="easyui-dialog" 
	style="width: 700px; height: 500px; padding: 10px 20px;display:none" closed="true" buttons="#update-buttons">
	<form id="updatepicfm" method="post" enctype="multipart/form-data" novalidate>
		<img id="tcpic" style="width:680px;height:380px;"/>
		<input id="t_id" name="t_id" type="hidden" />
		<div id="file">
			<label>上传新图片：</label>
			<input id="update_picUrl" type="file" name="update_picUrl" required="true"/>
		</div>
	</form>
</div>
	<div id="update-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateTeacherPic()" style="width: 90px">确认</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showTeachersPic').dialog('close')"
			style="width: 90px">取消</a>
	</div>
<script type="text/javascript">
$('#tcinfo_datagrid').edatagrid({
		url : 'selectAllTeacher', //查询时加载的URL
		updateUrl : 'teacher_update',
		destroyUrl : 'teacher_delete',
		saveUrl : 'teacher_add',
		
		pagination : true, //显示分页
		pageSize : 5, //默认分页的条数
		pageList : [ 5, 10, 15], //可选分页条数
		fitColumns : true, //自适应列
		fit : true, //自动补全
		title : "教师信息管理",
		iconCls : "icon-save",//图标
		idField : "t_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
		rownumbers : "true", //显示行号
		nowrap : "true", //不换行显示
		sortName : "t_id", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
		sortOrder : "desc", //排序方式
		singleSelect:true,
		//以上的四种增删改查操作，只要失败，都会回掉这个onError
		onError : function(a, b) {
			$.messager.alert("错误", "操作失败");
		},
		striped : true,//设置为true将交替显示行背景
		columns : [ [ {
			field : 't_id',
			title : '教师编号',
			hidden:'true'
		}, {
			field : 't_name',
			title : '教师姓名',
			width : 60,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		},{
			field : 't_title',
			title : '师资头衔',
			width : 50,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		},{
			field : 't_job',
			title : '职位',
			width : 50,
			align : 'center',
			editor : {
				type : 'combobox',
				options : {
					required : true,
					data : [ {
						text : 'Java工程师',
						value : 'Java工程师'
					},{
						text : '大数据工程师',
						value : '大数据工程师'
					},{
						text : 'Web前端工程师',
						value : 'Web前端工程师'
					}, {
						text : '嵌入式工程师',
						value : '嵌入式工程师'
					} ]
				}
			},
			formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
				//必须返回一个字符串、用于替换被加formatter的单元格。
				if (value == 'Java工程师') {
					return 'Java工程师';
				}
				if (value == '大数据工程师') {
					return '大数据工程师';
				}
				if (value == 'Web前端工程师') {
					return 'Web前端工程师';
				}
				if (value == '嵌入式工程师') {
					return '嵌入式工程师';
				}
			}
		},{
			field : 't_motto',
			title : '座右铭',
			align:'center',
			width : 100,
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		}, {
			field : 't_skill',
			title : '技术方向',
			width : 100,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required:true,
				}
			},
		} ,{
      	 	field:'t_pic',
      	 	title:'图片操作',
      	 	width:100,
      	 	align:'center',
      	 	formatter:function(value,row,index){
      	 		if(value!=null && value!=''){
					return '<a href="javascript:void(0)" onclick="showTeacherPic(0)">查看</a>|<a href="javascript:void(0)" onclick="showTeacherPic(1)">修改</a>';
				}else{
					return '<a href="javascript:void(0)" onclick="showTeacherPic(2)">添加</a>';
				}
      	 	}
      	 }] ],
		//定义按钮
		toolbar : [
				{
					text : "增加",
					iconCls : 'icon-add',
					handler : function() {
						$('#addtc_dialog').dialog('open').dialog('setTitle','录入教师信息');
					}
				},
				'-',
				{
					text : "删除",
					iconCls : 'icon-remove',
					handler : function() {
						$('#tcinfo_datagrid').edatagrid('destroyRow');
						//$('#dg').edatagrid('loadData')
					}
				},
				'-',
				{
					text : "保存",
					iconCls : 'icon-save',
					handler : function() {
						$('#tcinfo_datagrid').edatagrid('saveRow');
					}
				},
				'-',
				{
					text : "取消编辑",
					iconCls : 'icon-undo',
					handler : function() {
						$('#tcinfo_datagrid').edatagrid('cancelRow');
					}
				} ]

});
//实现图片预览
$("#picUrl").change(function(){
	$('#addpreview').css("display","inline-block");
	var objUrl = getObjectURL(this.files[0]) ;
	console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#addpreview").attr("src", objUrl) ;
	}
}) ;
$('#update_picUrl').change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	//console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#tcpic").attr("src", objUrl) ;
	}
});
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
//添加教师信息
$("#addtc_form").form({
	url:"teacher_add",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '添加失败！');
		}
		$('#addtc_dialog').dialog('close');
		$('#tcinfo_datagrid').edatagrid('load');
	}
},'json');
function addTeacher(){
	$("#addtc_form").submit();
}

//查看教师头像
function showTeacherPic(type){
	var t_id=$('#tcinfo_datagrid').datagrid('getSelected').t_id;
	var t_pic=$('#tcinfo_datagrid').datagrid('getSelected').t_pic;
	t_pic=t_pic.replace(",","");
	t_pic=t_pic.substring(22);
	$("#tcpic").attr("src","../"+t_pic);
	if(type==0){
		$('#update-buttons').css({ display: "none" });
		$('#file').css({display:"none"});
		$('#showTeachersPic').dialog('open').dialog('setTitle','查看教师照片');
	}else if(type==2){
		$('#update-buttons').css({display:"inline-block"});
		$('#file').css({display:"inline-block"});
		$('#t_id').val(t_id);
		$('#showTeachersPic').dialog('open').dialog('setTitle','添加教师照片');
	}else{
		$('#update-buttons').css({display:"inline-block"});
		$('#file').css({display:"inline-block"});
		$('#t_id').val(t_id);
		$('#showTeachersPic').dialog('open').dialog('setTitle','修改教师照片');
	}
}
//修改教师头像
$("#updatepicfm").form({
	url:"teacher_updatepic",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#showTeachersPic').dialog('close');
		$('#tcinfo_datagrid').datagrid('reload');
	}
},'json');
function updateTeacherPic(){
	$("#updatepicfm").submit();
}
//验证教师姓名是否重名
function checkTcName(){
	var t_name=$('#t_name').val();
	var reg=/^[\u4E00-\u9FA5A-Za-z]+$/;//只允许英文，数字，中文的组合
	if(reg.test(t_name)){
		$.post('findTeacherByName',{t_name:t_name},function(data){
			alert(data);
			if('1'==data){
				$('#errorMsg').text('*该教师名已存在，请检查是否有重名教师').css("color","red");
			}else{
				$('#errorMsg').text('');
			}
		},'json');
	}else{
		$('#errorMsg').text('*请输入英文或中文的教师姓名！').css("color","red");
	}
	
}
//自定义表单验证规则
$.extend($.fn.validatebox.defaults.rules, {   
	titleRex: {   
        validator: function(value, param){  
        	var reg=/^[\u4E00-\u9FA5A]{2,10}$/;//只允许英文，数字，中文的组合
        	if(reg.test(value)){
        		return true;
        	}else{
        		return false;
        	}
        },   
        message: '请输入长度2~10的中文汉字'  
    },
    teacherRex:{
    	validator: function(value, param){  
        	var reg=/^[\u4E00-\u9FA5A-Za-z]+$/;//只允许英文，中文的组合
        	if(reg.test(value)){
        		return true;
        	}else{
        		return false;
        	}
        },   
        message: '请输入英文或中文的教师姓名！' 
    }
});  
</script>