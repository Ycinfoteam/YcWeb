<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div data-options="region:'west',title:'操作菜单',split:true"
	style="width: 40%; float: left; height: 100%">
	<div id="aa" class="easyui-accordion" data-options="fit:true">
		<div title="皮肤选择">
			<div id="tt3" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="changeform1" style="width:100%">
					<table  style="width:100%">
						<tbody>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td style="width:30%;text-align: center;">选择风格：</td>
							<td width=30%>
								<input type="radio" id="1"
									name="changetype" value="resource">原始风格 
								<br/>
								<input type="radio" id="2" 
									name="changetype" value="red">红色画风
								<br/>
								<input type="radio" id="3" 
									name="changetype" value="blue">炫酷蓝
								<br/>
								<input type="radio" id="4" 
									name="changetype" value="gray">低调灰谐
							</td>
							<td width=30%>&nbsp;</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
						
							<td colspan="3" style="text-align: center"><span>更多风格还在研发，尽请期待哦~</span></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2"><input type="button" onclick="showChange(1)"
								value="预览" /> <input type="button" onclick="saveChange(1)"
								value="保存" /></td>
						</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<div style="float: left; width: 60%;">
	<iframe id="view" src="yyyback/model/view.jsp" frameborder="0"
		width="100%" height="100%" scrolling="yes" marginwidth="0"></iframe>
</div>
<script type="text/javascript">
	function myload() {
		//加载层-风格2
		layer.load();
		//此处演示关闭
		setTimeout(function() {
			layer.closeAll('loading');
		}, 2500);
	}
	$(function(){
  		myload();
	});
	function showChange(id) {
//		showView(id);
		$.post("changeView_updateType.action", $("#changeform1").serialize(),
			function(data) {
			alert(data);
			data = parseInt(data);
			if (data > 0) {
		  		myload();
				$("#view").src = "yyyback/model/view.jsp";
			} else {
				$.messager.alert('失败提示', '预览失败，请稍后重试...',
						'error');
			}
		},"json");
	}
	function saveChange(id) {
		showChange(id);
		$.post("changeSave_updateType.action", $("#changeform1").serialize(),
			function(data) {
				data = parseInt(data);
				if (data > 0) {
			  		myload();
					$("#view").src = "yyyback/model/view.jsp";
				} else {
					$.messager.alert('失败提示', '预览失败，请稍后重试...',
						'error');
				}
			}, "json");
	}
</script>