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
		<input id="picUrl1" type="file" name="picUrl" required="true"/><br/>
		<img id="addpreview1" style="width:100px;height:100px;"/>
		</div><br>
		<div>
		<label>体系头像：</label>
		<input id="picUrl2" type="file" name="picUrl" required="true"/><br/>
		<img id="addpreview2" style="width:100px;height:100px;"/>
		</div>
		<div>
<<<<<<< HEAD
		<label>课程说明：</label>
		<input id="cs_text" class="easyui-textbox" name="cs_text" required="true" style="width:300px;height:150px"/>
=======
		<label>文字说明：</label>
		<input id="cs_text" name="cs_text" class="easyui-combobox" required="true" style="width:200px"  validType="teacherRex" data-options="   
        valueField: 't_name',   
        textField: 't_name',   
        url:'findTeachers'"/>
>>>>>>> 64a9e570483c7e1e61df7231fe6776c0ee501fa8
		</div>
	</form>
</div>
	<div id="add-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveCoursysInfo()" style="width: 90px">保存</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#addcsinfo').dialog('close')"
			style="width: 90px">取消</a>
	</div>
<!-- 体系图片 -->
<div id="showCoursysPic" class="easyui-dialog" 
	style="width: 700px; height: 500px; padding: 10px 20px;display:none" closed="true" buttons="#update-buttons">
	<form id="updatepicfm" method="post" enctype="multipart/form-data" novalidate>
		<img id="cspic" style="width:680px;height:380px;"/>
		<input id="cs_id" name="cs_id" type="hidden" />
		<div id="file" style="display:inline-block">
			<label>上传新图片：</label>
			<input id="update_picUrl1" type="file" name="update_picUrl1" required="true"/>
		</div>
	</form>
</div>
	<div id="update-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateCoursysPic()" style="width: 90px">确认</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showCoursysPic').dialog('close')"
			style="width: 90px">取消</a>
	</div>
<!-- 体系头像 -->
<div id="showCoursysHead" class="easyui-dialog" 
	style="width: 300px; height: 300px; padding: 10px 20px;display:none" closed="true" buttons="#updatehead-buttons">
	<form id="updateheadfm" method="post" enctype="multipart/form-data" novalidate>
		<img id="cshead" style="width:100px;height:100px;"/>
		<input id="csid" name="csid" type="hidden" />
		<div id="filehead" style="display:inline-block">
			<label>上传新图片：</label>
			<input id="update_headUrl" type="file" name="update_headUrl" required="true"/>
		</div>
	</form>
	<div id="updatehead-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateCoursysHead()" style="width: 90px">确认</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showCoursysHead').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<!-- 课程体系文字说明 -->
