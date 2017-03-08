<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

    <div data-options="region:'west',title:'操作菜单',split:true"
		style="width:40%;float:left;height:100%">
		<div id="aa" class="easyui-accordion" data-options="fit:true">
			<div title="页面头部">
				<div id="tt1" class="easyui-tree"
					data-options="animate:true,dnd:true">
					<form method="post" id="myform1">
						<table>
							<tr>
								<td>右侧宽度：</td>
								<td><input type="number" name="headRightWidth" id="head_right_width"/>px</td>
							</tr>
							<tr >
								<td>字体设置：</td>
								<td colspan="3">字体：
									<select name="telFontFamily" id="tel_table_tr_td_font_family">
										<option value="微软雅黑" >微软雅黑</option>
										<option value="宋体">宋体</option>
										<option value="新宋体">新宋体</option>
										<option value="黑体" >黑体</option>
									</select>大小：
									<select name="telFontSize" id="tel_table_tr_td_font_size">
										<option value="10">10</option>
										<option value="12">12</option>
										<option value="14">14</option>
										<option value="16">16</option>
										<option value="18">18</option>
										<option value="20">20</option>
										<option value="22">22</option>
									</select>加粗：
									<select name="telFontWeight" id="tel_table_tr_td_font_weight">
										<option value="500">500</option>
										<option value="600">600</option>
										<option value="700">700</option>
										<option value="800">800</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>字体颜色：</td>
								<td><input id="tel_table_tr_td_color" class="color" 
									name="telColor" value="FFFFFF" onclick="jscolor.init()"></td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									<input type="button" onclick="showView(1)" value="预览"/>
									<input type="button" onclick="saveCss(1)" value="保存"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div title="导航栏">
				<div id="tt2" class="easyui-tree"
					data-options="animate:true,dnd:true">
					<form method="post" id="myform2">
						<table>
							<tr>
								<td>背景图片：</td>
								<td>
									<input type="radio" name="navBackground" 
										value="0" />
										<img src="images/modelimg/modelblue/nav_0.png"><br/>
									<input type="radio" name="navBackground"
										value="1" />
										<img src="images/modelimg/modelnew22ADBD/nav_1.png"><br/>
									<input type="radio" name="navBackground" 
										value="2" />
										<img src="images/modelimg/modelnewA54523/nav_2.png"><br/>
									<input type="radio" name="navBackground" 
										value="3" />
										<img src="images/modelimg/modelnewB7C1C2/nav_3.png"><br/>
									<input type="radio" name="navBackground" 
										value="4" />
										<img src="images/modelimg/modelnewDDDE74/nav_4.png"><br/>
									<input type="radio" name="navBackground" 
										value="5" />
										<img src="images/modelimg/modelred/nav_5.png"><br/>
									<input type="hidden" name="bodyBackgroundUrl" id="bodyBackgroundUrl">
									<input type="hidden" name="navUlLiBackgroundUrl" id="navUlLiBackgroundUrl">
								</td>
							</tr>
							<tr>
								<td>字体设置：</td>
								<td colspan="2">字体：
									<select name="navUlLiFontFamily" id="nav_ul_li_font_family">
										<option value="宋体">宋体</option>
										<option value="微软雅黑" >微软雅黑</option>
										<option value="新宋体">新宋体</option>
										<option value="黑体" >黑体</option>
									</select>
									大小：
									<select name="navUlLiFontSize" id="nav_ul_li_font_size">
										<option value="10">10</option>
										<option value="12">12</option>
										<option value="14">14</option>
										<option value="16">16</option>
										<option value="18">18</option>
										<option value="20">20</option>
										<option value="22">22</option>
									</select>间距：
									<select name="navUlLiLetterSpacing" id="nav_ul_li_letter_spacing">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="4">4</option>
										<option value="6">6</option>
									</select>
								</td>
							</tr>
							
							<!-- <tr>
								<td>超链接样式：</td>
								<td>
									<input type="radio" name="nav_a_view" value="1" onclick="javascript:OnSelect('nav')"/>
										<a class="nav_a_view1">样式一</a>
									<input type="radio" name="nav_a_view" value="2" onclick="javascript:OnSelect('nav')"/>
										<a class="nav_a_view2" >样式二</a>
									<input type="radio" name="nav_a_view" value="3" onclick="javascript:OnSelect('mynav')"/>
										<label>自定义</label>
								</td>
							</tr>
							
							<tbody id="nav_view" style="display:none"> -->
								<tr >
									<td>字体颜色：</td>
									<td><input name="navUlLiAColor" id="nav_ul_li_a_color" class="color" value="FFFFFF" onclick="jscolor.init()"></td>
								</tr>
								<tr >
									<td>hover颜色：</td>
									<td><input name="navUlLiAHoverColor" class="color" id="nav_ul_li_a_hover_color" value="FFFFFF" onclick="jscolor.init()"></td>
								</tr><tr >
									<td>hover背景颜色：</td>
									<td><input name="navUlLiAHoverBackground" class="color" id="nav_ul_li_a_hover_background" value="FFFFFF" onclick="jscolor.init()"></td>
								</tr>
								<tr >
									<td>边框颜色：</td>
									<td><input name="navUlLiAHoverBorderColor" class="color" id="nav_ul_li_a_hover_border_color" value="FFFFFF" onclick="jscolor.init()"></td>
								</tr>
							<!-- </tbody> -->
							<tr>
								<td></td>
								<td colspan="2">
									<input type="button" onclick="showView(2)" value="预览"/>
									<input type="button" onclick="saveCss(2)" value="保存"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div> 
			<div title="产品类型栏">
				<div id="tt3" class="easyui-tree"
					data-options="animate:true,dnd:true">
					<form method="post" id="myform3">
						<table>
							<tr>
								<td>栏目框背景：</td>
								<td>
									<input type="radio" name="titleBackgroundUrl" 
										value="../images/skins/blue/bar_left.jpg" />
										<img src="images/modelimg/modelblue/title_0.png"><br/>
									<input type="radio" name="titleBackgroundUrl"
										value="../images/skins/new22ADBD/bar_left.jpg" />
										<img src="images/modelimg/modelnew22ADBD/title_1.png"><br/>
									<input type="radio" name="titleBackgroundUrl" 
										value="../images/skins/newA54523/bar_left.jpg" />
										<img src="images/modelimg/modelnewA54523/title_2.png"><br/>
									<input type="radio" name="titleBackgroundUrl" 
										value="../images/skins/newB7C1C2/bar_left.jpg" />
										<img src="images/modelimg/modelnewB7C1C2/title_3.png"><br/>
									<input type="radio" name="titleBackgroundUrl" 
										value="../images/skins/newDDDE74/bar_left.jpg" />
										<img src="images/modelimg/modelnewDDDE74/title_4.png"><br/>
									<input type="radio" name="titleBackgroundUrl" 
										value="../images/skins/red/bar_left.jpg" />
										<img src="images/modelimg/modelred/title_5.png"><br/>
								</td>
							</tr>
							<tr>
								<td>字体设置：</td>
								<td colspan="2">
								字体： <select name="classifyFontFamily" id="classify_ul_li_font_family">
										<option value="微软雅黑">微软雅黑</option>
										<option value="宋体">宋体</option>
										<option value="新宋体">新宋体</option>
										<option value="黑体">黑体</option>
								</select> 
								大小： <select name="classifyFontSize" id="classify_ul_li_font_size">
										<option value="10">10</option>
										<option value="12">12</option>
										<option value="14">14</option>
										<option value="16">16</option>
										<option value="18">18</option>
										<option value="20">20</option>
										<option value="22">22</option>
								</select> 
								左间距： <select name="classifyAPaddingLeft" id="classify_ul_li_a_padding_left">
										<option value="10">10</option>
										<option value="12">12</option>
										<option value="14">14</option>
										<option value="16">16</option>
										<option value="18">18</option>
										<option value="20">20</option>
										<option value="22">22</option>
								</select>
								</td>
							</tr>
							<!-- <tr>
								<td>超链接样式：</td>
								<td>
									<input type="radio" name="classify_a_view" value="1"
										onclick="javascript:OnSelect('classify')" /><a
										class="classify_a_view1">样式一</a> 
									<input type="radio" name="classify_a_view" value="2"
										onclick="javascript:OnSelect('classify')" /><a
										class="classify_a_view2">样式二</a> 
									<input type="radio"
										name="classify_a_view" value="3"
										onclick="javascript:OnSelect('myclassify')" />
										<label>自定义</label>
								</td>
							</tr>
							<tbody id="classify_view" style="display: none"> -->
								<tr>
									<td>hover背景图片</td>
									<td>
									<input type="radio" name="classifyAHoverBackgroundUrl" 
										value="../images/skins/blue/li_hover.jpg" />
										<img src="images/modelimg/modelblue/li_0.png"><br/>
									<input type="radio" name="classifyAHoverBackgroundUrl"
										value="../images/skins/new22ADBD/li_hover.jpg" />
										<img src="images/modelimg/modelnew22ADBD/li_1.png"><br/>
									<input type="radio" name="classifyAHoverBackgroundUrl" 
										value="../images/skins/newA54523/li_hover.jpg" />
										<img src="images/modelimg/modelnewA54523/li_2.png"><br/>
									<input type="radio" name="classifyAHoverBackgroundUrl" 
										value="../images/skins/newB7C1C2/li_hover.jpg" />
										<img src="images/modelimg/modelnewB7C1C2/li_3.png"><br/>
									<input type="radio" name="classifyAHoverBackgroundUrl" 
										value="../images/skins/newDDDE74/li_hover.jpg" />
										<img src="images/modelimg/modelnewDDDE74/li_4.png"><br/>
									<input type="radio" name="classifyAHoverBackgroundUrl" 
										value="../images/skins/red/li_hover.jpg" />
										<img src="images/modelimg/modelred/li_5.png"><br/>
									</td>
								</tr>
								<tr>
									<td>字体颜色：</td>
									<td><input id=classify_ul_li_a_color class="color"
										name="classifyAColor" value="FFFFFF"
										onclick="jscolor.init()"></td>
								</tr>
								<tr>
									<td>hover字体颜色：</td>
									<td><input id="classify_ul_li_a_hover_color" class="color"
										name="classifyAHoverColor" value="FFFFFF"
										onclick="jscolor.init()"></td>
								</tr>
	
							<!-- </tbody> -->
							<tr>
								<td></td>
								<td colspan="2">
									<input type="button" onclick="showView(3)" value="预览" /> 
									<input type="button" onclick="saveCss(3)" value="保存" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div title="公司简介栏">
			<div id="tt4" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="myform4">
				<table>
					<tr>
						<td>距顶部距离</td>
						<td><input type="number" name="companyMarginTop" 
							id="company_margin_top"/>px</td>
					</tr>
					<tr>
						<td>行高</td>
						<td><input type="number" name="aboutLineHeight" id="about_line_height"/>px</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<input type="button" onclick="showView(4)" value="预览"/>
							<input type="button" onclick="saveCss(4)" value="保存"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
			<div title="客服模块">
			<div id="tt5" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="myform5">
				<table>
					<tr>
						<td>浮动方式：</td>
						<td><input type="radio" name="customFloat" value="left" /><label>左浮</label>
							<input type="radio" name="customFloat" value="right" /><label>右浮</label>
						</td>
					</tr>
					<tr>
						<td>浮动位置：</td>
						<td><input type="radio" name="customLocaltion" value="left" /><label>左边</label>
							<input type="radio" name="customLocaltion" value="right" /><label>右边</label>
						</td>
					</tr>
					<tr>
						<td>距顶部高度：</td>
						<td><input type="number" name="customTop" id="custom_top"/>px</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<input type="button" onclick="showView(5)" value="预览"/>
							<input type="button" onclick="saveCss(5)" value="保存"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
			<div title="页面底部">
			<div id="tt6" class="easyui-tree"
				data-options="animate:true,dnd:true">
				<form method="post" id="myform6">
				<table>
					<tr>
						<td>背景图片：</td>
						<td>
									<input type="radio" name="footBackgroundUrl" 
										value="../images/skins/blue/footer_bg.jpg" />
										<img src="images/modelimg/modelblue/foot_0.png"><br/>
									<input type="radio" name="footBackgroundUrl"
										value="../images/skins/new22ADBD/footer_bg.jpg" />
										<img src="images/modelimg/modelnew22ADBD/foot_1.png"><br/>
									<input type="radio" name="footBackgroundUrl" 
										value="../images/skins/newA54523/footer_bg.jpg" />
										<img src="images/modelimg/modelnewA54523/foot_2.png"><br/>
									<input type="radio" name="footBackgroundUrl" 
										value="../images/skins/newB7C1C2/footer_bg.jpg" />
										<img src="images/modelimg/modelnewB7C1C2/foot_3.png"><br/>
									<input type="radio" name="footBackgroundUrl" 
										value="../images/skins/newDDDE74/footer_bg.jpg" />
										<img src="images/modelimg/modelnewDDDE74/foot_4.png"><br/>
									<input type="radio" name="footBackgroundUrl" 
										value="../images/skins/red/footer_bg.jpg" />
										<img src="images/modelimg/modelred/foot_5.png"><br/>
						</td>
					</tr>
					<tr>
						<td>超链接字体颜色：</td>
						<td><input name="footLinkUlLiAColor" class="color"
							id="foot_link_ul_li_a_color" value="FFFFFF"
							onclick="jscolor.init()"></td>
					</tr>
					<tr>
						<td>字体设置：</td>
						<td colspan="2">
						字体： <select name="footPPFontFamily" id="foot_p_p_font_family">
								<option value="微软雅黑">微软雅黑</option>
								<option value="宋体">宋体</option>
								<option value="新宋体">新宋体</option>
								<option value="黑体">黑体</option>
						</select>
						行高： <select name="footPPLineHeight" id="foot_p_p_line_height">
								<option value="14">14</option>
								<option value="16">16</option>
								<option value="18">18</option>
								<option value="20">20</option>
								<option value="22">22</option>
								<option value="24">24</option>
								<option value="26">26</option>
								<option value="28">28</option>
						</select>
						对齐： <select name="footPPTextAlign" id="foot_p_p_text_align">
								<option value="center">居中</option>
								<option value="left">左对齐</option>
								<option value="right">右对齐</option>
						</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">
							<input type="button" onclick="showView(6)" value="预览"/>
							<input type="button" onclick="saveCss(6)" value="保存"/>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
			
		
		</div>
	</div>
    <div style="float:left; width:60%;" >
    	<iframe id="view" src="yyyback/model/view.jsp" frameborder="0" width="100%" height="100%"
		 scrolling="yes" marginwidth="0"></iframe>
    </div>
  <script type="text/javascript">
  	function OnSelect(name){
  		if(name=='mynav'){
  			document.getElementById("nav_view").style.display="";
  			return;
  		}
  		
  		if(name=='nav'){
  			document.getElementById("nav_view").style.display="none";
  			return;
  		}
  		
  		if(name=='myclassify'){
  			document.getElementById("classify_view").style.display="";
  			return;
  		}
  		
  		if(name=='classify'){
  			document.getElementById("classify_view").style.display="none";
  			return;
  		}
  	}
  	function myload(){
  		//加载层-风格2
		layer.load();
		//此处演示关闭
		setTimeout(function(){
		    layer.closeAll('loading');
		}, 2000);
  	}
  	$(function(){
  		myload();
		$.post("cssSave_getAllCss.action",null,function(data){
			if(data!=null && data!=undefined){tel_table_tr_td_font_family
				$("#head_right_width").val(data.css.headRightWidth);
				$("#tel_table_tr_td_font_family").val(data.css.telFontFamily);
				$("#tel_table_tr_td_font_size").val(data.css.telFontSize);
				$("#tel_table_tr_td_font_weight").val(data.css.telFontWeight);
				$("#tel_table_tr_td_color").val(data.css.telColor);
				
				if(data.css.bodyBackgroundUrl=="../images/skins/blue/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/blue/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.bodyBackgroundUrl=="../images/skins/new22ADBD/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/new22ADBD/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(1).attr('checked', 'true');
				}else if(data.css.bodyBackgroundUrl=="../images/skins/newA54523/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/newA54523/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(2).attr('checked', 'true');
				}else if(data.css.bodyBackgroundUrl=="../images/skins/newB7C1C2/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/newB7C1C2/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(3).attr('checked', 'true');
				}else if(data.css.bodyBackgroundUrl=="../images/skins/newDDDE74/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/newDDDE74/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(4).attr('checked', 'true');
				}else if(data.css.bodyBackgroundUrl=="../images/skins/red/bodybg.jpg"&&data.css.navUlLiBackgroundUrl=="../images/skins/red/libg.jpg"){
					$('input[name="navBackground"]:radio').eq(5).attr('checked', 'true');
				}
				$("#nav_ul_li_font_family").val(data.css.navUlLiFontFamily);
				$("#nav_ul_li_font_size").val(data.css.navUlLiFontSize);
				$("#nav_ul_li_letter_spacing").val(data.css.navUlLiLetterSpacing);
				$("#nav_ul_li_a_color").val(data.css.navUlLiAColor);
				$("#nav_ul_li_a_hover_color").val(data.css.navUlLiAHoverColor);
				$("#nav_ul_li_a_hover_background").val(data.css.navUlLiAHoverBackground);
				$("#nav_ul_li_a_hover_border_color").val(data.css.navUlLiAHoverBorderColor);
				
				if(data.css.titleBackgroundUrl=="../images/skins/blue/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.titleBackgroundUrl=="../images/skins/new22ADBD/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(1).attr('checked', 'true');
				}else if(data.css.titleBackgroundUrl=="../images/skins/newA54523/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(2).attr('checked', 'true');
				}else if(data.css.titleBackgroundUrl=="../images/skins/newB7C1C2/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(3).attr('checked', 'true');
				}else if(data.css.titleBackgroundUrl=="../images/skins/newDDDE74/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(4).attr('checked', 'true');
				}else if(data.css.titleBackgroundUrl=="../images/skins/red/bar_left.jpg"){
					$('input[name="titleBackgroundUrl"]:radio').eq(5).attr('checked', 'true');
				}
				$("#classify_ul_li_font_family").val(data.css.classifyFontFamily);
				$("#classify_ul_li_font_size").val(data.css.classifyFontSize);
				$("#classify_ul_li_a_padding_left").val(data.css.classifyAPaddingLeft);
				if(data.css.classifyAHoverBackgroundUrl=="../images/skins/blue/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.classifyAHoverBackgroundUrl=="../images/skins/new22ADBD/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(1).attr('checked', 'true');
				}else if(data.css.classifyAHoverBackgroundUrl=="../images/skins/newA54523/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(2).attr('checked', 'true');
				}else if(data.css.classifyAHoverBackgroundUrl=="../images/skins/newB7C1C2/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(3).attr('checked', 'true');
				}else if(data.css.classifyAHoverBackgroundUrl=="../images/skins/newDDDE74/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(4).attr('checked', 'true');
				}else if(data.css.classifyAHoverBackgroundUrl=="../images/skins/red/li_hover.jpg"){
					$('input[name="classifyAHoverBackgroundUrl"]:radio').eq(5).attr('checked', 'true');
				}
				$("#classify_ul_li_a_color").val(data.css.classifyAColor);
				$("#classify_ul_li_a_hover_color").val(data.css.classifyAHoverColor);
				
				$("#company_margin_top").val(data.css.companyMarginTop);
				$("#about_line_height").val(data.css.aboutLineHeight);
				
				if(data.css.customFloat=="left"){
					$('input[name="customFloat"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.customFloat=="right"){
					$('input[name="customFloat"]:radio').eq(1).attr('checked', 'true');
				}
				if(data.css.customLocaltion=="left"){
					$('input[name="customLocaltion"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.customLocaltion=="right"){
					$('input[name="customLocaltion"]:radio').eq(1).attr('checked', 'true');
				}
				$("#custom_top").val(data.css.customTop);
				
				if(data.css.footBackgroundUrl=="../images/skins/blue/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(0).attr('checked', 'true');
				}else if(data.css.footBackgroundUrl=="../images/skins/new22ADBD/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(1).attr('checked', 'true');
				}else if(data.css.footBackgroundUrl=="../images/skins/newA54523/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(2).attr('checked', 'true');
				}else if(data.css.footBackgroundUrl=="../images/skins/newB7C1C2/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(3).attr('checked', 'true');
				}else if(data.css.footBackgroundUrl=="../images/skins/newDDDE74/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(4).attr('checked', 'true');
				}else if(data.css.footBackgroundUrl=="../images/skins/red/footer_bg.jpg"){
					$('input[name="footBackgroundUrl"]:radio').eq(5).attr('checked', 'true');
				}
				$("#foot_link_ul_li_a_color").val(data.css.footLinkUlLiAColor);
				$("#foot_p_p_font_family").val(data.css.footPPFontFamily);
				$("#foot_p_p_text_align").val(data.css.footPPTextAlign);
				$("#foot_p_p_line_height").val(data.css.footPPLineHeight);
			}
		},"json");
	});
  	function showView(id){
  		if(id==1){
  			if($("#head_right_width").val()<0){
  				$.messager.show({
  					title:'温馨提示',
  					msg:'高度不能为负数哦~',
  					timeout:2000,
  					showType:'slide'
  				});
  				return;
  			}
  			$.post("cssView_updateHeadCss.action",$("#myform1").serialize(),function(data){
  				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}else if(id==2){
  			if($('input[name="navBackground"]:radio:checked').val()=="0"){
  				$("#bodyBackgroundUrl").val("../images/skins/blue/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/blue/libg.jpg");
  			}else if($('input[name="navBackground"]:radio:checked').val()=="1"){
  				$("#bodyBackgroundUrl").val("../images/skins/new22ADBD/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/new22ADBD/libg.jpg");
  			}else if($('input[name="navBackground"]:radio:checked').val()=="2"){
  				$("#bodyBackgroundUrl").val("../images/skins/newA54523/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/newA54523/libg.jpg");
  			}else if($('input[name="navBackground"]:radio:checked').val()=="3"){
  				$("#bodyBackgroundUrl").val("../images/skins/newB7C1C2/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/newB7C1C2/libg.jpg");
  			}else if($('input[name="navBackground"]:radio:checked').val()=="4"){
  				$("#bodyBackgroundUrl").val("../images/skins/newDDDE74/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/newDDDE74/libg.jpg");
  			}else if($('input[name="navBackground"]:radio:checked').val()=="5"){
  				$("#bodyBackgroundUrl").val("../images/skins/red/bodybg.jpg");
  				$("#navUlLiBackgroundUrl").val("../images/skins/red/libg.jpg");
  			}
			$.post("cssView_updateNavCss.action",$("#myform2").serialize(),function(data){
				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}else if(id==3){
			$.post("cssView_updateClassifyCss.action",$("#myform3").serialize(),function(data){
				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}else if(id==4){
			$.post("cssView_updateCompanyCss.action",$("#myform4").serialize(),function(data){
				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}else if(id==5){
			$.post("cssView_updateCustomCss.action",$("#myform5").serialize(),function(data){
				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}else if(id==6){
			$.post("cssView_updateFootCss.action",$("#myform6").serialize(),function(data){
				data=parseInt(data);
  				if(data>0){
  			  		myload();
  					$("#view").src="yyyback/model/view.jsp";
  				}else{
  					$.messager.alert('失败提示','预览失败，请稍后重试...','error');
  				}
  			},"json");
  		}
  	}
  	
			function saveCss(id) {
				showView(id);
				if (id == 1) {
					
					if ($("#head_right_width").val() < 0) {
						$.messager.show({
							title : '温馨提示',
							msg : '高度不能为负数哦~',
							timeout : 2000,
							showType : 'slide'
						});
						return;
					}
					$.post("cssSave_updateHeadCss.action", $("#myform1").serialize(),
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
				} else if (id == 2) {
					if ($('input[name="navBackground"]:radio:checked').val() == "0") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/blue/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/blue/libg.jpg");
					} else if ($('input[name="navBackground"]:radio:checked')
							.val() == "1") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/new22ADBD/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/new22ADBD/libg.jpg");
					} else if ($('input[name="navBackground"]:radio:checked')
							.val() == "2") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/newA54523/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/newA54523/libg.jpg");
					} else if ($('input[name="navBackground"]:radio:checked')
							.val() == "3") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/newB7C1C2/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/newB7C1C2/libg.jpg");
					} else if ($('input[name="navBackground"]:radio:checked')
							.val() == "4") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/newDDDE74/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/newDDDE74/libg.jpg");
					} else if ($('input[name="navBackground"]:radio:checked')
							.val() == "5") {
						$("#bodyBackgroundUrl").val(
								"../images/skins/red/bodybg.jpg");
						$("#navUlLiBackgroundUrl").val(
								"../images/skins/red/libg.jpg");
					}
					$.post("cssSave_updateNavCss.action", $("#myform2").serialize(),
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
				} else if (id == 3) {
					$.post("cssSave_updateClassifyCss.action", $("#myform3")
							.serialize(), function(data) {
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...', 'error');
						}
					}, "json");
				} else if (id == 4) {
					$.post("cssSave_updateCompanyCss.action", $("#myform4")
							.serialize(), function(data) {
						data = parseInt(data);
						if (data > 0) {
		  			  		myload();
							$("#view").src = "yyyback/model/view.jsp";
						} else {
							$.messager.alert('失败提示', '预览失败，请稍后重试...', 'error');
						}
					}, "json");
				} else if (id == 5) {
					$.post("cssSave_updateCustomCss.action",
							$("#myform5").serialize(), function(data) {
								data = parseInt(data);
								if (data > 0) {
				  			  		myload();
									$("#view").src = "yyyback/model/view.jsp";
								} else {
									$.messager.alert('失败提示', '预览失败，请稍后重试...',
											'error');
								}
							}, "json");
				} else if (id == 6) {
					$.post("cssSave_updateFootCss.action", $("#myform6").serialize(),
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
			}
		</script>