<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath %>">
<title>官网后台</title>
<!--第一步：引入图标的CSS文件 themes/icon.css icons文件夹-->
<link type="text/css" rel="stylesheet" href="backcss/icon.css"/>
<!--第二步：引入easyui皮肤样式 themes/default/easyui.css    images文件夹拷贝-->
<link type="text/css" rel="stylesheet" href="backcss/easyui.css"/>

<style>
ul,li{
	margin:0 auto;
	list-style:none;
	padding:0px;
}
li{
	width:194px;
	height:30px;
}
#Image1{
	position:relative;
	top:15px;
}
</style>

</head>


<body class="easyui-layout">

	<div data-options="region:'north'" style="height:150px;">
<img id="Image1" src="images/logo.png" width="100" height="100px" style="margin-left: 220px; ">
	<hl style="font-size: 60px; width: 300px; color: blue; height: 100px;">
源&nbsp;&nbsp;辰&nbsp;&nbsp;官&nbsp;&nbsp;网&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;中&nbsp;&nbsp;心</hl>
	</div>

    <div data-options="region:'west',title:'菜单项'" style="width:200px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
			<div title="系统管理" style="overflow:auto;padding:10px;">
				<div id="tt1" class="easyui-tree"
					data-options="animate:true,dnd:true">
					</div>
			</div>
			<div title="数据字典" style="padding:10px;" data-options="selected:true">
				<div id="tt2" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			 <div title="新闻管理">
				<div id="tt3" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div> 
			<div title="师资管理">
				<div id="tt4" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="课程管理">
				<div id="tt5" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="学员项目">
				<div id="tt6" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="关于公司">
				<div id="tt7" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="人才招聘">
				<div id="tt8" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			
			 <div title="留言管理">     <!--   7.26前台去掉的模块 -->
				<div id="tt9" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<!-- <div title="浏览统计">
				<div id="tt9" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div> -->
			<div title="友情链接">
				<div id="tt10" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="模块管理">
				<div id="tt11" class="easyui-tree"
					data-options="animate:true,dnd:true"></div>
			</div>
			<div title="系统还原">
				<div id="tt12" class="backup"
					data-options="animate:true,dnd:true"></div>
			</div>
		</div>
        </div>
    <div data-options="region:'center'">
    
    <div id="tabs" class="easyui-tabs"
			data-options="fit:true,border:false">
			<div title="首页">
			welcome
			<!-- </br>
			您好：XXX。现在是北京时间XXXX。</br> -->
			</div>
	</div>
		
  <!--  <div id="jiazai" class="easyui-panel" title="操作" data-options="fit:true,border:false"></div>
    </div>  -->


</body>
<!--第三步 引入jquery代码 必须在easyui之前-->
<script type="text/javascript" src="backjs/jquery.min.js"></script>
<!--第四步  引入easyui-->
<script type="text/javascript" src="backjs/jquery.easyui.min.js"></script>
<!--第五步 引入语言包 -->
<script type="text/javascript" src="backjs/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script src="backjs/jquery.edatagrid.js"></script>
<script src="backjs/jquery.form.js"></script>
<script type="text/javascript">
/*$('.menu a').click(function(){
	var href=$(this).attr('href')
	$('#jiazai').panel('refresh',href);
	return false;
});*/


