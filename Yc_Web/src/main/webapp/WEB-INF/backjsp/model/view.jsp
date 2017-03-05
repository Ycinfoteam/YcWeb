<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>浏览效果</title>
<base href="<%=basePath%>">
<meta name="baidu-site-verification" content="qQGSVuHhGa" />
<meta charset="utf-8">
<title>柯靓机具_首页-文件柜_密集柜_更衣柜</title>
<meta name="keywords" content="文件柜,密集柜,更衣柜">

<meta name="description"
	content="佛山市南海区柯靓钢制办公机具厂是专业从事钢制办公家具的研发设计、
		生产销售企业，主营钢制文件柜、档案柜、更衣柜、密集架、办公桌等。联系电话：18025952659 张经理">
<link href="css/view.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="http://cssrefresh.frebsite.nl/js/cssrefresh.js"></script>

<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/kit.js"></script>
<script type="text/javascript" src="js/MSClass.js">
	
</script>
<script type="text/javascript">
	function chick() {
		alert("这只是个浏览页面哦~");
	}
	
	

	
</script>
</head>

<body>
	<div id="custom">
		<a target="_blank" href="javascript:chick()"> <img border="0"
			src="http://wpa.qq.com/pa?p=2:3086792923:53" alt="点击这里给我发消息"
			title="点击这里给我发消息" />
		</a>
	</div>
	<div id="wrap">
		<div class="header">
			<div class="header_left">
				<h1>
					<a title="佛山柯靓钢制办公家具" href="javascript:chick()"><img
						src="images/skins/22.jpg" alt="佛山柯靓钢制办公家具" height="100%" /> </a>
				</h1>
			</div>
			<div class="header_right">
				<div class="sc">
					<a href="javascript:chick()" title="设为首页">设为首页</a> | <a
						href="javascript:chick()" title="加入收藏">加入收藏</a> | <a
						href="javascript:chick()" title="联系我们">联系我们</a>
				</div>
				<div class="tel">
					<table border="0px">
						<tr>
							<td>联系电话：</td>
							<td>180&nbsp;2595&nbsp;2659</td>
						</tr>
						<tr>
							<td></td>
							<td>0757-28858769</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="nav">
			<ul>
				<li><a href="javascript:chick()" title="网站首页">网站首页</a></li>
				<li><a href="javascript:chick()" title="公司简介">公司简介</a></li>
				<li><a href="javascript:chick()" title="新闻动态">新闻动态</a></li>
				<li><a href="javascript:chick()" title="产品展示">产品展示</a></li>
				<li><a href="javascript:chick()" title="合作案例">合作案例</a></li>
				<li><a href="javascript:chick()" title="资质荣誉">资质荣誉</a></li>
				<li class="none"><a href="javascript:chick()" title="人才招聘">人才招聘</a>
				</li>
				<!-- <li><a href="message.jsp" title="在线留言">在线留言</a></li> -->
				<!-- <li><a href="DatadictServlet?op=showNet&title=3" title="销售网络">销售网络</a></li> -->
				<!-- <li class="none"><a href="DatadictServlet?op=showCallUs&title=2" title="联系我们">联系我们</a></li> -->
			</ul>
		</div>
		<div class="banner">
			<div id="KinSlideshow"
				style="visibility: hidden; text-align: center; width: 100%;">
				<a href="javascript:chick()" title="首页"> <img
					src="images/adv/521d73d140761.jpg" alt="首页" border="0" width="1207"
					height="375" />
				</a> <a href="javascript:chick()" title="联系我们"> <img
					src="images/adv/521d735fc2acf.jpg" alt="联系我们" border="0"
					width="1202" height="375" />
				</a> <a href="javascript:chick()" title="新闻动态"> <img
					src="images/adv/521d7447d0638.jpg" alt="新闻动态" border="0"
					width="1202" height="375" />
				</a>
			</div>
		</div>
		<!-- 产品分类 -->
		<div class="static_left">
			<div class="classify">
				<div class="title_1">产品分类</div>
				<ul class="bor">
					<li><a href="javascript:chick()" title="文件柜">文件柜</a></li>
					<li><a href="javascript:chick()" title="拆装文件柜">拆装文件柜</a></li>
					<li><a href="javascript:chick()" title="钢制文件柜">钢制文件柜</a></li>
					<li><a href="javascript:chick()" title="更衣柜">更衣柜</a></li>
					<li><a href="javascript:chick()" title="密集柜">密集柜</a></li>
					<li><a href="javascript:chick()" title="实验室家具">实验室家具</a></li>
					<li><a href="javascript:chick()" title="货架系列">货架系列</a></li>

				</ul>
			</div>
			<!-- 公司简介  -->
			<div class="company bor">
				<div class="title_2">
					<a href="javascript:chick()"></a>公司简介
				</div>
				<div class="about" id="aboutCompany">
					<div class="center">
						<img src="images/skins/about_pic.jpg" height="150px" width="217px"
							alt="公司简介" />
					</div>
					<span>
						佛山市南海区柯靓钢制办公机具厂是专业的钢制办公家具生产销售企业，于2007年通过ISO9001:2000质量体系认证，产品涵盖文件柜、更衣柜、图书馆设备、密集架、校用设备、防盗保险柜、办公桌、货架等7大系列200多个品种...</span>

					<a href="javascript:chick()">【查看详情】</a>
				</div>
			</div>
		</div>
		<div id="hiddening" style="margin-left: 240px;">
			<div class="product bor" id="tota">
				<div class="title_2">
					<a href="javascript:chick()"></a>产品展示
				</div>
				<div class="clear">
					<div id="mq1"
						style="margin: 5px; height: 160px; width: 890px; overflow: hidden; padding: 10px; margin-left: 17px; margin-buttom: 10px;">
						<table>
							<tr>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜7"><img width="143" height="133" border="1"
										src="upload/images/20150612105053.jpg" alt="铁柜7" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="最新拆装文件柜"><img width="143" height="133" border="1"
										src="upload/images/20150612105122.jpg" alt="最新拆装文件柜" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜9"><img width="143" height="133" border="1"
										src="upload/images/20150612105159.jpg" alt="铁柜9" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜4"><img width="143" height="133" border="1"
										src="upload/images/20150612105212.jpg" alt="铁柜4" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜3"><img width="143" height="133" border="1"
										src="upload/images/20150612105417.jpg" alt="铁柜3" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜6"><img width="143" height="133" border="0"
										src="upload/images/20150612105526.jpg" alt="铁柜6" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="钢制文件柜1"><img width="143" height="133" border="1"
										src="upload/images/20150612105505.jpg" alt="钢制文件柜1" /> </a></td>
							</tr>
						</table>
					</div>
					<div id="mq2"
						style="height: 137px; overflow: hidden; width: 890px; padding: 10px; margin-left: 17px;">
						<table>
							<tr>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜5"><img width="143" height="133" border="0"
										src="upload/images/20150612105107.JPG" alt="铁柜5" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜10"><img width="143" height="133" border="0"
										src="upload/images/20150612105115.jpg" alt="铁柜10" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜8"><img width="143" height="133" border="0"
										src="upload/images/20150612105147.jpg" alt="铁柜8" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜11"><img width="143" height="133" border="0"
										src="upload/images/20150612105334.jpg" alt="铁柜11" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜1"><img width="143" height="133" border="0"
										src="upload/images/20150612105354.jpg" alt="铁柜1" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜6"><img width="143" height="133" border="0"
										src="upload/images/20150612105053.jpg" alt="铁柜6" /> </a></td>
								<td class="shows_pic"><a href="javascript:chick()"
									title="铁柜2"><img width="143" height="133" border="0"
										src="upload/images/20150612105436.jpg" alt="铁柜2" /> </a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<script type="text/javascript" src="modeljs/view.js"></script>
			
			
			

			<!-- 新闻展示  -->
			<div class="new">
				<iframe src="yyyback/model/new_tab_view.jsp" frameborder="0"
					width="955" height="500" scrolling="yes" marginwidth="0"></iframe>
			</div>



		</div>

	</div>
	<div class="foot">
		<div class="foot_link">
			<ul>
				<li style="height: 100%;"><strong>友情链接：</strong></li>
				<li><a title="格雷特淘宝店" href="javascript:chick() "> <span>格雷特淘宝店</span>
				</a></li>
				<li><a title="柯靓淘宝店" href="javascript:chick() "> <span>柯靓淘宝店</span>
				</a></li>
				<li><a title="诚信通" href="javascript:chick()"> <span>诚信通</span>
				</a></li>
				<li><a title="阿里巴巴国际站1" href="javascript:chick()"> <span>阿里巴巴国际站1</span>
				</a></li>
				<li><a title="阿里巴巴国际站2" href="javascript:chick()"> <span>阿里巴巴国际站2</span>
				</a></li>
				<li><a title="阿里巴巴国际站3" href="javascript:chick()"> <span>阿里巴巴国际站3</span>
				</a></li>
				<li><a title="阿里巴巴国际站4" href="javascript:chick()"> <span>阿里巴巴国际站4</span>
				</a></li>
			</ul>
		</div>
		<div class="foot_p">
			<p>
				地址：佛山市南海区丹灶镇明沙南路 电话：18025952695 传真：0757-29836781<br />柯靓钢制办公机具厂——竭诚为您选购质好价优钢制文件柜，更衣柜，密集架，欢迎垂询！主营产品：文件柜_钢制文件柜_铁皮文件柜_档案文件柜_凭证柜
			</p>
		</div>
	</div>
</body>
</html>
