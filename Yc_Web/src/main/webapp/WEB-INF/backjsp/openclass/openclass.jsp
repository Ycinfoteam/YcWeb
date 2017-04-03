<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<!-- 用于存放开班信息数据表格的表格容器 -->
<table id="ocinfo_datagrid"></table>
<!-- 添加开班的模块 -->
<div id="addoc_dialog" class="easyui-dialog" style="width: 350px; height: 300px; padding: 10px 20px;display:none" closed="true"
	buttons="#add-buttons">
	<form id="addoc_form" method="post" enctype="multipart/form-data"  novalidate>
		<div>
		<label>班级名称: </label> 
		<input id="oc_name" name="oc_name" class="easyui-validatebox" style="width:150px" 
				required="true" validType="nameRex">
		</div>
		<div>
		<label>开班日期:</label>
		<input id="oc_time" name="oc_time" class="easyui-datebox"  editable:false  style="width:150px"
				required="true" validType="dateRex">
		</div>
		<div>
		<label>上传图片: </label>
		<input id="picUrl" type="file" name="picUrl" required="true"/><br/>
		<img id="addpreview" src="" style="width:200px;height:200px ;display:none"/>
		</div>
	</form>
	<div id="add-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="addOpenCls()" style="width: 90px">保存</a>
		<a class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#addoc_dialog').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<!-- 图片 -->
<div id="showOpenClsPic" class="easyui-dialog" 
	style="width: 700px; height: 500px; padding: 10px 20px;display:none" closed="true" buttons="#update-buttons">
	<form id="updatepicfm" method="post" enctype="multipart/form-data" novalidate>
		<img id="ocpic" style="width:680px;height:380px;"/>
		<input id="oc_id" name="oc_id" type="hidden" />
		<div id="file">
			<label>上传新图片：</label>
			<input id="update_picUrl" type="file" name="update_picUrl" required="true"/>
		</div>
	</form>
	<div id="update-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="updateOpenClsPic()" style="width: 90px">确认</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#showOpenClsPic').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<script type="text/javascript">
//强制要求开班日期只能是当前日期之后的30个工作日
$('#oc_time').datebox().datebox('calendar').calendar({
	validator: function(date){
		var now = new Date();
		var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
		var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+30);
		return d1<=date && date<=d2;
	}
});
$('#ocinfo_datagrid').edatagrid({
		url : 'openCls_selectAll', //查询时加载的URL
		updateUrl : 'openCls_update',
		destroyUrl : 'openCls_delete',
		
		pagination : true, //显示分页
		pageSize : 5, //默认分页的条数
		pageList : [ 5, 10, 15], //可选分页条数
		fitColumns : true, //自适应列
		fit : true, //自动补全
		title : "开班信息管理",
		iconCls : "icon-save",//图标
		idField : "oc_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
		rownumbers : "true", //显示行号
		nowrap : "true", //不换行显示
		sortName : "oc_id", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
		sortOrder : "desc", //排序方式
		singleSelect:true,
		remoteSort:false,
		//以上的四种增删改查操作，只要失败，都会回掉这个onError
		onError : function(a, b) {
			$.messager.alert("错误", "操作失败");
		},
		striped : true,//设置为true将交替显示行背景
		columns : [ [ {
			field : 'oc_id',
			title : '开班信息编号',
			hidden:'true'
		}, {
			field : 'oc_name',
			title : '班级名称',
			width : 60,
			align : 'center',
			editor : {
				type : 'validatebox',
				options : {
					required : true,
					validType:'nameRex'
				}
			},
		},{
			field : 'oc_time',
			title : '开班时间',
			width : 50,
			align : 'center',
			sortable: true,
			sorter:function(a,b){
				a = a.split('-');
				b = b.split('-');
				if (a[0] == b[0]){//年份相同
					if (a[1] == b[1]){//月份相同
						return (a[2]>b[2]?1:-1);
					} else {
						return (a[2]>b[2]?1:-1);
					}
				} else {
					return (a[0]>b[0]?1:-1);
				}
			},
			editor : {
				type : 'datebox',
				options : {
					editable:false,
					required : true,
					validType:'dateRex'
				}
			}
		}, {
			field : 'oc_status',
			title : '状态',
			width : 50,
			align : 'center',
			styler:cellStyler,
			editor : {
				type : 'combobox',
				options : {
					required:true,
					editable:false,
					data : [ {
						text : '显示',
						value : '1'
					}, {
						text : '过期',
						value : '0'
					} ]
				}
			},
			formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
				//必须返回一个字符串、用于替换被加formatter的单元格。
				if (value == 0) {
					return '过期';
				}
				if (value == 1) {
					return '显示';
				}
			}
		} ,{
      	 	field:'oc_pic',
      	 	title:'图片操作',
      	 	width:100,
      	 	align:'center',
      	 	formatter:function(value,row,index){
      	 		if(value!=null && value!=''){
					return '<a href="javascript:void(0)" onclick="showOpenClsPic(0)">查看</a>|<a href="javascript:void(0)" onclick="showOpenClsPic(1)">修改</a>';
				}else{
					return '<a href="javascript:void(0)" onclick="showOpenClsPic(2)">添加</a>';
				}
      	 	}
      	 }] ],
		//定义按钮
		toolbar : [
				{
					text : "增加",
					iconCls : 'icon-add',
					handler : function() {
						$('#addoc_dialog').dialog('open').dialog('setTitle','发布开班信息');
					}
				},
				'-',
				{
					text : "删除",
					iconCls : 'icon-remove',
					handler : function() {
						$('#ocinfo_datagrid').edatagrid('destroyRow');
						//$('#dg').edatagrid('loadData')
					}
				},
				'-',
				{
					text : "保存",
					iconCls : 'icon-save',
					handler : function() {
						$('#ocinfo_datagrid').edatagrid('saveRow');
					}
				},
				'-',
				{
					text : "取消编辑",
					iconCls : 'icon-undo',
					handler : function() {
						$('#ocinfo_datagrid').edatagrid('cancelRow');
					}
				} ],
				onHeaderContextMenu: function(e, field){
					e.preventDefault();
					if (!cmenu){
						createColumnMenu();
					}
					cmenu.menu('show', {
						left:e.pageX,
						top:e.pageY
					});
				}
});
function cellStyler(value,row,index){
	if (value > 0){
		return 'color:red;';
	}
}
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
//添加信息
$("#addoc_form").form({
	url:"openCls_add",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '添加失败！');
		}
		$('#addoc_dialog').dialog('close');
		$('#ocinfo_datagrid').edatagrid('load');
	}
},'json');
function addOpenCls(){
	$("#addoc_form").submit();
}

