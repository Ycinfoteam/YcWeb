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
li{list-style:none}
a{text-decoration:none}
.activities_pic{width:580px;height:400px;position:relative;overflow:hidden}
.activities_pic .pic{width:9999px;height:400px}
.activities_pic .pic li{width:580px;height:400px;float:left}

.activities_pic .lr .pre{width:20px;height:50px;float:left;background:none repeat scroll 0px 0px rgba(1, 0, 0, 0.6);text-align:center;line-height:50px;cursor:pointer}
.activities_pic .lr .next{width:20px;height:50px;float:right;background:none repeat scroll 0px 0px rgba(1, 0, 0, 0.6);text-align:center;line-height:50px;cursor:pointer}

.activities_pic .lr{width:580px;height:40px;position:absolute;top:200px;display:none}
.activities_pic .lr a{color:white}
#p{float:left}
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
       <table id="acdg">
</table>
<!-- 修改图片界面 -->
<div id=updateacp class="easyui-dialog" style=" display:none;" closed="true" buttons="#acpiclg-buttons">
<form id="acpicfm" method="post" enctype="multipart/form-data" novalidate>
       <div class="fitem">	
        <label>重新上传图片:</label>	
        	<input type="hidden" name="ac_id" id="acid" />
        	<input id="ac_pic" name="ac_pic" type="file" multiple="multiple"/>
        	<!-- <img id="updateacpicview" src="" style="width:100px;height:100px; display:none "/>
        	 -->
        	  <div class="update activities_prepic">
                                    	
                                    </div>
        	  </div>
			<div class="fitem">
			<label></label>
        	  <p id="buttons">
        </p>
     </div>
</form>
</div>
<!-- 添加界面 -->
<div id="aclg" class="easyui-dialog"
	 style=" display:none; width: 1070px; height: 480px;padding: 10px 20px" closed="true"  buttons="#activities-buttons">
	<div class="ftitle">
		
	</div>
	<form id="acfm" method="post" enctype="multipart/form-data" novalidate>
		<div class="fitem">
			<label>
				活动说明:
			</label>
			<input name="ac_illus" class="easyui-textbox" required="true"></input>
			</div>
		<div class="fitem">
			<label>
				活动时间:
			</label>
			<input name="ac_time" class="easyui-textbox" required="true"></input>
			</div>
			<div class="fitem">
			<label>
				活动图片:
			</label>
			<input id="aac_pic" name="ac_pic" type="file" multiple="multiple" onchange="preacpic(this)"/>
			 <div class="update activities_addpic">
                                    	
                                    </div>
		</div>
	</form> 
</div>
<!-- 修改图片按钮 -->
<div id="acpiclg-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		 iconCls="icon-ok"  onclick="updateactivites()"
		style="width: 90px">Save</a>
	<a class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#updateacp').dialog('close')"
		style="width: 90px">Cancel</a>
</div>
<!-- 添加按钮 -->
<div id="activities-buttons"  style=" display:none;">
	<a  class="easyui-linkbutton c6"
		iconCls="icon-ok" onclick="saveactivities()" style="width: 90px">Save</a>
	<a  class="easyui-linkbutton"
		iconCls="icon-cancel" onclick="javascript:$('#aclg').dialog('close')"
		style="width: 90px">Cancel</a>
		</div>
		<!-- 图片 -->
<div id="showacpic" class="easyui-dialog" 
	style="width: 650px; height: 450px; padding: 10px 20px;display:none" closed="true">
	<!--<img id="acpic" style="width:580px;height:400px;"/>  -->
	  <div class="update activities_pic">
                                    	
                                    </div>
	
