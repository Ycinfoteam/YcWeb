<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="backjs/ckeditor.js"></script>
 <link type="text/css" rel="stylesheet" href="backcss/icon.css"/>
<!--第二步：引入easyui皮肤样式 themes/default/easyui.css    images文件夹拷贝-->
<link type="text/css" rel="stylesheet" href="backcss/easyui.css"/>
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
   
   <table id="jobdetailsdg">
</table>
<!-- 修改界面 -->
<div id=updateFiles class="easyui-dialog" style=" display:none;" closed="true" buttons="#ppiclg-buttons">
<form id="jdpicfm" method="post" enctype="multipart/form-data" novalidate>
       <div class="fitem">	
        <label>重新上传图片:</label>	
        <input type="hidden" name="jd_id" id="jdid" />
        	<input id="jd_pic" name="jd_pic" type="file" />
        	<img id="updatejdpicview" src="" style="width:100px;height:100px; display:none "/>
        	</div>
			<div class="fitem">
			<label></label>
        	  <p id="buttons">
        </p>
     </div>
</form>
</div>
<!-- 添加界面 -->
<div id="joblg" class="easyui-dialog"
	 style=" display:none; width: 1070px; height: 480px;padding: 10px 20px" closed="true"  buttons="#fooddlg-buttons">
	<div class="ftitle">
		
	</div>
	<form id="jobfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				学员名字:
			</label>
			<input name="jd_name" class="easyui-textbox" required="true" validType="nameRex"></input>
			</div>
			<div class="fitem">
			<label>
				学员薪资:
			</label>
			<input name="jd_salary" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				就业时间:
			</label>
			<input name="jd_emptime" class="easyui-textbox" ></input>
		
			</div>
			<div class="fitem">
			<label>
				就业地址:
			</label>
			<input name="jd_palace" class="easyui-textbox" required="true" validType="nameRex"></input>
		</div>
			<div class="fitem">
			<label>
				所在公司:
			</label>
			<input name="jd_company" class="easyui-textbox" required="true" validType="nameRex"></input>
		</div>
		
		<div class="fitem">
			<label>
				毕业学校:
			</label>
			<input name="jd_school" class="easyui-textbox" required="true" validType="nameRex"></input>
		</div>
		<div class="fitem">
			<label>
				专业:
			</label>
			<input name="jd_profession" class="easyui-textbox" required="true"></input>
		</div>
		<div class="fitem">
			<label>
				照片:
			</label>
			<input id="ajd_pic" name="jd_pic" type="file" onChange="prejdpic(this)" />
		<img id="addjdpicview" src="" style="width:100px;height:100px;display:none"/>
		</div>
	</form> 
</div>
<!-- 修改界面按钮 -->
<div id="ppiclg-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		 iconCls="icon-ok"  onclick="updatejob()"
		style="width: 90px">Save</a>
	<a class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#updateFiles').dialog('close')"
		style="width: 90px">Cancel</a>
</div>
<!-- 添加界面按钮 -->
<div id="fooddlg-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		 iconCls="icon-ok"  onclick="saveHonor()"
		style="width: 90px">Save</a>
	<a class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#joblg').dialog('close')"
		style="width: 90px">Cancel</a>
</div>

<!-- 图片 -->
<div id="showjdpic" class="easyui-dialog" 
	style="width: 650px; height: 450px; padding: 10px 20px;display:none" closed="true">
	<img id="jdpic" style="width:580px;height:400px;"/>
	
</div>
<script type="text/javascript" src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" src="backjs/jquery.form.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>

