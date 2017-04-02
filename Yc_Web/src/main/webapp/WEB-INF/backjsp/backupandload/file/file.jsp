<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
	<div style="padding:10px; border:5px solid #dadada;">
	  <form method='post' name=form>
选择操作：<INPUT TYPE='radio' NAME='radios' id='act_backup' value='backup' onclick="back()"><label for=act_backup>备份</label>
<INPUT TYPE='radio' NAME='radios' id='act_restore' value='load' onclick="noback()"><label for=act_restore>恢复</label>
<div id="path" style="display:none;">
文件路径：<INPUT TYPE='text' NAME='filepath' value='D:' >(备份的新文件路径)<br>
</div>
<div id="paths" style="display:none;">
文件路径：<INPUT TYPE='text' NAME='filepaths' value='D:' >(备份文件夹所在路径)<br>
</div>
		文件类型：<INPUT TYPE='radio' NAME='filetype' id='act_pic' value='pic' onclick="backpic()"><label for=act_pic>图片文件</label>　
		<INPUT TYPE='radio' NAME='filetype' id='act_rizhi' value='log' onclick="backpic()"><label for=act_rizhi>日志文件</label>
<div id="pic" style="display: none;">请选择日期,不选择则视为全部还原
			<input class="datebox"  placeholder="请输入您要查询的日志日期" name="date" style="width:100px;"/><br/>
</div>
	<a  class="easyui-linkbutton c6"  iconCls="icon-ok"  onclick="backup()" name="backup" id="backup" >确定</a>

</form>
	  </div>
<script>
//改变P_time
$('input[name="date"]').datebox({
	required : true
});	
//如果某radio被点击触发的事件
function back(){
	 document.getElementById("path").style.display='block';
	 document.getElementById("pic").style.display='none';
	 document.getElementById("paths").style.display='none';

}
function noback(){
	 document.getElementById("path").style.display='none';
		 document.getElementById("pic").style.display='block';
		 document.getElementById("paths").style.display='block';

}
function backpic(){
	if(document.getElementById("act_restore").checked==true){
	 document.getElementById("pic").style.display='block';
	}

}
//备份操作
function backup(){
	//操作的按钮
	var radios=document.getElementsByName("radios");
	//操作的类型按钮
	var typeradio=document.getElementsByName("filetype");
	var d=$('input[name="filepath"]').val();
	var ds=$('input[name="filepaths"]').val();
	var date=$('input[name="date"]').val();
	var a=false;
	var b=false;
	for(var i=0;i<radios.length;i++){
		if(radios[i].checked==true){
			a=true;
			if(radios[i].value=="backup"){
				for(var j=0;j<typeradio.length;j++){
					if(typeradio[j].checked==true){
						b=true;
						if(typeradio[j].value=="log"){
							$.ajax({
							url:'backuplog',
							type:'post',
							data:{
								path:d,
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
						}else if(typeradio[j].value=="pic"){
							alert("图片文件备份");
							$.ajax({
								url:'backuppic',
								type:'post',
								data:{
									path:d,
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
						}
					}
				}
			}else if(radios[i].value=="load"){
				for(var j=0;j<typeradio.length;j++){
					if(typeradio[j].checked==true){
						b=true;
						if(typeradio[j].value=="log"){
							$.ajax({
								url:'loadlog',
								type:'post',
								data:{
									path:ds,
									date:date
								},
								success:function(data){
											if(data==0){
												$.messager.alert('提示', '还原失败！');
											}else if(data==1){
											$.messager.alert('提示', '还原成功！');
											}else if(data==3){
												$.messager.alert('提示', '该日期文件未备份！');
											}else if(data==4){
												$.messager.alert('提示', '当天的文件无法还原，若您今天已备份，请于明天还原或选择全部还原！');
											}
								},error:function(data){
									$.messager.alert('提示', '系统出现错误请与管理员联系！');
								}
							});
						}else if(typeradio[j].value=="pic"){
							alert("还原图片")
							for(var j=0;j<typeradio.length;j++){
								if(typeradio[j].checked==true){
									b=true;
									if(typeradio[j].value=="pic"){
										$.ajax({
											url:'loadpic',
											type:'post',
											data:{
												path:ds,
												date:date
											},
											success:function(data){
														if(data==0){
															$.messager.alert('提示', '还原失败！');
														}else if(data==1){
														$.messager.alert('提示', '还原成功！');
														}else if(data==3){
															$.messager.alert('提示', '该日期文件未备份！');
														}
											},error:function(data){
												$.messager.alert('提示', '系统出现错误请与管理员联系！');
											}
										});
						}
					}
				}
			}
		}
	}
			}
		}
		}
				
	if(a==false){
		$.messager.alert('提示', '请选择您要进行的操作！');
	}
	if(b==false){
		$.messager.alert('提示','请选择操作的文件类型')
	}
	
}
</script>