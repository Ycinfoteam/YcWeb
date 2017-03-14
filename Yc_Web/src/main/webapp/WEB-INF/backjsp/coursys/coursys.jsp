<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<table id="coursysinfo"></table>
<div id="addcsinfo" class="easyui-dialog"
	style="width: 1070px; height: 480px; padding: 10px 20px;display:none" closed="true"
	buttons="#fooddlg-buttons">
	<form id="csform" method="post" enctype="multipart/form-data"  novalidate>
		<div>
		<label>课程方向: </label> 
		<input id="cs_name" name="cs_name" class="easyui-textbox" style="width:300px" required="true">
		</div>
		<div>
		<label>体系版本:</label>
		<input id="cs_version" name="cs_version" class="easyui-textbox" style="width:80px"required="true">
		</div>
		<div>
		<label>图片说明: </label>
		<input id="picUrl" type="file" name="picUrl" required="true"/>
		</div>
		<div>
		<label>文字说明：</label>
		<textarea id="cs_text" name="cs_text" class="easyui-textbox" style="width:600px;height:300px" required="true"></textarea>
		</div>
	</form>
	<div id="fooddlg-buttons">
		<a class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="saveCoursysInfo()" style="width: 90px">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel"
			onclick="javascript:$('#addcsinfo').dialog('close')"
			style="width: 90px">取消</a>
	</div>
</div>
<script type="text/javascript">
$('#coursysinfo').edatagrid({
		url : 'coursys_selectAll', //查询时加载的URL
		saveUrl : 'coursys_add',
		updateUrl : 'coursys_update',
		destroyUrl : 'coursys_delete',

		pagination : true, //显示分页
		pageSize : 5, //默认分页的条数
		pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 ], //可选分页条数
		fitColumns : true, //自适应列
		fit : true, //自动补全
		title : "公司新闻管理",
		iconCls : "icon-save",//图标
		idField : "cs_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
		rownumbers : "true", //显示行号
		nowrap : "true", //不换行显示
		sortName : "sort", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
		sortOrder : "desc", //排序方式

		//以上的四种增删改查操作，只要失败，都会回掉这个onError
		onError : function(a, b) {
			$.messager.alert("错误", "操作失败");
		},
		striped : true,//用于隔行变色
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
		},{
      	 	field:'cs_pic',
      	 	title:'图片说明',
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
			field : 'cs_text',
			title : '文字说明',
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
			title : '是否显示',
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
		} ] ],
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
function saveCoursysInfo(){
	$("#csform").ajaxSubmit({
		type : "post",
		url : "coursys_add",
		dataType:"json",
		success : function(data) {
			alert(12);
			//alert(data.get(0));
			if(data==1){
				$.messager.alert('成功提示', '添加成功！');
			}
		},
		error:function(data,status,e){
			//alert(data.get(0));
			$.messager.alert('错误提示', '新课程添加失败！');
		}
	});
	alert(7);
	$('#addcsinfo').dialog('close');
	$('#coursysinfo').edatagrid('reload');
}
</script>