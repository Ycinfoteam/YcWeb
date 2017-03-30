<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<table id="studentinfo"></table>
 <div id="tb" style="padding:5px">  
        <div style="margin-bottom:5px">  
             <a id="sendclsinfo" onclick="sendclsinfo()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">发送开班信息</a>  
        </div>  
        <div>  
            <label>根据学生报名意向查询：
			    <select id="stu_direction" class="easyui-combobox" panelHeight="auto" style="width:100px">
			    	<option value="请选择">请选择</option>
					<option value="J2EE开发工程师">J2EE开发工程师</option>
					<option value="前端工程师">前端工程师</option>
					<option value="嵌入式工程师">嵌入式工程师</option>
					<option value="大数据开发工程师">大数据开发工程师</option>
				</select> 
			</label>  
			<label>是否已发送开班信息：
	            <select id="status" class="easyui-combobox" panelHeight="auto" style="width:100px">  
	                <option value="-1">请选择</option>  
	                <option value="1">已发送开班信息</option>  
	                <option value="0">未发送开班信息</option>  
	            </select>  
			</label> 
            <a class="easyui-linkbutton" iconCls="icon-search" onclick="searchEnroll()">查询</a>  
        </div>  
</div>  
<script type="text/javascript">
//显示学生报名信息的数据表格
$(function(){
	$('#studentinfo').edatagrid({
			url : 'stu_selectAll', //查询时加载的URL
			//定义按钮
			toolbar : '#tb',
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
			singleSelect:false,
			columns : [ [ 
			{
				field : 'ck',
				title : '全选',
				width : 10,
				align : 'center',
				checkbox:true
			},{
				field : 's_id',
				title : '学生报名编号',
				width : 100,
				align : 'center',
				hidden:'true'
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
			},
	      	 {
				field : 's_direction',
				title : '意向课程',
				align:'center',
				width : 100,
			}, {
				field : 's_status',
				title : '是否发送信息',
				width : 50,
				align : 'center',
				formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
					//必须返回一个字符串、用于替换被加formatter的单元格。
					if (value == 0) {
						return '未发送';
					}
					if (value == 1) {
						return '已发送';
					};
				}
			} ] ]
	});
});
//根据条件查询学生报名信息
function searchEnroll(){
	var direction=$("#stu_direction").combobox('getValue');//获取意向课程
	var status=$("#status").combobox('getValue')//获取是否发送了开班信息 
	if(direction=='请选择'&&status==-1){
		$.messager.alert("提示", "未选择查找条件！！！");
	}
	$('#studentinfo').datagrid({
		url:'stu_selectByTag',
		queryParams: {
			direction:direction,
			status:status
		},
		onLoadSuccess: function (data) {
            if (data.rows.length == 0) {
                //添加一个新数据行，第一列的值为你需要的提示信息，然后将其他列合并到第一列来，注意修改colspan参数为你columns配置的总列数
                $('#studentinfo').datagrid('appendRow', { s_name: '<div style="text-align:center;color:red">没有相关记录！</div>' }).datagrid('mergeCells', { index: 1, field: 's_name', colspan: 5 });
            }
       },
	});
}
//发送开班信息
function sendclsinfo(){
	
}
</script>