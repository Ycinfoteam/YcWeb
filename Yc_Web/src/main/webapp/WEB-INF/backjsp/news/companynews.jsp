<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="backjs/jquery.edatagrid.js"></script>

<!-- zx's companyUI -->
<table id="companynewsdg"></table>
<script type="text/javascript">
$('#companynewsdg').edatagrid({
	url : 'news_list', //查询时加载的URL
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
   	 	width:100,
   	 	align:'center',
   	 }, {
		field : 'n_sort',
		title : '排序(数字越大显示越前)',
		width : 100,
		align : 'center',
		editor : {
			type : 'validatebox',
			options : {
				required : true
			}
		},
	}, {
		field : 'detail',
		title : '更多信息',

	}, {
		field : 'status',
		title : '是否显示',
		width : 100,
		align : 'center',
		editor : {
			type : 'combobox',
			options : {
				//required:true,
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
			}
		}
	} ] ],
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
				text : '选定一行即可点击编写公司新闻更多详细信息',
				iconCls : 'icon-add',
				handler : function() {

					var row = $('#companynewsdg')
							.datagrid('getSelected');
					if (row) {
						$('#companynewsllg').dialog(
								'open').dialog(
								'setTitle', '公司新闻信息');
						$('#id').val(row.nid);
						companynews_editor
								.setData(row.detail);

					}

				}
			},
			'-',
			{
				text : "增加",
				iconCls : 'icon-add',
				handler : function() {
					$('#companynewsdlg').dialog('open')
							.dialog('setTitle',
									'新增公司新闻');
					$('#companynewsfm').form('clear');

				}
			},
			'-',
			{
				text : "删除",
				iconCls : 'icon-remove',
				handler : function() {
					$('#companynewsdg').edatagrid(
							'destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			},
			'-',
			{
				text : "保存",
				iconCls : 'icon-save',
				handler : function() {
					$('#companynewsdg').edatagrid(
							'saveRow')
				}
			},
			'-',
			{
				text : "取消编辑",
				iconCls : 'icon-undo',
				handler : function() {
					$('#companynewsdg').edatagrid(
							'cancelRow')
				}
			} ]

});
</script>


