<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<style>
#tbtable{
margin-left:auto;
margin-right:auto;
width:100%;
}
#tb_sendmsg{
width:50%
}
#tb_manage{
width:50%
}
#line{
	border-style: solid; border-width: 0px 0px 0px 5px;
	border-left-color: red;
}
</style>
<table id="studentinfo"></table>
<div id="tb" style="padding: 5px">
	<table id="tbtable">
		<tr>
			<td id="tb_sendmsg">
				<p>发送开班信息至报名学生：</p>
				<div style="margin-bottom: 5px">
					<label>开班课程： 
					<input id="cc1" class="easyui-combobox"
						editable="false"
						data-options="   
				       valueField: 'oc_id',   
				       textField: 'oc_name',   
				       url: 'findopenCls',   
				       onSelect: function(rec){   
				           $('#oc_time').datebox('setValue', rec.oc_time);	 
				       }" />
					</label>
					<label>开班时间：
					<input id="oc_time" name="oc_time" class="easyui-datebox" editable="false" style="width: 100px" required="true" validType="dateRex">
					</label> 
					<label>开班地点：
					<input id="address" class="easyui-textbox" style="width: 150px" required="true" validType="CHS" />
					</label> 
					<a id="sendclsinfo" onclick="sendclsinfo()" class="easyui-linkbutton" iconCls="icon-ok">发送开班信息</a>
				</div>
			</td>
			<td id="line"></td>
			<td id="tb_manage">
				<p>根据条件查询学生报名信息（提供录入学籍功能）：</p>
				<div style="margin-bottom: 5px">
					<label>根据学生报名意向查询：
					<input id="stu_direction"
						name="stu_direction" class="easyui-combobox" style="width: 200px"
						editable:false
						data-options="   
			      		valueField: 'oc_name',   
			     			textField: 'oc_name',   
			      		url:'findopenCls'" />
					<a class="easyui-linkbutton" iconCls="icon-search" onclick="searchEnroll()">查询</a>
					</label> 
					<br/>
					<a class="easyui-linkbutton" iconCls="icon-ok" onclick="updatethestu()">录入学籍</a>
					<a class="easyui-linkbutton" iconCls="icon-ok" onclick="deletethestu()">删除信息</a>
				</div>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
	//强制要求开班日期只能是当前日期之后的30个工作日
	$('#oc_time').datebox().datebox('calendar').calendar(
			{
				validator : function(date) {
					var now = new Date();
					var d1 = new Date(now.getFullYear(), now.getMonth(), now
							.getDate());
					var d2 = new Date(now.getFullYear(), now.getMonth(), now
							.getDate() + 30);
					return d1 <= date && date <= d2;
				}
			});
	$(function() {
		//显示学生报名信息的数据表格
		$('#studentinfo').edatagrid({
			url : 'stu_selectAll', //查询时加载的URL
			destroyUrl : 'stu_delete',
			pagination : true, //显示分页
			pageSize : 5, //默认分页的条数
			pageList : [ 5, 10 ], //可选分页条数
			fitColumns : true, //自适应列
			fit : true, //自动补全
			title : "学生报名信息管理",
			iconCls : "icon-save",//图标
			idField : "s_id", //标识，会记录我们选中的一行的id，不一定是id，通常都是主键
			rownumbers : "true", //显示行号
			nowrap : "true", //不换行显示
			sortName : "s_id", //排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
			sortOrder : "desc", //排序方式
			//以上的四种增删改查操作，只要失败，都会回掉这个onError
			onError : function(a, b) {
				$.messager.alert("错误", "操作失败");
			},
			striped : true,//设置为true将交替显示行背景
			singleSelect : false,
			columns : [ [ {
				field : 'ck',
				title : '全选',
				width : 10,
				align : 'center',
				checkbox : true
			}, {
				field : 's_id',
				title : '学生报名编号',
				width : 100,
				align : 'center',
				hidden : 'true'
			}, {
				field : 's_name',
				title : '学生姓名',
				width : 60,
				align : 'center',
			}, {
				field : 's_tel',
				title : '手机号',
				width : 100,
				align : 'center',
			}, {
				field : 's_direction',
				title : '意向课程',
				align : 'center',
				width : 100,
			}, {
				field : 's_date',
				title : '报名日期',
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
			},{
				field : 's_status',
				title : '是否录入学籍',
				width : 50,
				styler : cellStyler,
				align : 'center',
				formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
					//必须返回一个字符串、用于替换被加formatter的单元格。
					if (value == 0) {
						return '未录入';
					}
					if (value == 1) {
						return '已录入';
					}
				}
			} ] ],
			//定义按钮
			toolbar : "#tb"
		});
	});
	function cellStyler(value, row, index) {
		if (value > 0) {
			return 'color:red;';
		}
	}
	//根据条件查询学生报名信息
	function searchEnroll() {
		var direction = $("#stu_direction").combobox('getValue');//获取意向课程
		$('#studentinfo').datagrid({
			url : 'stu_selectByTag',
			queryParams : {
				direction : direction
			},
			onLoadSuccess : function(data) {
				if (data.rows.length == 0) {
					$.messager.alert("结果提示", "抱歉，未找到您所查询的相关信息！！！");
				}
				$('#stu_direction').combobox('setValue', '查询所有');
				$("#status").combobox('setValue', 0);
				$('#stu_direction').combobox('unselect', direction);
			}
		});
	}
	//录入学籍信息（改变后应加入源辰的学生管理表）
	function updatethestu(type){
		var rows = $('#studentinfo').datagrid('getSelections');
		var ids = new Array();
		for (var i = 0; i < rows.length; i++) {
			ids.push(rows[i].s_id);
		}
		if(ids==null){
			$.messager.alert("错误提示", "请选择需录入学籍的学生");
		}else{
			$.messager.confirm('提示', '您确定要录入该学生信息至学生信息库？', function(r) {
				if (r) {
					$.ajax({
						cache : false,
						type : "post",//使用get方法访问后台
						dataType : "json",//返回json格式的数据
						url : "addStuIntoYc",//要访问的后台地址
						data : {
							type:type,
							ids : ids
						},//要发送的数据
						success : function(data) {//msg为返回的数据，在这里做数据绑定
							if (data == 0) {
								$.messager.alert("提示", "录入失败");
							} else {
								$.messager.show({
									title : '温馨提示',
									msg : '录入成功！',
									timeout : 2000,
									showType : 'slide'
								});
								$('#studentinfo').datagrid('reload');
							}
						}
					});
				}
			});
		}
	}
	function deletethestu(){
		$('#studentinfo').edatagrid('destroyRow');
	}
	//发送开班信息
	function sendclsinfo() {
		var oc_time = $('#oc_time').datebox("getValue");
		var address = $('#address').val();
		var s_direction = $('#studentinfo').datagrid('getSelected').s_direction;
		var planIds = new Array();
		var tels = new Array();
		var names = new Array();
		var rows = $('#studentinfo').datagrid('getSelections');
		for (var i = 0; i < rows.length; i++) {
			planIds.push(rows[i].s_id);
			tels.push(rows[i].s_tel);
			names.push(rows[i].s_name);
		}
		if (oc_time == null || address == null || planIds == null
				|| tels == null || names == null) {
			$.messager.alert("错误提示", "您的操作有误，请确认后再次操作");
		}else{
			$.messager.confirm('提示', '您确定要发送短信到学生手机吗？', function(r) {
				if (r) {
					$.ajax({
						cache : false,
						type : "post",//使用get方法访问后台
						dataType : "json",//返回json格式的数据
						url : "sendclsinfo",//要访问的后台地址
						data : {
							planIds : planIds,
							tels : tels,
							names : names,
							oc_time : oc_time,
							address : address,
							s_direction : s_direction
						},//要发送的数据
						success : function(data) {//msg为返回的数据，在这里做数据绑定
							if (data == 0) {
								$.messager.alert("提示", "发送失败");
							} else {
								$.messager.show({
									title : '温馨提示',
									msg : '发送成功！',
									timeout : 2000,
									showType : 'slide'
								});
								$('#address').text('');
								$('#oc_time').combo('setText', '');
								$('#studentinfo').datagrid('reload');
							}
						}
					});
				}
			});
		}
	}

	//自定义表单验证规则
	$.extend($.fn.textbox.defaults.rules, {
		//验证非特殊符号
		CHS : {
			validator : function(value) {
				return /^([\u4e00-\u9fa5]+|[a-zA-Z0-9]+)$/.test(value);
			},
			message : '不能输入非法字符，如@'
		},
	});
</script>