$(function(){
	$('#dlg').dialog('close');
});
$(document).ready(
		function() {
			//当页面加载完成时，准备树结点数据
			var treeData1 = [ {
				text : "系统管理",
				children : [ {
					text : "管理员操作",
					attributes : {
						url : "toadmin"
					}
				}/* , {
					text : "日志管理",
					attributes : {
						url : "yyyback/sys/logs/log.jsp"
					}
				} */ ]
			} ];

			var treeData2 = [ {
				text : "数据字典",
				children : [ {
					text : "公司简介",
					attributes : {
						url : "datadict_introduction_selectDatadict.action?type=公司简介"
					}
				}, /* {
					text : "销售网络",
					attributes : {
						url : "datadict_salesnet_selectDatadict.action?type=销售网络"
					}
				}, */ {
					text : "页脚文字",
					attributes : {
						url : "datadict_footwords_selectDatadict.action?type=页脚文字"
					}
				},{
					text : "公司logo",
					attributes : {
						url : "logo.jsp"
					}
				} ,{
					text : "前台大图",
					attributes : {
						url : "yyyback/datadict/bigpic.jsp"
					}
				} ] 
			} ];
			
			var treeData3 = [ {
				text : "新闻管理",
				children : [ {
					text : "公司新闻",
					attributes : {
						url : "tocompanynews"
					}
				} ]
			} ];
			
			var treeData4 = [ {
				text : "产品管理",
				children : [ {
					text : "类别管理",
					attributes : {
						url : "yyyback/product/producttype.jsp"
					}
				}, {
					text : "产品管理",
					attributes : {
						url : "yyyback/product/products.jsp"
					}
				} ]
			} ];
			
			var treeData5 = [ {
				text : "课程体系",
				attributes : {
					url : "tocoursys",
				}
			} ];
			
			var treeData6 = [ {
				text : "学员项目",
				attributes : {
					url : "toprojects"
				}
			} ];
			var treeData7= [ {
				text : "关于",
				children : [ {
					text : "关于公司介绍",
					attributes : {
						url : ""
					}
				} , {
					text : "公司活动介绍",
					attributes : {
						url : ""
					}
				}  ]
			} ];
			var treeData8= [ {
				text : "人才招聘",
				children : [ {
					text : "招聘信息",
					attributes : {
						url : "tojob"
					}
				} , {
					text : "应聘信息",
					attributes : {
						url : "toapply"
					}
				}  ]
			} ];
			
			 var treeData9 = [ {  /*  7.26去掉留言模块 */
				text : "留言管理",
				attributes : {
					url : "yyyback/message/message.jsp"
				}
			} ]; 
			/*  var treeData9 = [ {
				text : "浏览统计",
				attributes : {
					url : "yyyback/count/view.jsp"
				}
			} ];  */
			var treeData10 = [ {
				text : "友情链接",
				attributes : {
					url : "yyyback/friendlink/friendlink.jsp"
				}
			} ];
			//css
			var treeData11 = [ {
				text : "前台管理",
				children : [ {
					text : "样式管理",
					attributes : {
						url : "yyyback/model/modelView.jsp"
					}
				}, {
					text : "特效管理",
					attributes : {
						url : "yyyback/model/modelJs.jsp"
					}
				}, {
					text : "一键换肤",
					attributes : {
						url : "yyyback/model/easyChange.jsp"
					}
				} ]
				
			} ];
			//还原
			var treeData12 = [ {
				text : "一键还原"
			} ];

			$('#tt1').tree({
				data : treeData1
			});
			$('#tt2').tree({
				data : treeData2
			});
			 $('#tt3').tree({
				data : treeData3
			}); 
			$('#tt4').tree({
				data : treeData4
			});
			$('#tt5').tree({
				data : treeData5
			});
			$('#tt6').tree({
				data : treeData6
			});
			$('#tt7').tree({
				data : treeData7
			});
			$('#tt8').tree({
				data : treeData8
			}); 
			/* $('#tt9').tree({
				data : treeData9
			}); */
			$('#tt11').tree({
				data : treeData11
			});
			$('#tt10').tree({
				data : treeData10
			});
			
			$('#tt12').tree({
				data : treeData12
			});

			$(".easyui-tree").tree({
				onContextMenu : function(e, node) {
					e.preventDefault();
					$("#mm").menu("show", {
						left : e.pageX,
						top : e.pageY
					}).data("tabTitle", node.text);
				},
				onClick : function(node) {
					//打开新的tab
					open(node.text, node.attributes.url);
				}
			});
			
			$(".backup").tree({
				onClick : function(node) {
					$('#dlg').dialog('open');
				}
			});
			
			//打开面板，并加载页面
			function open(text, url) {
				if ($("#tabs").tabs("exists", text)) {
					//如果这块面板已经打开，则选定它
					$("#tabs").tabs("select", text);
				} else {
					$("#tabs").tabs("add", {
						title : text,
						selected : true,
						closable : true,
						href : url,
						tools : [ {
							iconCls : "icon-reload",
							handler : function() {
								//刷新
							}
						} ]
					});
				}
			}

			//给整块tabs绑定上下文菜单
			$("#tabs").tabs({
				onContextMenu : function(e, title, index) {
					e.preventDefault();
					$("#mm").menu("show", {
						left : e.pageX,
						top : e.pageY
					}).data("tabTitle", title); //通过data方法来增加一个属性tabTitle存到上下文菜单对象menu中
				}
			});

			//给上下文菜单绑定单击事件
			$("#mm").menu({
				onClick : function(item) {
					//this指的就是当前选的上下文菜单，最好在它里面存一个当前选的tab的名字    tabTitle
					closeTab(this, item.name); //item.name指的是关闭， 关闭其它  关闭所有
				}
			});

			function closeTab(menu, type) {
				//取出tabTitle名字
				var tabTitle = $(menu).data("tabTitle");
				var tabs = $("#tabs"); //取出tabs
				if (type == "close" && tabTitle != "首页") {
					tabs.tabs("close", tabTitle);
					return;
				}
				//取出所有的tab集合
				var allTabs = tabs.tabs("tabs");

				var closeTabsTitle = [];//定义一个数组，用于存要关闭的tab
				//循环所有的tab来关闭
				$.each(allTabs, function() {
					//特征：1.可关闭  2.要关闭
					var opt = $(this).panel("options");
					if (opt.closable && type == "closeAll") {
						closeTabsTitle.push(opt.title);
					} else if (opt.closable && type == "closeOthers"
							&& opt.title != tabTitle) {
						closeTabsTitle.push(opt.title);
					}
				});
				for ( var i = 0; i < closeTabsTitle.length; i++) {
					tabs.tabs("close", closeTabsTitle[i]);
				}
			}
		});

</script>

</html>