</div>
<script type="text/javascript" src="backjs/jquery.edatagrid.js"></script>
<script type="text/javascript" src="backjs/jquery.form.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	
	var datagrid;
	var rowEditor=undefined;	//用于存放当前要编辑的行
	$(function(){
	   datagrid=$('#acdg').edatagrid({
		  	url: "activities",	//查询时加载的URL
            saveUrl: "activities_add",
            updateUrl: "activities_update", 
            destroyUrl: "activities_delete",
            loadMsg:'正在加载活动信息...',
        	pagination:true,	//显示分页
        	pageSize:5,		//默认分页的条数
        	pageList:[5,10,15,20,25,30,35,40,45,50],	//可选分页条数
        	fitColumns:true,	//自适应列
        	fit:true,	//自动补全
        	title:"公司活动管理",
        	iconCls:"icon-save",//图标
        	idField:"ac_id",	//标识，会记录我们选中的一行的id，不一定是id，通常都是主键
        	rownumbers:"true",	//显示行号
        	nowrap:"true",	//不换行显示
        	sortName:"ac_id",	//排序的列  这个参数会传到后台的servlet上，所以要有后台对应的接收
        	sortOrder:"desc",	//排序方式
        	singleSelect:false,
        	//以上的四种增删改查操作，只要失败，都会回掉这个onError
        	onError:function(a,b){
        		$.messager.alert("错误","操作失败");
        	},
        	columns:[[
        	{
           	 	field:'ac_id',
           	 	title:'编号',
           	 	width:100,
           	 	align:'center',
           	 	hidden:'true'
           	 },{
           	 	field:'ac_illus',
           	 	title:'活动说明',
           	 	width:100,
           	 	align:'center',
           	 editor:{
        	 		type:'validatebox',
        	 		options:{
        	 			required:true,
        	 		}
        		},
           	 },{
            	 	field:'ac_time',
               	 	title:'活动时间',
               	 	width:100,
               	 	align:'center',
               	 	editor:{
               	 		type:'datebox',
               	 		options:{
               	 			required:true,
               	 		}
               		},
               	 	
               	 },{
           	 	field:'ac_pic',
           	 	title:'活动图片',
           	 	width:100,
           	 	align:'center',
           	 formatter : function(value, row, index) {
           		if(value!=null && value!=''){
					return '<a href="javascript:void(0)" onclick="showacpic()">查看图片</a>';
				}else{
					return '无图片';
			}
           	 },           		},{
               	 	field:'cx',
               	 	title:'操作',
               	 	width:100,
               	 	align:'center',
               	 formatter : function(value, row, index) {
               		return '<a href="javascript:updateactivitespic('+row.ac_id+')">修改图片</a>';
     				}},
       	
           	 ]],
           	 
           	 //定义按钮
	         toolbar: [{
	         	text:"增加",
				iconCls: 'icon-add',
				handler : function() {$('#aclg').dialog({
					title:'添加公司活动',
					width : 400,
					height : 550,
					closed : false,
					cache : false,
					modal:true
						}
				);$('#acfm').form('clear');
				}
			},'-',{
				text:"删除",
				iconCls: 'icon-remove',
				handler: function(){
					$('#acdg').edatagrid('destroyRow');
					$('#dg').edatagrid('loadData')
				}
			},'-',{
				text : "保存",
				iconCls : 'icon-save',
				handler : function() {
					$('#acdg').edatagrid('saveRow')
				}
			},'-',{
				text:"取消编辑",
				iconCls: 'icon-undo',
				handler: function(){
					$('#acdg').edatagrid('cancelRow')
				}
			}]
			
    	});
    	
    	
    });
	//添加照片预览
	function preacpic(file){
		$('div.activities_addpic').empty('');
		for(var i=0;i<file.files.length;i++){
			var objUrl = getObjectURL(file.files[i]) ;
			if(objUrl){
				$('div.activities_addpic').prepend(
						'<img class="lazyload" height="200" width="200" src="'+objUrl+'"visibility="hidden"">');	
			}
		}
	}
	
	
	//修改照片预览
