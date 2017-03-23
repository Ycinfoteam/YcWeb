<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="companynewsllg" 
	style="width: 1070px; height: 480px; padding: 10px 20px" 
	buttons="#fooddlg-buttons">
	
	<div class="ftitle" id="nid">公司介绍修改</div>
		<form id="companynewsffm" method="post"
			action="yyyback/news_updateNews.action" >
			<table>
				<tr>
					<td colspan="2">
					<br />
						<div class="fitem">
							<label>详细:</label>
							<input type="hidden" name="id"  id="id"/>
							<textarea name="detail" id="alert_companynews_detail"></textarea>
							<font size="2">注：您的良好描述，将影响对该页面的访问量。</font>
						</div></td>
				</tr>
	
			</table>
		</form>
		</div>
		<div id="fooddlg-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton c6"
			iconCls="icon-ok" onclick="submitCompanyNewsForm()" style="width: 90px">sure修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#companynewsllg').dialog('close')"
			style="width: 90px">Cancel</a>
		</div>

</body>
</html>