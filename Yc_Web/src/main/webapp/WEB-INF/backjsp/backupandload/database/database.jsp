<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	<div style="padding:10px; border:5px solid #dadada;">
	<!--<h1>&nbsp;地址:</h1>
	<input class="path" name="path" placeholder="请输入您要备份到的地址"/>
		<h2>&nbsp;文件名:</h2>
		<input class="file" name="file" placeholder="请输入您要备份的文件名"/>
	<a href="javascript:void(0);" onclick="backup()" name="backup" id="backup" >开始备份</a>
	  -->
	  <form method='post' name=myform>
选择操作：<INPUT TYPE='radio' NAME='act' id='act_backup' value='backup' onclick="see()"><label for=act_backup>备份</label>　
<INPUT TYPE='radio' NAME='act' id='act_restore' value='load' onclick="nosee()"><label for=act_restore>恢复</label>
<br>文件路径：<INPUT TYPE='text' NAME='path' value='D:'>(备份或还复的文件路径)<br>
<div id="files" style="display: none;">&nbsp;&nbsp;文件名：
		<input class="file" name="file" placeholder="请输入您要备份的文件名"  />
</div >
	<a class="easyui-linkbutton c6" href="javascript:void(0);" iconCls="icon-ok" onclick="backup()" name="backup" id="backup" >确定</a>

</form>
	  </div>
<script>
 function see(){
	 document.getElementById("files").style.display='block';

 }
 function nosee(){
	 document.getElementById("files").style.display='none';

 }
function backup(){
	var radios=document.getElementsByName("act");
	var d=$('input[name="path"]').val();
	var file=$('input[name="file"]').val();
	var a=false;
	for(var i=0;i<radios.length;i++){
		if(radios[i].checked==true){
			alert(2);
			a=true;
			alert(a);
			if(radios[i].value=="backup"){
				$.ajax({
					url:'backupdatabase',
					type:'post',
					data:{
						path:d,
						file:file
					},
					success:function(data){
								if(data==0){
									$.messager.alert('提示', '备份失败！');
								}else if(data==1){
								$.messager.alert('提示', '备份成功！');
								}
							
						
					},error:function(data){
						$.messager.alert('提示', '系统出现错误请与管理员联系！');
					}
				});
			}else if(radios[i].value=="load"){
				alert("数据库还原");
			}
		}
	}
	if(a==false){
		$.messager.alert('提示', '请选择您要进行的操作！');
	}
	
}
</script>