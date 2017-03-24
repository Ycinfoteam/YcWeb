<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p style="padding-left: 10px;">页脚文字编辑</p>
	</div>
	<div>
		<!-- 加载编辑器的容器 -->
		<script id="container" name="content" type="text/plain"></script>
		<!-- 配置文件 -->
		<script type="text/javascript" src="utf8-jsp/ueditor.config.js"></script>
		<!-- 编码器源码文件 -->
		<script type="text/javascript" src="utf8-jsp/ueditor.all.min.js"></script>
		<!-- 实例化编辑器 -->
		<script type="text/javascript">
			var ue=null; 
			$(function() {
			ue = UE.getEditor('container');
				$.ajax({
					url : 'findDataDictionaryFooter',
					type : 'post',
					dataType : 'json',
					success : function(data) {
						ue.ready(function() {//编辑器初始化完成再赋值  
				            ue.setContent(data);  //赋值给UEditor  
				        });  
					}
				});
			});
			
			function save(){
				var footer=ue.getContentTxt();
				$.ajax({
					url:'updateFooter',
					type:'post',
					dataType:'json',
					data:{footer:footer},
					success:function(data){
						if(data==1){
							$.messager.show({
								title:'确认信息',
								msg:'页脚内容更新成功',
								timeout:5000,
								showType:'slide'
							});
						}else{
							$.messager.show({
								title:'确认信息',
								msg:'页脚内容更新失败,请稍后重试',
								timeout:5000,
								showType:'slide'
							});
						}
					}
				});
			}
			
		</script>
	</div>
	<div>
		<input type="button" value="保存" style="margin-left:1050px;margin-top:10px;"
			onclick="save()"/>
	</div>
	
</body>
</html>