<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 在jsp中加入基底网址，防止部分相对路径带来的路径拼接错误,只能对jsp界面有效 -->
<% 
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath %>">
    <meta charset="UTF-8">
    <title>源辰信息科技官网</title>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="max-age=7200" />
    <meta http-equiv="expires" Content="Fri, 01 Sep 2017 08:00:00 GMT">
    <meta name="Keywords" Content="源辰,源辰信息,源辰信息科技,源辰信息科技官网,源辰信息科技有限公司">
    <meta name="Description" Content="公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。我们的宗旨是服务于学生，致力于企业。">
    <link rel="shortcut icon" href="images/logo.png">
    <title>源辰信息科技官网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
       <link rel="stylesheet" href="css/student.css">
      <!--  <link rel="stylesheet" href="css/lightbox.css"/> --> 
    <link rel="stylesheet" media="screen and (min-width: 1024px)" href="css/newcomputer.css">
    <link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 1024px)" href="css/pad.css">
    <link rel="stylesheet" media="screen and (max-width: 768px)" href="css/phone.css">
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.lazyload.js" type="text/javascript"></script>
    <script src="js/teacher.js" type="text/javascript"></script>
       <!--  <script src="js/lightbox.js" type="text/javascript"></script> -->
    
</head>
<body>
<div id="header">
    <div id="logo" class="site-logo">
        <div>
            <h1>源辰信息科技</h1>
            <h3>yuan chen info tech</h3>
        </div>
    </div>
    <ul id="nav">
            <li class="li1"><a href="jsp/index.jsp" target="_blank" >首页</a></li><h1 class="h1"></h1>
        <li class="li2"><a href="jsp/teacher.jsp" target="_blank">师资介绍</a></li>
        <li class="li3"><a href="jsp/subject.jsp" target="_blank">课程体系</a></li>
        <li class="li4"><a href="topreprojects" target="_blank">学员项目</a></li>
        <li class="li5"><a href="jsp/findWork.jsp" target="_blank">就业详情</a></li>
        <li class="li6"><a href="jsp/about.jsp" target="_blank">关于源辰</a></li>
        <li class="li7"><a href="jsp/company.jsp" target="_blank">公司历史</a></li>
    </ul>
</div>

<div class="kctx" style="margin-left: 180px;">
    <div class="kctx_title" >
        衡阳源辰IT培训学校 > 学员项目
    </div>
    <div id="project">
    <ul class="pro"></ul>
    </div>
    </div>
<div id="footer">
    <div class="address">
        <p>
            <span>电话：0734-8355998</span>
            <span>QQ：1728952785</span>
            <span>邮政编码：421141</span>
        </p>
        <p>
            <span>版权所有 &copy; CopyRight 2016 源辰信息科技有限公司</span>
            <span>地址：衡阳市解放西路丽天名园905室</span>
        </p>
    </div>
</div>
<script>
$.post('topreprojects',function(data){
	//data=data.rows;
	//显示课程体系信息
	showProjects(data);
},'json');
function showProjects(data){
	for(var i=0;i<data.length;i++){
		var p_pic=data[i].p_pic.replace(",","");
		p_pic=p_pic.substring(22); 
		//$('#projects').prepend('<a id="lii"><img id="pic" class="lazyloads" height="300" width="350" src="../'+p_pic+'"visibility="hidden""></a>');
	$('ul.pro').prepend('<li><img src="../'+p_pic+'" data-original="../'+p_pic+'" alt="'+data[i].p_name+'"/></li>');
	}
}

</script>
	<script src="js/index.js" type="text/javascript"></script>

</body>
</html>