<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#jobdetailsdg').edatagrid({
		  	url: "jobdetails",	//查询时加载的URL
            saveUrl: "jobdetails_add",
            updateUrl: "jobdetails_update", 
            destroyUrl: "jobdetails_delete",
            loadMsg:'正在加载信息...',
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"学员就业管理",
        	iconCls:"icon-save",//图标
        	idField:"jd_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"jd_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"desc",	//排序方式
        	singleSelect:false,

        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	striped:true,
        	columns:[[
		{
 				field:'jd_id',
 				title:'项目名',
 				width:100,
 				align:'center',
           	 	hidden:'true'

 				}, 
        	{
           	 	field:'jd_name',
           	 	title:'学员名字',
           	 	width:100,
           	 	align:'center',
           	 	editor:{
           	 		type:'validatebox',
           	 		options:{
           	 			required:true,
           	 		}
           		},
           	 	
           	 },
           	 {
           	 	field:'jd_salary',
           	 	title:'学员薪资',
           	 	width:100,
           	 	align:'center',
           	 editor:{
           		type:'validatebox',
    	 		options:{
    	 			required:true,
    	 		}
        		},
           	 },
           	 {
            	 	field:'jd_emptime',
            	 	title:'就业时间',
            	 	width:100,
            	 	align:'center',
            	 editor:{
            		type:'datebox',
     	 		options:{
     	 			required:true,
     	 		}
         		},
            	 },
             	 {
             	 	field:'jd_palace',
             	 	title:'就业地址',
             	 	width:100,
             	 	align:'center',
             	 editor:{
             		type:'validatebox',
      	 		options:{
      	 			required:true,
      	 		}
          		},
             	 },
            	 {
                	 	field:'jd_company',
                	 	title:'所在公司',
                	 	width:100,
                	 	align:'center',
                	 editor:{
                		type:'validatebox',
         	 		options:{
         	 			required:true,
         	 		}
             		},
                	 },{
            	 	field:'jd_school',
               	 	title:'毕业学校',
               	 	width:100,
               	 	align:'center',
               	editor:{
         	 		type:'validatebox',
         	 		options:{
         	 			required:true,
         	 		}
         		},
            	 },	
               	 	
            {
         	 	field:'jd_profession',
           	 	title:'专业',
           	 	width:100,
           	 	align:'center',
           	 editor:{
        	 		type:'validatebox',
        	 		options:{
        	 			required:true,
        	 		}
        		},
            },
            {
               	 	field:'jd_pic',
               	 	title:'照片',
               	 	width:100,
               	 	align:'center',
               	 formatter : function(value, row, index) {
               		
               		if(value!=null && value!=''){
						return '<a href="javascript:void(0)" onclick="showjdpic()">查看图片</a>';
					}else{
						return '无图片';
					}
	      	 	}},
     				 {
                   	 	field:'cx',
                   	 	title:'图片操作',
                   	 	width:100,
                   	 	align:'center',
                   	 formatter : function(value, row, index) {
                   		return '<a href="javascript:updatepic('+row.jd_id+')">修改图片</a>';
         				}}, {
							field : 'jd_status',
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
								}
							}
						} ,
						
           	
           	 ]],
           	 
           	 //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler : function() {$('#joblg').dialog({
					title:'添加学员就业',
					width : 400,
					height : 550,
					closed : false,
					cache : false,
					modal:true
						}
				);$('#jobfm').form('clear');

				}
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#jobdetailsdg').edatagrid('destroyRow');
					$('#dg').edatagrid('loadData')
				}
			},'-',{
				text:"保存",
				iconCls: 'icon-save',
				handler: function(){
					$('#jobdetailsdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#jobdetailsdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	
    	
    });
	//添加图片预览
	function prejdpic(file){
		var objUrl = getObjectURL(file.files[0]) ;
		document.getElementById("addjdpicview").style.display='block';
		if (objUrl) {
			$("#addjdpicview").attr("src", objUrl) ;
		}
	}
//图片预览
$("#jd_pic").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	document.getElementById("updatejdpicview").style.display='block';
	if (objUrl) {
		$("#updatejdpicview").attr("src", objUrl) ;
	}
}) ;
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
//查看图片
function showjdpic(){
	var jd_pic=$('#jobdetailsdg').datagrid('getSelected').jd_pic;
	var jd_name=$('#jobdetailsdg').datagrid('getSelected').jd_name;
	jd_pic=jd_pic.replace(",","");
	jd_pic=jd_pic.substring(22);

	$("#jdpic").attr("src","../"+jd_pic);
		$('#showjdpic').dialog('open').dialog('setTitle',jd_name);
	
}
//添加图片
	  function saveHonor(){
		  if ($("#ajd_pic").val() == "") {
				$.messager.alert('提示', '请选择一个图片文件，再点击添加');
				return;
			}
	$("#jobfm").submit();
			
		}
		//添加图片的表单提交
		$("#jobfm").form({
			url : "jobdetails_add",
			success : function(data) {
				if(data==1){
					$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
				}else{
					$.messager.alert('错误提示', '添加失败！');
				}
		
				$('#joblg').dialog('close');
				$("#jobfm").form('clear');
				$('#jobdetailsdg').edatagrid('load');
			},error :function(data){
				$.message.alert('温馨提示','系统出错请与管理员联系')
			}
			
		},'json');

		function updatepic(id){
			$('#updateFiles').dialog({
				title:'修改学员图片',
				width :350,
				height : 280,
				closed : false,
				cache : false,
				queryParams : {
					jd_id : id
				}
					}
			);
		}
		//修改图片
			function updatejob() {
				var options=$('#updateFiles').dialog('options');
				var jd_id=options.queryParams.jd_id;
		if (undefined == jd_id) {
			$.messager.alert('提示', '未选中信息');
			return;
		}
		if ($("#jd_pic").val() == "") {
			$.messager.alert('提示', '请选择一个图片文件，再点击修改');
			return;
		}
		$("#jdid").val(jd_id);
		$("#jdpicfm").submit();
		}
		
		
		$("#jdpicfm").form({
			url : "updatejdpic",
			success : function(data) {
				if(data==1){
					$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
				}else{
					$.messager.alert('错误提示', '添加失败！');
				}
				$('#updateFiles').dialog('close');
				$('#jobdetailsdg').edatagrid('load');
			},error :function(data){
				$.message.alert('温馨提示','系统出错请与管理员联系')
			}
			
		},'json');
		//自定义表单验证规则
		$.extend($.fn.validatebox.defaults.rules, {   
			 nameRex:{
			    	validator: function(value, param){  
			        	var reg=/^[\u4E00-\u9FA5A-Za-z]+$/;//只允许英文，中文的组合
			        	if(reg.test(value)){
			        		return true;
			        	}
			        },   
			        message: '请输入英文或中文的姓名！' 
			    } 
			    
			}); 
		
		//设置jd_emptime为databox样式
	  $('input[name="jd_emptime"]').datebox({
			required:true
		});
</script>
