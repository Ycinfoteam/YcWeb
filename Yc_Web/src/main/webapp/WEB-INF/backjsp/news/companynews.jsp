<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- zx's companyUI -->
<!-- 新闻显示的数据表格 -->
<table id="companynewsdg"></table>
<!-- 添加新闻 -->
<div id="companynewsdlg" class="easyui-dialog"
	style="width: 1070px; height: 480px; padding: 10px 20px;display:none" closed="true"
	buttons="#add-buttons">
	<form id="companynewsfm" method="post" novalidate>
		<div class="fitem">
			<label> 新闻标题: </label> 
			<input id="companynews_title" name="title" class="easyui-textbox" style="width:300px" required="true">
		</div>
		<div class="fitem">
			<label> 新闻详情: </label>
			<textarea id="add_companynews_detail" name="detail" style="width: 900px;height:400px;" >请输入新闻内容... </textarea>  
		</div>
	</form>
	<div id="add-buttons">
		<a class="easyui-linkbutton c6" iconCls="icon-filesave" type="submit" onclick="addCompanyNews(0)" style="width: 90px">仅保存</a>
		<a class="easyui-linkbutton" iconCls="icon-ok" type="submit" onclick="addCompanyNews(1)" style="width: 90px">保存并发布</a>
	</div>
</div>
<!-- 修改新闻内容 -->
<div id="companynewsllg" class="easyui-dialog" 
	style="width: 1070px; height: 480px; padding: 10px 20px;display:none" closed="true"
	buttons="#update-buttons">
	<form id="updatenewsfm" method="post" action="news_updateNews" novalidate>
		<div class="fitem">
			<label> 新闻标题: </label> 
			<input id="companynews_title" name="title" class="easyui-textbox" style="width:300px" required="true">
		</div>
		<div class="fitem">
			<label>新闻内容:</label> <input type="hidden" name="id" id="id" />
			<textarea name="detail" id="update_companynews_detail"></textarea>
			<font size="2">注：您的良好描述，将影响对该页面的访问量。</font>
		</div>
	</form>
	<div id="update-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" 
			onclick="submitCompanyNewsForm()" style="width: 90px">确认修改</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#companynewsllg').dialog('close')" style="width: 90px">放弃修改</a>
	</div>
</div>
<script src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>  
<script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
//实例化编辑器  
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例  
var editor=UE.getEditor('add_companynews_detail');
$('#companynewsdg').edatagrid({
	url : 'news_selectAll', //查询时加载的URL
	saveUrl : 'news_addNews',//保存时的URL
	updateUrl : 'news_updateNews',//修改
	destroyUrl : 'news_deleteNews',//删除

	pagination : true, //显示分页
	pageSize : 5, //默认分页的条数
	pageList : [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 ], //可选分页条数
	fitColumns : true, //自适应列
	fit : true, //自动补全
	title : "公司新闻管理",
	iconCls : "icon-save",//图标
	idField : "n_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
	rownumbers : "true", //显示行号
	nowrap : "true", //不换行显示
	sortName : "n_sort", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
	sortOrder : "desc", //排序方式

	//以上的四种增删改查操作，只要失败，都会回掉这个onError
	onError : function(a, b) {
		$.messager.alert("错误", "操作失败");
	},
	striped : true,
	columns : [ [ {
		field : 'n_id',
		title : '新闻编号',
		width : 100,
		align : 'center',
		hidden:'true'
	}, {
		field : 'n_title',
		title : '新闻标题',
		width : 100,
		align : 'center',
		editor : {
			type : 'validatebox',
			options : {
				required : true
			}
		},
	}, {
		field : 'n_time',
		title : '创建时间',
		width : 100,
		align : 'center',
	},{
   	 	field:'n_click',
   	 	title:'点击数',
   	 	width:30,
   	 	align:'center',
   	 }, {
		field : 'n_sort',
		title : '排序(数字越大显示越前)',
		width : 50,
		align : 'center',
		editor : {
			type : 'validatebox',
			options : {
				required : true
			}
		},
	}, {
		field : 'status',
		title : '是否发布',
		width : 50,
		align : 'center',
		editor : {
			type : 'combobox',
			options : {
				required:true,
				data : [ {
					text : '已发布',
					value : '1'
				}, {
					text : '仅保存',
					value : '0'
				} ]
			}
		},
		formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
			//必须返回一个字符串、用于替换被加formatter的单元格。
			if (value == 0) {
				return '仅保存';
			}
			if (value == 1) {
				return '已发布';
			}
		}
	} , {
		field : 'n_content',
		title : '新闻内容',
		formatter:function(value,rowData,index){
			return '<a href="javascript:showNewsContent('+row.n_id+')">查看</a>';
		}
	}] ],
	onHeaderContextMenu : function(e, field) {
		e.preventDefault();
		if (!companycmenu) {
			createColumnMenu();
		}
		companycmenu.menu('show', {
			left : e.pageX,
			top : e.pageY
		});
	},
	//定义按钮
	toolbar : [
			{
				text : '选定一行即可点击修改公司新闻内容',
				iconCls : 'icon-add',
				handler : function() {
					var rowflag = $('#companynewsdg').datagrid('getSelected');
					if (rowflag) {
						$('#companynewsllg').dialog('open').dialog('setTitle', '公司新闻信息');
						$('#id').val(row.n_id);
						companynews_editor.setData(row.detail);
					}
				}
			},
			'-',
			{
				text : "增加",
				iconCls : 'icon-add',
				handler : function() {
					$('#companynewsdlg').dialog('open').dialog('setTitle','新增公司新闻');
					$('#companynewsfm').form('clear');

				}
			},
			'-',
			{
				text : "删除",
				iconCls : 'icon-remove',
				handler : function() {
					$('#companynewsdg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			},
			'-',
			{
				text : "保存",
				iconCls : 'icon-save',
				handler : function() {
					$('#companynewsdg').edatagrid('saveRow')
				}
			},
			'-',
			{
				text : "取消编辑",
				iconCls : 'icon-undo',
				handler : function() {
					$('#companynewsdg').edatagrid('cancelRow')
				}
			} ]

});

function addCompanyNews(type){
	alert(type);
	var content = UE.getPlainTxt();//content就是编辑器的带格式的内容
	$("#companynewsfm").form({
		url:"news_addNews",
		success:function(data){
			alert(data);
			if(data==1){
				$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
			}else{
				$.messager.alert('错误提示', '添加失败！');
			}
			$('#companynewsdlg').dialog('close');
			$('#companynewsdg').edatagrid('load');
		}
	},'json');
	/* $("#companynewsfm").ajaxSubmit({
		type : "post",
		url : "news_addNews",
		dataType:"json",
		data:{type:type},
		success : function(data) {
			alert(12);
			if(data==1){
				$.messager.alert('成功提示', '添加成功！');
			}
		},
		error:function(data,status,e){
			$.messager.alert('错误提示', '新课程添加失败！');
		}
	});
	$('#companynewsdlg').dialog('close');
	$('#companynewsdg').edatagrid('reload'); */
}
</script>