//查看头像
function showOpenClsPic(type){
	var oc_id=$('#ocinfo_datagrid').datagrid('getSelected').oc_id;
	var oc_pic=$('#ocinfo_datagrid').datagrid('getSelected').oc_pic;
	oc_pic=oc_pic.replace(",","");
	oc_pic=oc_pic.substring(22);
	$("#ocpic").attr("src","../"+oc_pic);
	if(type==0){
		$('#update-buttons').css({ display: "none" });
		$('#file').css({display:"none"});
		$('#showOpenClsPic').dialog('open').dialog('setTitle','查看班级图片');
	}else if(type==2){
		$('#update-buttons').css({display:"inline-block"});
		$('#oc_id').val(oc_id);
		$('#showOpenClsPic').dialog('open').dialog('setTitle','添加班级图片');
	}else{
		$('#update-buttons').css({display:"inline-block"});
		$('#file').css({display:"inline-block"});
		$('#oc_id').val(oc_id);
		$('#showOpenClsPic').dialog('open').dialog('setTitle','修改班级图片');
	}
}
//修改图片
$("#updatepicfm").form({
	url:"openCls_updatepic",
	success:function(data){
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#showOpenClsPic').dialog('close');
		$('#tcinfo_datagrid').datagrid('load');
	}
},'json');
function updateOpenClsPic(){
	$("#updatepicfm").submit();
}
//自定义表单验证规则
$.extend($.fn.validatebox.defaults.rules, {   
	nameRex: {   
        validator: function(value, param){  
        	var reg=/^[\u4E00-\u9FA5A]{2,10}$/;
        	if(reg.test(value)){
        		return true;
        	}else{
        		return false;
        	}
        },   
        message: '请输入长度2~10的中文汉字'  
    }
});  
$.extend($.fn.datagrid.defaults.rules, {  
	nameRex: {   
        validator: function(value, param){  
        	var reg=/^[\u4E00-\u9FA5A]{2,10}$/;
        	if(reg.test(value)){
        		return true;
        	}else{
        		return false;
        	}
        },   
        message: '请输入长度2~10的中文汉字'  
    }
});  
</script>