<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div data-options="region:'west',title:'操作菜单',split:true"
	style="width: 40%; float: left; height: 100%">
	<div id="aa" class="easyui-accordion" data-options="fit:true">
		<div title="大图控制">
			<div id="tt3" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="jsmyform1">
					<table>
						<tr>
							<td>轮换风格：</td>
							<td>
								<input type="radio" id="bigpicMovestyle"
									name="bigpicMovestyle" value="left">向左 
								<input type="radio" id="bigpicMovestyle" 
									name="bigpicMovestyle" value="right">向右 
								<input type="radio" id="bigpicMovestyle" 
									name="bigpicMovestyle" value="up">向上
								<input type="radio" id="bigpicMovestyle" 
									name="bigpicMovestyle" value="down">向下
							</td>
						</tr>
						<tr>
							<td>切图时长：</td>
							<td><input type="number" id="bigpicIntervaltime"
								name=bigpicIntervaltime>s</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2"><input type="button" onclick="showJs(1)"
								value="预览" /> <input type="button" onclick="saveJs(1)"
								value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div title="序列按钮选项">
			<div id="tt3" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="jsmyform2">
					<table>
						<tr>
							<td>是否可用：</td>
							<td><input type="radio" id="bigpicIshasbtn"
								name="bigpicIshasbtn" value="true" onclick="isShowBtn(1)">显示
								<input type="radio" id="bigpicIshasbtn" name="bigpicIshasbtn"
								value="false" onclick="isShowBtn(0)">隐藏</td>
						</tr>
						<tbody id="btnstyle">
							<tr>
								<td>按钮背景:</td>
								<td><input id="bigpicBtnBgcolor" class="color"
									name="bigpicBtnBgcolor" value="FFFFFF" onclick="jscolor.init()">
								</td>
							</tr>
							<tr>
								<td>按钮hover:</td>
								<td><input id="bigpicBtnBghovercolor" class="color"
									name="bigpicBtnBghovercolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>字体颜色:</td>
								<td><input id="bigpicBtnFontcolor" class="color"
									name="bigpicBtnFontcolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>字体hover:</td>
								<td><input id="bigpicBtnFonthovercolor" class="color"
									name="bigpicBtnFonthovercolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>边框颜色:</td>
								<td><input id="bigpicBtnBordercolor" class="color"
									name="bigpicBtnBordercolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>边框hover:</td>
								<td><input id="bigpicBtnBorderhovercolor" class="color"
									name="bigpicBtnBorderhovercolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>边框宽度:</td>
								<td><input type="number" id="bigpicBtnBorderwidth"
									name="bigpicBtnBorderwidth"></td>
							</tr>
						</tbody>
						<tr>
							<td></td>
							<td colspan="2"><input type="button" onclick="showJs(2)"
								value="预览" /> <input type="button" onclick="saveJs(2)"
								value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div title="标题栏选项">
			<div id="tt3" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="jsmyform3">
					<table>
						<tr>
							<td>是否显示：</td>
							<td><input type="radio" id="bigpicIshastitlebar"
								name="bigpicIshastitlebar" value="true" onclick="isShowTitle(1)">显示
								<input type="radio" id="bigpicIshastitlebar" name="bigpicIshastitlebar"
								value="false" onclick="isShowTitle(0)">隐藏</td>
						</tr>
						<tbody id="titlestyle">
							<tr>
								<td>高度:</td>
								<td><input type="number" id="bigpicTitlebarHeight"
									name="bigpicTitlebarHeight"></td>
							</tr>
							<tr>
								<td>背景色:</td>
								<td><input id="bigpicTitlebarBgcolor" class="color"
									name="bigpicTitlebarBgcolor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>透明度:</td>
								<td><input type="number" id="bigpicTitlebarAlpha"
									name="bigpicTitlebarAlpha"></td>
							</tr>
							<tr>
								<td>字体大小:</td>
								<td><input type="number" id="bigpicTitlefontSize"
									name="bigpicTitlefontSize">px</td>
							</tr>
							<tr>
								<td>字体颜色:</td>
								<td><input id="bigpicTitlefontColor" class="color"
									name="bigpicTitlefontColor" value="FFFFFF"
									onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td>字体宽度:</td>
								<td>
									<select name="bigpicTitlefontWeight" id="bigpicTitlefontWeight">
										<option value="500">500</option>
										<option value="600">600</option>
										<option value="700">700</option>
										<option value="800">800</option>
										<option value="bold">粗体</option>
										<option value="normal">正常</option>
									</select>
								</td>
							</tr>
						</tbody>
						<tr>
							<td></td>
							<td colspan="2"><input type="button" onclick="showJs(3)"
								value="预览" /> <input type="button" onclick="saveJs(3)"
								value="保存" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div title="产品轮换选项">
			<div id="tt3" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="jsmyform4">
					<table>
						<tr>
							<td>第一行:</td>
							<td>
								<input type="radio" id="marquee1Direction"
									name="marquee1Direction" value="left">向左 
								<input type="radio" id="marquee1Direction" 
									name="marquee1Direction" value="right">向右
							</td>	
						</tr>
						<tr>
							<td>第二行:</td>
							<td>
								<input type="radio" id="marquee2Direction"
									name="marquee2Direction" value="left">向左 
								<input type="radio" id="marquee2Direction" 
									name="marquee2Direction" value="right">向右
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="2"><input type="button" onclick="showJs(4)"
								value="预览" /> <input type="button" onclick="saveJs(4)"
								value="保存" /></td>
						</tr>
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
	function isShowBtn(flag){
		if(flag==1){
			$("#btnstyle").css("display","");
		}else if(flag==0){
			$("#btnstyle").css("display","none");
		}
	}
	function isShowTitle(flag){
		if(flag==1){
			$("#titlestyle").css("display","");
		}else if(flag==0){
			$("#titlestyle").css("display","none");
		}
	}
	function myload() {
		//加载层-风格2
		layer.load();
		//此处演示关闭
		setTimeout(function() {
			layer.closeAll('loading');
		}, 2000);
	}
	$(function(){
  		myload();
  		$.post("jsSave_getAllJs.action",null,function(data){
  			if(data!=null && data!=undefined){
  				if(data.bigpicMovestyle=="left"){
  					$('input[name="bigpicMovestyle"]:radio').eq(0).attr('checked', 'true');
  				}else if(data.bigpicMovestyle=="right"){
  					$('input[name="bigpicMovestyle"]:radio').eq(1).attr('checked', 'true');
  				}else if(data.bigpicMovestyle=="up"){
  					$('input[name="bigpicMovestyle"]:radio').eq(2).attr('checked', 'true');
  				}else if(data.bigpicMovestyle=="down"){
  					$('input[name="bigpicMovestyle"]:radio').eq(3).attr('checked', 'true');
  				}
				$("#bigpicIntervaltime").val(data.bigpicIntervaltime);
				if(data.bigpicIshasbtn=="true"){
  					$('input[name="bigpicIshasbtn"]:radio').eq(0).attr('checked', 'true');
  					$("#btnstyle").css("display","");
				}else if(data.bigpicIshasbtn=="false"){
  					$('input[name="bigpicIshasbtn"]:radio').eq(1).attr('checked', 'true');
  					$("#btnstyle").css("display","none");
				}
				$("#bigpicBtnBgcolor").val(data.bigpicBtnBgcolor);
				$("#bigpicBtnBghovercolor").val(data.bigpicBtnBghovercolor);
				$("#bigpicBtnFontcolor").val(data.bigpicBtnFontcolor);
				$("#bigpicBtnFonthovercolor").val(data.bigpicBtnFonthovercolor);
				$("#bigpicBtnBordercolor").val(data.bigpicBtnBordercolor);
				$("#bigpicBtnBorderhovercolor").val(data.bigpicBtnBorderhovercolor);
				$("#bigpicBtnBorderwidth").val(data.bigpicBtnBorderwidth);
				if(data.bigpicIshastitlebar=="true"){
  					$('input[name="bigpicIshastitlebar"]:radio').eq(0).attr('checked', 'true');
  					$("#titlestyle").css("display","");
				}else if(data.bigpicIshastitlebar=="false"){
  					$('input[name="bigpicIshastitlebar"]:radio').eq(1).attr('checked', 'true');
  					$("#titlestyle").css("display","none");
				}
				$("#bigpicTitlebarHeight").val(data.bigpicTitlebarHeight);
				$("#bigpicTitlebarBgcolor").val(data.bigpicTitlebarBgcolor);
				$("#bigpicTitlebarAlpha").val(data.bigpicTitlebarAlpha);
				$("#bigpicTitlefontSize").val(data.bigpicTitlefontSize);
				$("#bigpicTitlefontColor").val(data.bigpicTitlefontColor);
				$("#bigpicTitlefontWeight").val(data.bigpicTitlefontWeight);
				if(data.marquee1Direction=="left"){
					$('input[name="marquee1Direction"]:radio').eq(0).attr('checked', 'true');
				}else if(data.marquee1Direction=="right"){
					$('input[name="marquee1Direction"]:radio').eq(1).attr('checked', 'true');
				}
				if(data.marquee2Direction=="left"){
					$('input[name="marquee2Direction"]:radio').eq(0).attr('checked', 'true');
				}else if(data.marquee2Direction=="right"){
					$('input[name="marquee2Direction"]:radio').eq(1).attr('checked', 'true');
				}
  			}
  		});
	});
	function showJs(id) {
	//	showJs(id);
		if(id==1){
			if($("#bigpicIntervaltime").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'切图时长不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
			$.post("jsView_updatePic.action", $("#jsmyform1").serialize(),
					function(data) {
						alert(data);
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);
						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}else if(id==2){
			if($("#bigpicBtnBorderwidth").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'边框宽度不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
			$.post("jsView_updateBtn.action", $("#jsmyform2").serialize(),
					function(data) {
						alert(data);
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}else if(id==3){
			if($("#bigpicTitlebarHeight").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'标题栏高度不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
			if($("#bigpicTitlebarAlpha").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'标题栏透明度不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}else if($("#bigpicTitlebarAlpha").val()>1){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'标题栏透明度要是0到1的小数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
			if($("#bigpicTitlefontSize").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'标题栏字体大小不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
			$.post("jsView_updateTitle.action", $("#jsmyform3").serialize(),
					function(data) {
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}else if(id==4){
			$.post("jsView_updateProduct.action", $("#jsmyform4").serialize(),
					function(data) {
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}
	}
	function saveJs(id) {
		showJs(id);
		if(id==1){
			
			$.post("jsSave_updatePic.action", $("#jsmyform1").serialize(),
				function(data) {
					data = parseInt(data);
					if (data > 0) {
			  			myload();
						$("#view").src = "yyyback/model/view.jsp";
						document.getElementById('view').contentWindow.location.reload(true);

					} else {
						$.messager.alert('失败提示', '预览失败，请稍后重试...',
								'error');
					}
				}, "json");
		}else if(id==2){
			
			$.post("jsSave_updateBtn.action", $("#jsmyform2").serialize(),
					function(data) {
						data = parseInt(data);
						if (data > 0) {
				  			myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}else if(id==3){
			
			$.post("jsSave_updateTitle.action", $("#jsmyform3").serialize(),
					function(data) {
						data = parseInt(data);
						if (data > 0) {
				  			myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}else if(id==4){
			
			$.post("jsSave_updateProduct.action", $("#jsmyform4").serialize(),
					function(data) {
						data = parseInt(data);
						if (data > 0) {
				  			myload();
							$("#view").src = "yyyback/model/view.jsp";
							document.getElementById('view').contentWindow.location.reload(true);

						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...',
									'error');
						}
					}, "json");
		}
	}
</script>