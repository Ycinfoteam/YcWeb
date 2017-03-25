<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<table id="coursysinfo"></table>
<div id="addcsinfo" class="easyui-dialog"
	style="width: 900px; height: 600px; padding: 10px 20px;display:none" closed="true"
	buttons="#add-buttons">
	<form id="csform" method="post" enctype="multipart/form-data"  novalidate onSubmit="">
		<div>
		<label>课程方向: </label> 
		<input id="cs_name" name="cs_name" class="easyui-textbox" style="width:300px" 
				required="true" validType="nameRex">
		<span id="errorMsg"></span>
		</div><br>
		<div>
		<label>体系版本:</label>
		<input id="cs_version" name="cs_version" class="easyui-textbox" style="width:80px"
				required="true" placeholder="请输入版本号..." validType="numberRex">
		</div><br>
		<div>
		<label>图片说明: </label>
		<input id="picUrl" type="file" name="picUrl" required="true"/><br/>
		<img id="addpreview" src="" style="width:100px;height:100px"/>
		</div><br>
		<div>
		<label>主讲教师：</label>
		<input id="cs_text" name="cs_text" class="easyui-combobox" required="true" style="width:200px"  validType="teacherRex" data-options="   
        valueField: 't_name',   
        textField: 't_name',   
        url:'findTeachers'"/>
		</div>
	</form>
	<div id="add-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveCoursysInfo()" style="width: 90px">保存</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#addcsinfo').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<!-- 图片 -->
<div id="showCoursysPic" class="easyui-dialog" 
	style="width: 700px; height: 500px; padding: 10px 20px;display:none" closed="true" buttons="#update-buttons">
	<form id="updatepicfm" method="post" enctype="multipart/form-data" novalidate>
		<img id="cspic" style="width:680px;height:380px;"/>
		<input id="cs_id" name="cs_id" type="hidden" />
		<div id="file">
			<label>上传新图片：</label>
			<input id="update_picUrl" type="file" name="update_picUrl" required="true"/>
		</div>
	</form>
	<div id="update-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateCoursysPic()" style="width: 90px">确认</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showCoursysPic').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<script type="text/javascript">
