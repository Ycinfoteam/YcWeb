 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<meta content="IE=5.0000" http-equiv="X-UA-Compatible">

<meta charset="UTF-8">
<script src="js/tab/lang.js" type="text/javascript"></script>

<script src="js/tab/selltop.js" type="text/javascript"></script>

<style type="text/css">
body{
	margin:0;
	padding:0;
}
.sales-rank {
	width: 945px;
	height: 345px;
	overflow: hidden;
	border: 1px solid #F2F2F2;
	margin-bottom:5px;
}
.goods-list-tabs {
	overflow: hidden;
	margin-bottom: 5px;
}
.goods-list-tabs .tab-item {
	float: left;
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #9f1417;
	background: -moz-linear-gradient(0% 0 270deg, #fefefe, #efefef) repeat
		scroll 0 0 #eeeeee;
	border-color: -moz-use-text-color -moz-use-text-color #ddd #ddd;
	border-image: none;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fefefe),
		to(#efefef) );
	background-color: #efefef;
	border-style: none none solid solid;
	border-width: medium medium 1px 1px;
	color: #666666;
	cursor: pointer;
	float: left;
	font-family: microsoft yahei;
	font-size: 11px;
	height: 30px;
	border-left: 1px solid #ddd;
	border-bottom: 2px solid #ddd;
	line-height: 30px;
	padding: 0;
	text-align: center;
	cursor: pointer;
}
.goods-list-tabs .tab-item.current {
	color: #9f1417;
	font-weight: bold;
	background: #ffffff;
	border-bottom: 2px solid red;
	text-align: center;
}

.ex-panel {
	text-align: center;
}

.news_list ul{ list-style:none; padding:8px;}
.news_list ul li{height:30px; line-height:30px; border-bottom:1px dashed #dedede;}
.news_list ul li span{ float:right}
.news_list ul li a{ display:block; padding-left:10px; color:#3d3d3d;text-decoration:none; text-align:left;}
.news_list ul li a:hover{ color:#C71E1B;}
.news_list .more a img{margin-top:10px;float:right; line-height:30px;}

.last {
	border-bottom: 1px solid #fff;
}

</style>
<meta name="GENERATOR" content="MSHTML 11.00.9600.17126">
</head>

<body>
	<div class="sales-rank">
		<div id="top_sell1359">
			<div class="goods-list-tabs" id="top_1359">
					<div class="tab-item current" style="width: 460px;">
						<span>公司新闻</span>
					</div>
					<div class="tab-item " style="width: 473px;">
						<span>行业新闻</span>
					</div>
			</div>
			<div class="goods-list">
				<div class="goods-items" style="display: block;">
					<div class="ex-panel">
					
						<div class="bor">
							<div class="news_list">
								<ul>
									<li><span>2015-06-07</span> <a href="javascript:chick() " 
									target="_blank" title="怎样挑选铁皮更衣柜">
											·热烈庆祝柯靓办公家具网站上线</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·文件柜是最佳设备</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·如何选择高质量的铁皮文件柜</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·怎样挑选铁皮更衣柜</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·文件柜亮丽如新</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·如何使钢制文件柜崭新如故</a></li>
									<li><span>2015-06-05</span> <a href="javascript:chick() " target="_blank"
										title="怎样挑选铁皮更衣柜">
											·如何使钢制文件柜崭新如故</a></li>
									<li class="more"><a href="javascript:chick() " target="_blank"><img src="images/skins/more.jpg" ></a>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="goods-items" style="display: none;">
					<div class="ex-panel">
						<div class="bor">
							<div class="news_list">
								<ul>
									<li><span>2015-06-05</span><a href="javascript:chick() " target="_blank"
										title="铁皮文件柜的焊接过程">·大型机械维修</a>
									</li>
									<li><span>2015-06-05</span><a href="javascript:chick() " target="_blank"
										title="铁皮文件柜的焊接过程">·大型机械维修</a>
									</li>
									<li><span>2015-06-05</span><a href="javascript:chick() " target="_blank"
										title="铁皮文件柜的焊接过程">·大型机械维修</a>
									</li>
									<li class="more"><a href="javascript:chick() " target="_blank"><img src="images/skins/more.jpg" ></a>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
            (function () {
                new Switchable('top_sell1359', {
                    eventType: 'mouse',
                    content: '.goods-list',
                    activeClass: 'current',
                    panels: '.goods-items',
                    autoplay: false,
                    triggersBox: '.goods-list-tabs',
                    activeIndex: 0
                });
            })();

        </script>
	</div>
</body>
</html>
