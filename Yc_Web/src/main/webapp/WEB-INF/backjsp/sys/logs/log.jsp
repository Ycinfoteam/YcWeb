<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%
String logs="/logs/yc.log";
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+logs;
%>
    <base href="<%=basePath%>">
	<div style="padding:10px; border:5px solid #dadada;">
	<hl>&nbsp;请选择您要查询的日志日期:</hl>
	<input class="date" name="date" placeholder="请输入您要查询的日志日期"/>
	<a href="javascript:void(0);" onclick="showLog()" name="log" id="log" >查看日志</a>
	</div>
	<!--<div id="see" style="display:none">
	<a href="javascript:void(0);" name="see" id="see" >去看看</a> 
	</div>  -->
	<div class=" gb_details" style=" width:500px;  padding:10px; border-left:5px solid #dadada;" >
                                    	
                                    </div>
<script type="text/javascript">
	function showLog(){
		var d=$('input[name="date"]').val();
		$.ajax({
			url:'tologs',
			type:'post',
			data:{
				date:d
			},
			success:function(data){
				$('div.gb_details').empty('');
					if(data!=null){
						if(data==0){
							$('div.gb_details').append("查无此日志文件");	
						}else{
						//$.messager.alert('提示', '下载成功！');
						//document.getElementById("see").style.display='block';
						$('div.gb_details').append(data);
						//$('a[name="see"]').attr("href",data);
						}
					}
				
			},error:function(data){
				$.messager.alert('提示', '系统出现错误请与管理员联系！');
			}
		});
		
	}
	$('input[name="date"]').datebox({
		required : true
	});	

</script>
 
