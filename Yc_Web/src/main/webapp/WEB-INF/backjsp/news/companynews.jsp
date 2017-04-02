<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@page isELIgnored="false" %>
<!-- zx's companyUI -->
<!-- 新闻显示的数据表格 -->
<table id="companynewsdg"></table>
<!-- 编辑新闻 -->
<div id="companynewsdlg" class="easyui-dialog"
	style="width: 1070px; height: 680px; padding: 10px 20px;display:none" closed="true"
	buttons="#news-buttons">
	<form id="companynewsfm" method="post" novalidate>
		<input id="id" name="n_id" type="hidden"/>
		<div class="fitem" id="title">
			<label> 新闻标题: </label> 
			<input id="n_title" name="n_title" class="easyui-textbox" style="width:300px" required="true">
		</div>
		<div class="fitem">
			<label> 新闻详情: </label>
			<script id="n_content" name="n_content" type="text/plain" style="width: 1000px;height:400px;"></script>
			<font size="2">注：您的良好描述，将影响对该页面的访问量。</font>
			<input id="type" name="type" type="hidden" />
		</div>
	</form>
	<div id="news-buttons">
		<div id="update-buttons">
			<a class="easyui-linkbutton c6" iconCls="icon-filesave" type="submit" onclick="updateCompanyNews()" style="width: 90px">保存修改</a>
			<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#companynewsdlg').dialog('close')" style="width: 90px">取消</a>
		</div>
		<div id="add-buttons">
			<a class="easyui-linkbutton c6" iconCls="icon-filesave" type="submit" onclick="addCompanyNews(0)" style="width: 90px">仅保存</a>
			<a class="easyui-linkbutton" iconCls="icon-ok" type="submit" onclick="addCompanyNews(1)" style="width: 90px">保存并发布</a>
		</div>
	</div>
</div>
<div id="showNews" class="easyui-dialog" closed="true" 
	style="width: 1070px; height: 680px; padding: 10px 20px;display:none">
	<h2 id="sn_title"></h2>
	<div id="sn_info">
		<label>
			发布人:<span id="sn_reportor"></span>
			发布时间:<span id="sn_time"></span>
			点击次数:<span id="sn_click"></span>
		</label>
	</div>
	<p id="sn_content"></p>
</div>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>  
<script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
//实例化编辑器  
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例  
var editor=UE.getEditor('n_content');
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
	sortName : "n_id", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
	sortOrder : "desc", //排序方式
	remoteSort:false,
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
		sortable:true,
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
		}
	}, {
   	 	field:'n_click',
   	 	title:'点击数',
   	 	width:30,
   	 	align:'center',
   	 	sortable:true,
   	 },{
    	 	field:'n_reportor',
    	 	title:'发布人',
    	 	width:30,
    	 	align:'center',
    },{
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
		field : 'n_status',
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
			return '<a onclick="showNewsContent('+rowData.n_id+')">查看</a>'; 
		}
	}] ],
	
	//定义按钮
	toolbar : [
			{
				text : '选定一行即可点击修改公司新闻内容',
				iconCls : 'icon-add',
				handler : function() {
					var rowflag = $('#companynewsdg').datagrid('getSelected');
					var n_id=$('#companynewsdg').datagrid('getSelected').n_id;
					var n_title=$('#companynewsdg').datagrid('getSelected').n_title;
					var n_content=$('#companynewsdg').datagrid('getSelected').n_content;
					if (rowflag) {
						$('#companynewsdlg').dialog('open').dialog('setTitle', '修改公司新闻');
						$('#id').val(n_id);
						$('#title').css({display:"none"});
						$('#add-buttons').css({ display: "none" });
						$('#update-buttons').css({ display: "inline-block" });
						editor.setContent(n_content);
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
					$('#title').css({display:"inline-block"});
					$('#update-buttons').css({ display: "none" });
					$('#add-buttons').css({ display: "inline-block" });
					editor.setContent('');
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
//添加公司新闻
$("#companynewsfm").form({
	url:"news_addNews",
	success:function(data){
		//alert(data);
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '添加失败！');
		}
		$('#companynewsdlg').dialog('close');
		$('#companynewsdg').edatagrid('load');
	}
},'json');
function addCompanyNews(type){
	//alert(type);
	$('#type').val(type);
	//var content = UE.getPlainTxt();//content就是编辑器的带格式的内容
	$("#companynewsfm").submit();
}
//修改公司新闻内容
function updateCompanyNews(){
	var n_id=$('#id').val();
	var n_content=editor.getPlainTxt();
	alert(n_id);
  	$.post('news_updateNewsContent',{n_id:n_id,n_content:n_content},function(data){
	//alert(data);
		if(data==1){
			$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
		}else{
			$.messager.alert('错误提示', '修改失败！');
		}
		$('#companynewsdlg').dialog('close');
		$('#companynewsdg').edatagrid('load');
 	},'json');
}
//查看公司新闻
function showNewsContent(n_id){
	var n_title=$('#companynewsdg').datagrid('getSelected').n_title;//标题
	var n_time=$('#companynewsdg').datagrid('getSelected').n_time;//发布时间
	var n_reportor=$('#companynewsdg').datagrid('getSelected').n_reportor;//发布人
	var n_click=$('#companynewsdg').datagrid('getSelected').n_click;//点击数
	var n_content=$('#companynewsdg').datagrid('getSelected').n_content;
	$('#showNews').dialog('open').dialog('setTitle','查看公司新闻');
	$('#sn_title').text(n_title);
	$('#sn_reportor').text(n_reportor);
	$('#sn_time').text(n_time);
	$('#sn_click').text(n_click);
	$('#sn_content').append(n_content);
}
</script>


