<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="${basePath }ckeditor/ckeditor.js"></script>
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



<table id="inewsdg">
</table>

  <div id="inewsllg" class="easyui-dialog"
	style="width: 1070px; height: 480px; padding: 10px 20px" closed="true"
	buttons="#fooddlg-buttons">
	
	<div class="ftitle" id="nid">行业新闻修改</div>
		<form id="inewsffm" method="post"
			action="yyyback/news_updateNews.action" >
			<table>
				<tr>
					<td colspan="2">
					<br />
						<div class="fitem">
							<label>详细:</label>
							<input type="hidden" name="id"  id="id"/>
							<textarea name="detail" id="alert_inews_detail"></textarea>
							<font size="2">注：您的良好描述，将影响对该页面的访问量。</font>
						</div></td>
				</tr>
	
			</table>
		</form>
		</div>
		<div id="fooddlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="submitInewsForm()" style="width: 90px">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#inewsllg').dialog('close')"
			style="width: 90px">Cancel</a>
		</div> 


<div id="inewsdlg" class="easyui-dialog"
	style="width: 1070px; height: 480px; padding: 10px 20px" closed="true"
	buttons="#fooddlg-buttons">
	<div class="ftitle">
		添加公司新闻信息
	</div>
	<form id="inewsfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				新闻标题:
			</label>
			<input id="add_inews_title" name="title" class="easyui-textbox" required="true">
		</div>
		<div class="fitem">
			<label>
				新闻详情:
			</label>
			<textarea name="detail" id="add_inews_detail" ></textarea>
		</div>
	</form>
</div>
<div id="fooddlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveInews()" style="width: 90px">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#inewsdlg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	function submitInewsForm() {
		$('#inewsffm').form('submit');
		$('#inewsdg').edatagrid('load');
		$('#inewsdlg').dialog('close');
	}
	var inews_editor = CKEDITOR.replace(
						'alert_inews_detail',{width:950}
						);
	$(function(){
	   datagrid=$('#inewsdg').edatagrid({ 
        	url: 'yyyback/news_list.action?type=行业新闻',	//查询时加载的URL
            saveUrl: 'yyyback/news_addNews.action?type=行业新闻',
            updateUrl: 'yyyback/news_updateNews.action', 
            destroyUrl: 'yyyback/news_deleteNews.action',
            
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"行业新闻管理",
        	iconCls:"icon-save",//图标
        	idField:"nid",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"sort",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"desc",	//排序方式
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
        	{
           	 	field:'nid',
           	 	title:'新闻编号',
           	 	width:100,
           	 	align:'center',
           	 	
           	 },{
           	 	field:'title',
           	 	title:'新闻标题',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
							type:'validatebox',
							options:{
								required:true
							}
						},
           	 	
           	 },{
           	 	field:'createtime',
           	 	title:'创建时间',
           	 	width:100,
           	 	align:'center',
           	 }/* ,{
           	 	field:'click',
           	 	title:'点击数',
           	 	width:100,
           	 	align:'center',
           	 } */,{
           	 	field:'sort',
           	 	title:'排序(数字越大显示越前)',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
							type:'numberbox',
							options:{
								required:true
							}
						},
           	 },{
				field : 'detail',
				title : '更多信息',

			},{
           	 	field:'state',
           	 	title:'是否显示',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'combobox',
           	 		options:{
           	 			//required:true,
           	 			data:[{text:'显示',value:'1'},{text:'不显示',value:'0'}]
           	 		}
           	 	},
           	 	formatter : function(value, rowData, index) {  //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
						//必须返回一个字符串、用于替换被加formatter的单元格。
						if(   value==0){
							return '不显示';
						}
						if(value==1){
							return '显示';
						};

				}
           	 	
           	 }
           	 ]],
           	  onHeaderContextMenu: function(e, field){
					e.preventDefault();
					if (!inewscmenu){
						createColumnMenu();
					}
					inewscmenu.menu('show', {
						left:e.pageX,
						top:e.pageY
					});
				},
           	 //定义按钮
	    toolbar: [{
	         	text : '选定一行即可点击编写行业新闻更多详细信息',
					iconCls : 'icon-add',
					handler : function() {

						var row = $('#inewsdg').datagrid(
								'getSelected');
						if (row) {
							$('#inewsllg').dialog('open').dialog(
									'setTitle', '行业新闻信息');
								$('#id').val(row.nid);
								inews_editor.setData(row.detail);

						}

					}
			}, '-',{
	         	text:"增加",
				iconCls: 'icon-add',
				handler : function() {  
                    $('#inewsdlg').dialog('open').dialog('setTitle','新增行业新闻');
            		$('#inewsfm').form('clear');
            		
                }  
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#inewsdg').edatagrid('destroyRow');
					//$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#inewsdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#inewsdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	CKEDITOR.replace('add_inews_detail',{width:950});
    	$('#inewsdg').datagrid('hideColumn', 'detail');
    });
	function saveInews(){
		
		var val = CKEDITOR.instances.add_inews_detail.getData();
		var title=$('#add_inews_title').val();
		
		$("#inewsfm").ajaxSubmit({
			type : "post",
			data:{'realdetail': val},
			url : "yyyback/news_addNews.action?&type=行业新闻",
			success : function(data1) {
				var dataObj=eval("("+data1+")");
				if(  dataObj.code==1){
					$.messager.alert('Info','更新成功！'); 
				}
			}
		});
		$('#inewsdg').edatagrid('load');
		$('#inewsdlg').dialog('close');
	}
	var inewscmenu;
		function createColumnMenu(){
			inewscmenu = $('<div/>').appendTo('body');
			inewscmenu.menu({
				onClick: function(item){
					if (item.iconCls == 'icon-ok'){
						$('#inewsdg').datagrid(showinewsall(), item.name);
						inewscmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-ok'
						});
					} else if(item.iconCls == 'icon-none'){
						$('#inewsdg').datagrid(showinewsnone(), item.name);
						inewscmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-none'
						});
					}else if(item.iconCls == 'icon-cansee'){
						$('#inewsdg').datagrid(showinewscansee(), item.name);
						inewscmenu.menu('setIcon', {
							target: item.target,
							iconCls: 'icon-cansee'
						});
					}
				}
			});
				inewscmenu.menu('appendItem', {
					text: "显示所有信息",
					name: "显示",
					iconCls: 'icon-ok'
				});
				inewscmenu.menu('appendItem', {
					text: "显示的新闻",
					name: "显示",
					iconCls: 'icon-cansee'
				});
				inewscmenu.menu('appendItem', {
					text: "不显示的新闻",
					name: "显示",
					iconCls: 'icon-none'
				});
				
		}
		function showinewscansee(){
				 $('#inewsdg').edatagrid('load',{
					type:1,
				}); 
									
		}
		function showinewsnone(){
				 $('#inewsdg').edatagrid('load',{
					type:0,
				}); 	
							
		}
		function showinewsall(){
				 $('#inewsdg').edatagrid('load',{
					type:null,
				}); 	
							
		}
</script>