<div id="showCoursysText" class="easyui-dialog" 
	style="width: 350px; height: 260px; padding: 10px 20px;display:none" closed="true" buttons="#updatetext-buttons">
	<form id="updatetextfm" method="post" enctype="multipart/form-data" novalidate>
		<input id="cs_textid" name="cs_textid" type="hidden" />
		<input id="cs_newtext" class="easyui-textbox" name="cs_text" required="true" style="width:300px;height:150px"/>
	</form>
	<div id="updatetext-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateCoursysText()" style="width: 90px">确认</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showCoursysText').dialog('close')"
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
			title : '文字说明',
			align:'center',
			width : 100
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
      	 	title:'体系图片',
      	 	width:100,
      	 	align:'center',
      	 	formatter:function(value,row,index){
      	 		if(value!=null && value!=''){
					return '<a href="javascript:void(0)" onclick="showCoursysPic(0)">查看</a>|<a href="javascript:void(0)" onclick="showCoursysPic(1)">修改</a>';
				}else{
					return '<a href="javascript:void(0)" onclick="showCoursysPic(2)">添加</a>';
				}
      	 	}
      	 },{
       	 	field:'cs_head',
       	 	title:'体系头像',
       	 	width:100,
       	 	align:'center',
       	 	formatter:function(value,row,index){
       	 		if(value!=null && value!=''){
 					return '<a href="javascript:void(0)" onclick="showCoursysHead(0)">查看</a>|<a href="javascript:void(0)" onclick="showCoursysHead(1)">修改</a>';
 				}else{
 					return '<a href="javascript:void(0)" onclick="showCoursysHead(2)">添加</a>';
 				}
       	 	}
       	 }] ],
		//定义按钮
		toolbar : [
				{
					text:"选定一行即可编辑该课程体系的文字说明",
					iconCls : 'icon-add',
					handler : function() {
						$('#showCoursysText').dialog('open').dialog('setTitle','编辑课程体系文字说明');
						var cs_textid=$('#coursysinfo').datagrid('getSelected').cs_id;
						var cs_text1=$('#coursysinfo').datagrid('getSelected').cs_text;
						$('#cs_textid').val(cs_textid);
						$("#cs_newtext").textbox("setValue", cs_text1);
					}
				},{
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
$("#picUrl1").change(function(){
	//$('#addpreview1').css("display","inline-block");
	//$("#addpreview1").removeAttr("src");
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$("#addpreview1").attr("src", objUrl) ;
	}
}) ;
$("#picUrl2").change(function(){
	//$('#addpreview2').css("display","inline-block");
	//$("#addpreview2").removeAttr("src");
	var objUrl = getObjectURL(this.files[0]) ;
	if (objUrl) {
		$("#addpreview2").attr("src", objUrl) ;
	}
}) ;
$('#update_picUrl1').change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	//console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#cspic").attr("src", objUrl) ;
	}
});
$('#update_headUrl').change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	//console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#cshead").attr("src", objUrl) ;
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
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
			$('#addcsinfo').dialog('close');
			$('#addcsinfo').dialog('refresh');
			$("#csform").form('clear');
			$("#addpreview1").css({display:"none"});
			$("#addpreview2").css({display:"none"});
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
//查看体系图片
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
		$('#file').css({ display: "inline-block" });
		$('#showCoursysPic').dialog('open').dialog('setTitle','添加课程体系图片');
	}else{
		$('#update-buttons').css({display:"inline-block"});
		$('#cs_id').val(cs_id);
		$('#file').css({ display: "inline-block" });
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
//查看体系头像
function showCoursysHead(type){
	var csid=$('#coursysinfo').datagrid('getSelected').cs_id;
	var cs_head=$('#coursysinfo').datagrid('getSelected').cs_head;
	cs_head=cs_head.replace(",","");
	cs_head=cs_head.substring(22);
	$("#cshead").attr("src","../"+cs_head);
	if(type==0){
		$('#updatehead-buttons').css({ display: "none" });
		$('#filehead').css({ display: "none" });
		$('#showCoursysHead').dialog('open').dialog('setTitle','查看课程体系头像');
	}else if(type==2){
		$('#updatehead-buttons').css({display:"inline-block"});
		$('#csid').val(csid);
		$('#filehead').css({ display: "inline-block" });
		$('#showCoursysHead').dialog('open').dialog('setTitle','添加课程体系头像');
	}else{
		$('#updatehead-buttons').css({display:"inline-block"});
		$('#csid').val(csid);
		$('#filehead').css({ display: "inline-block" });
		$('#showCoursysHead').dialog('open').dialog('setTitle','修改课程体系头像');
	}
}
//修改体系头像
$("#updateheadfm").form({
	url:"coursys_updatehead",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#showCoursysHead').dialog('close');
		$('#coursysinfo').datagrid('reload');
	}
},'json');
function updateCoursysHead(){
	$("#updateheadfm").submit();
}
//课程体系的文字说明
$("#updatetextfm").form({
	url:"coursys_updatetext",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#showCoursysText').dialog('close');
		$('#coursysinfo').datagrid('reload');
	}
},'json');
function updateCoursysText(){
	$.messager.confirm('提示', '您确定要更改该体系的文字说明吗？', function(r) {
		if (r) {
			$("#updatetextfm").submit();
		}else{
			$('#showCoursysText').dialog('close');
		}
	});
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