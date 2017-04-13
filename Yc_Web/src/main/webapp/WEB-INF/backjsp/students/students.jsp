         <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<table id="studentinfo"></table>
 <div id="tb" style="padding:5px"> 
        <div style="margin-bottom:5px"> 
        <label>开班课程：
        	<input id="cc1" class="easyui-combobox" data-options="   
	        valueField: 'oc_id',   
	        textField: 'oc_name',   
	        url: 'findopenCls',   
	        onSelect: function(rec){   
	            $('#oc_time').datebox('setValue', rec.oc_time);	 
	        }" />  </label>
			<!-- <input id="cc2" class="easyui-combobox" data-options="valueField:'id',textField:'text'" />   -->
        	<label>开班时间：<input id="oc_time" name="oc_time" class="easyui-datebox"  editable:false  style="width:150px"
				required="true" validType="dateRex"></label>
        	<label>开班地点：<input id="address" class="easyui-textbox" style="width:150px" required="true"/></label> 
            <a id="sendclsinfo" onclick="sendclsinfo()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">发送开班信息</a>  
            <br/><label>根据学生报名意向查询：
				<input id="stu_direction" name="stu_direction" class="easyui-combobox" style="width:200px" editable:false  data-options="   
        		valueField: 'j_name',   
       			textField: 'j_name',   
        		url:'showJobType'"/>
			</label>  
			<label>是否已发送开班信息：
	            <select id="status" class="easyui-combobox" panelHeight="auto" style="width:100px">  
	                <option value="-1">请选择</option>  
	                <option value="1">已发送开班信息</option>  
	                <option value="0">未发送开班信息</option>  
	            </select>  
			</label> 
            <a class="easyui-linkbutton" iconCls="icon-search" onclick="searchEnroll()">查询</a>  
       	  <a id="loadpdf" onclick="loadpdf()" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出pdf文件</a>
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
$(function(){
//显示学生报名信息的数据表格
	$('#studentinfo').edatagrid({
			url : 'stu_selectAll', //查询时加载的URL
			updateUrl : 'stu_update',
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
			onLoadSuccess: function(data){//加载完毕后获取所有的checkbox遍历
	            if (data.rows.length > 0) {
	                //循环判断操作为新增的不能选择
	                for (var i = 0; i < data.rows.length; i++) {
	                    //根据s_status让某些行不可选
	                    if (data.rows[i].s_status == 1) {
	                        $("input[type='checkbox']")[i + 1].checked = false;
	                    }
	                }
	            }
	        }, 
            /* onSelectAll : function(rows) {  
                //根据status值  全选时某些行不选中  
                $.each(rows, function(i, n) {  
                    if (n.s_status == "1") {  
                   	 	$('#studentinfo').datagrid('unselectRow', rowIndex);  
                    }  
                });  
            } , */
			striped : true,//设置为true将交替显示行背景
			singleSelect:false,
			columns : [ [ 
			{
				/* field : 'ck',
				title : '全选',
				width : 10,
				align : 'center',
				checkbox:true */
				field:'ck',
				checkbox:true,
				formatter:function(value,row,index){				
						return row;
				}
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
				editor : {
					type : 'validatebox',
					options : {
						required : true,
						validType:'CHS'
					}
				},
			}, {
				field : 's_tel',
				title : '手机号',
				width : 100,
				align : 'center',
				editor : {
					type : 'validatebox',
					options : {
						required : true,
						validType:'mobile'
					}
				},
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
				styler:cellStyler,
				align : 'center',
				formatter : function(value, rowData, index) { //value：当前列的值、rowData当前行的值、rowIndex：当前行的索引
					//必须返回一个字符串、用于替换被加formatter的单元格。
					if (value == 0) {
						return '未发送';
					}
					if(value==1) {
						return '已发送';
					}
				}
			} ] ],
			//定义按钮
			toolbar : "#tb"
	});
	//$(".datagrid-toolbar").append($("#tb"));
});
function cellStyler(value,row,index){
	if (value > 0){
		return 'color:red;';
	}
}
//根据条件查询学生报名信息
function searchEnroll(){
	var direction=$("#stu_direction").combobox('getValue');//获取意向课程
	var status=$("#status").combobox('getValue')//获取是否发送了开班信息 
	if(direction==''&&status==-1){
		$.messager.alert("提示", "未选择查找条件！！！");
	}
	$('#studentinfo').datagrid({
		url:'stu_selectByTag',
		queryParams: {
			direction:direction,
			status:status
		},
		onLoadSuccess: function (data) {a
            if (data.rows.length == 0) {
                $.messager.alert("提示", "未找到相关记录");
            }
       },
	});
}
//发送开班信息
function sendclsinfo() {
	var oc_time=$('#oc_time').datebox("getValue");
	var address=$('#address').val();
	var s_direction=$('#studentinfo').datagrid('getSelected').s_direction;
	var planIds = new Array();
	var tels = new Array();
	var names = new Array();
	var rows = $('#studentinfo').datagrid('getSelections');
	for(var i=0; i<rows.length; i++){
		planIds.push(rows[i].s_id);
		tels.push(rows[i].s_tel);
		names.push(rows[i].s_name);
	}
	if(oc_time==null||address==null||planIds==null||tels==null||names==null){
		$.messager.alert("错误提示", "您的操作有误，请确认后再次操作");
	}
	$.messager.confirm('提示','您确定要发送短信到学生手机吗？',function(r) {
		if (r) {
			$.ajax({
					cache : false,
					type : "post",//使用get方法访问后台
					dataType : "json",//返回json格式的数据
					url : "sendclsinfo",//要访问的后台地址
					data : {planIds:planIds,tels:tels,names:names,oc_time:oc_time,address:address,s_direction:s_direction},//要发送的数据
					success : function(data) {//msg为返回的数据，在这里做数据绑定
						if(data==0){
							$.messager.alert("提示", "发送失败");
						}else{
							$.messager.show({title:'温馨提示',msg:'发送成功！',timeout:2000,showType:'slide'});
							$('#address').text('');
							$('#oc_time').combo('setText','');  
							$('#studentinfo').datagrid('reload');
						}
					}
				});
		}
	});
}

//导出为pdf文件
function loadpdf(){
	var planids=new Array();
	var names=new Array();
	var tels=new Array();
	var classess=new Array();
	var rows=$('#studentinfo').datagrid('getSelections');
	for(var i=0;i<rows.length;i++){
		planids.push(rows[i].s_id);
		names.push(rows[i].s_name);
		tels.push(rows[i].s_tel);
		classess.push(rows[i].s_direction);
	}
	$.ajax({
		cache:false,
		type:"post",
		dataType:"json",
		url:"loadpdf",
		data:{
			planids:planids,
			names:names,
			tels:tels,
			classess:classess
		},
		success:function(data){
			if(data==1){
				$.message.alert("提示","发送成功");
			}else{
				$.message.alert("提示","发送失败");
			}
		}
	})
	
		
	
	
}
//自定义表单验证规则
$.extend($.fn.validatebox.defaults.rules, {   
	//验证汉字
    CHS: {
        validator: function (value) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '只能输入汉字'
    },
    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '输入手机号码格式不准确.'
    }
});  
</script>