$('#coursysinfo').edatagrid({
		url : 'coursys_selectAll', //查询时加载的URL
		//saveUrl : 'coursys_add',
		updateUrl : 'coursys_update',
		destroyUrl : 'coursys_delete',

		pagination : true, //显示分页
		pageSize : 5, //默认分页的条数
		pageList : [ 5, 10 ], //可选分页条数
		fitColumns : true, //自适应列
		fit : true, //自动补全
		title : "课程体系管理",
		iconCls : "icon-save",//图标
		idField : "cs_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
		rownumbers : "true", //显示行号
		nowrap : "true", //不换行显示
		sortName : "sort", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
		sortOrder : "desc", //排序方式
		singleSelect:true,
		//以上的四种增删改查操作，只要失败，都会回掉这个onError
		onError : function(a, b) {
			$.messager.alert("错误", "操作失败");
		},
		striped : true,//设置为true将交替显示行背景
		columns : [ [ {
			field : 'cs_id',
			title : '课程体系编号',
			width : 100,
			align : 'center',
			hidden:'true'
		}, {
			field : 'cs_name',
			title : '课程体系名称',
			width : 60,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		}, {
			field : 'cs_version',
			title : '版本号',
			width : 50,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		},
      	 {
			field : 'cs_text',
			title : '主讲教师',
			align:'center',
			width : 100,
			editor : {
				type : 'validatebox',
				options : {
					required : true
				}
			},
		}, {
			field : 'cs_status',
			title : '是否显示到前台',
			width : 50,
			align : 'center',
			editor : {
				type : 'combobox',
				options : {
					required:true,
					data : [ {
						text : '显示',
						value : '1'
					}, {
						text : '不显示',
						value : '0'
					} ]
				}
			},
			formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
				//必须返回一个字符串、用于替换被加formatter的单元格。
				if (value == 0) {
					return '不显示';
				}
				if (value == 1) {
					return '显示';
				};
			}
		} ,{
      	 	field:'cs_pic',
      	 	title:'图片操作',
      	 	width:100,
      	 	align:'center',
      	 	formatter:function(value,row,index){
      	 		if(value!=null && value!=''){
					return '<a href="javascript:void(0)" onclick="showCoursysPic(0)">查看</a>|<a href="javascript:void(0)" onclick="showCoursysPic(1)">修改</a>';
				}else{
					return '<a href="javascript:void(0)" onclick="showCoursysPic(2)">添加</a>';
				}
      	 	}
      	  	/* formatter : function(value, row, index) {
				if(value!=null && value!=''){
					value=value.replace(",","");
					value=value.substring(22);
					return '<img src="../'+value+'" width="100px" height="100px" />';
				}else{
					return '无图片';
				}
			} */
      	 }] ],
		//定义按钮
		toolbar : [
				{
					text : "增加",
					iconCls : 'icon-add',
					handler : function() {
						//$('#coursysinfo').edatagrid('addRow');
						$('#addcsinfo').dialog('open').dialog('setTitle','新增课程体系');
					}
				},
				'-',
				{
					text : "删除",
					iconCls : 'icon-remove',
					handler : function() {
						$('#coursysinfo').edatagrid('destroyRow');
						//$('#dg').edatagrid('loadData')
					}
				},
				'-',
				{
					text : "保存",
					iconCls : 'icon-save',
					handler : function() {
						$('#coursysinfo').edatagrid('saveRow');
					}
				},
				'-',
				{
					text : "取消编辑",
					iconCls : 'icon-undo',
					handler : function() {
						$('#coursysinfo').edatagrid('cancelRow');
					}
				} ]

});
//实现图片预览
$("#picUrl").change(function(){
	$('#addpreview').css("display","inline-block");
	var objUrl = getObjectURL(this.files[0]) ;
	//console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#addpreview").attr("src", objUrl) ;
	}
}) ;
$('#update_picUrl').change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	//console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#cspic").attr("src", objUrl) ;
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
//实现添加操作
$("#csform").form({
	url:"coursys_add",
	success:function(data){
		alert(data);
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
			$('#addcsinfo').dialog('close');
			$("#csform").form('clear');
			$('#coursysinfo').edatagrid('load');
		}else if(data==2){
			$('#errorMsg').text('该课程体系已存在，请勿重复添加').css("color","red");
		}else{
			$.messager.alert('错误提示', '添加失败！');
		}
	}
},'json');
function saveCoursysInfo(){
	$("#csform").submit();
}
//查看图片
function showCoursysPic(type){
	var cs_id=$('#coursysinfo').datagrid('getSelected').cs_id;
	var cs_pic=$('#coursysinfo').datagrid('getSelected').cs_pic;
	cs_pic=cs_pic.replace(",","");
	cs_pic=cs_pic.substring(22);
	$("#cspic").attr("src","../"+cs_pic);
	if(type==0){
		$('#update-buttons').css({ display: "none" });
		$('#file').css({ display: "none" });
		$('#showCoursysPic').dialog('open').dialog('setTitle','查看课程体系图片');
	}else if(type==2){
		$('#update-buttons').css({display:"inline-block"});
		$('#cs_id').val(cs_id);
		$('#showCoursysPic').dialog('open').dialog('setTitle','添加课程体系图片');
	}else{
		$('#update-buttons').css({display:"inline-block"});
		$('#cs_id').val(cs_id);
		$('#showCoursysPic').dialog('open').dialog('setTitle','修改课程体系图片');
	}
}
//修改课程体系图片
$("#updatepicfm").form({
	url:"coursys_updatepic",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#showCoursysPic').dialog('close');
		$('#coursysinfo').datagrid('reload');
	}
},'json');
function updateCoursysPic(){
	$("#updatepicfm").submit();
}

//自定义表单验证规则
$.extend($.fn.validatebox.defaults.rules, {   
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
});  
</script>