$("#ac_pic").change(function(){
	$('div.activities_prepic').empty('');
	for(var i=0;i<this.files.length;i++){
		var objUrl = getObjectURL(this.files[i]) ;
		if(objUrl){
			$('div.activities_prepic').prepend(
					'<img class="lazyload" height="200" width="200" src="'+objUrl+'"visibility="hidden"">');	
		}
	}
	document.getElementById("updateacpicview").style.display='block';
	
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
function showacpic(){
	var ac_pic=$('#acdg').datagrid('getSelected').ac_pic;
	var ac_illus=$('#acdg').datagrid('getSelected').ac_illus;
	var a_pic=ac_pic.split(",");
	$('div.activities_pic').empty('');
	$('div.activities_pic').append('<ul class="anniu"><li class="on"></li></ul><ul class="pic">');

	for(var i=0;i<a_pic.length-1;i++){
		a_pic[i]=a_pic[i].substring(22);
		$('div.activities_pic').prepend(
				'<li><a><img class="lazyloads" height="400" width="580" src="../'+a_pic[i]+'"visibility="hidden""></a></li>');
	}
	$('div.activities_pic').append('</ul><ul class="lr"><li class="pre"><a> < </a></li>'+
		      '<li class="next"><a>></a></li>'+
		    '</ul>');
	
	

	var images =document.getElementsByClassName('lazyloads');
    var pos = 0;
    var len = images.length;
    
    //鼠标滑过banner，左右按钮进行显示和隐藏
    $(".activities_pic").hover(function(){
      $(".lr").show();
    },function(){
      $(".lr").hide();
    });
  //点击左右按钮，图片进行切换效果
    $(".pre").click(function(){
    	 images[pos].style.display = 'none';
    	
          pos--;
          var i=pos+1;
          if(pos<0){
        	  alert('没有更多图片了,将回到第'+len+'张');
          }else{
        	 // alert('第'+i+'张/共'+len+'张');
          }
          pos=(pos+len)%len;
         images[pos].style.display = 'inline';
         
    });
    $(".next").click(function(){
      images[pos].style.display = 'none';
      pos++;
      var i=pos+1;
      if(pos>=len){
    	  alert('没有更多图片了,将回到第一张');
      }else{
    	 // alert('第'+i+'张/共'+len+'张');
      }
      pos=pos%len;
      images[pos].style.display = 'inline';
    });
		/*setInterval(function(){
      images[pos].style.display = 'none';
      pos = ++pos == len ? 0 : pos;
      images[pos].style.display = 'inline';
    },2000);
	*/
	$('#showacpic').dialog('open').dialog('setTitle',ac_illus+'---共'+len+'张');
	
}
	function updateactivitespic(id){
		$('#updateacp').dialog({
			title:'修改项目图片',
			width : 450,
			height : 300,
			closed : false,
			cache : false,
			queryParams : {
				ac_id : id
			}
				}
		);
	}
	function updateactivites(){
		if ($("#ac_pic").val() == "") {
			$.messager.alert('提示', '请选择一个图片文件，再点击修改');
			return;
		}
		var options=$('#updateacp').dialog('options');
		var ac_id=options.queryParams.ac_id;
		if(undefined==ac_id){
			$.messager.alert('提示','未选中信息');
		return;
		}	
		$("#acid").val(ac_id);
		$("#acpicfm").submit();
		
	}
	//修改图片的表单提交
	$("#acpicfm").form({
		url : "updateacpic",
		success:function(data){
			if(data==1){
				$.messager.show({title:'温馨提示',msg:'修改成功！',timeout:2000,showType:'slide'});
			}else{
				$.messager.alert('错误提示', '修改失败！');
			}
			$('#updateacp').dialog('close');
			$("#acpicfm").form('clear');
			$('#acdg').edatagrid('load');
		},error : function(data) {
			$.messager.alert('错误提示', '系统出现错误请联系管理员');
		}
	},'json');

	  function saveactivities(){
		  if ($("#aac_pic").val() == "") {
				$.messager.alert('提示', '请选择一个图片文件，再点击添加');
				return;
			}
			$("#acfm").submit();
		}
	  $("#acfm").form({
			url:"activities_add",
			success:function(data){
				if(data==1){
					$.messager.show({title:'温馨提示',msg:'添加成功！',timeout:2000,showType:'slide'});
				}else{
					$.messager.alert('错误提示', '添加失败！');
				}
				
				$('#aclg').dialog('close');
				$("#acfm").form('clear');
				$('#acdg').edatagrid('reload');
			},error : function(data) {
				$.messager.alert('错误提示', '系统出现错误请联系管理员');
			}
		},'json');
	  $('input[name="ac_time"]').datebox({
			required:true
		});
</script>
