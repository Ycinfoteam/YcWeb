<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style type="text/css">
    .kctx{
    width:1000px;
    border: 1px solid #dadada;
    border-top: 4px solid #03447C;
    margin-top: 11px;
    background:white;
}

.kctx_title{
    width: 970px;
    margin: 0 auto;
    font-size: 12px;
    color: #B7B7B7;
    border-bottom: 1px solid #dbdbdb;
    padding: 15px 0 5px 0;
}

</style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" media="screen and (min-width: 1024px)" href="css/newcomputer.css">
    <link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 1024px)" href="css/pad.css">
    <link rel="stylesheet" media="screen and (max-width: 768px)" href="css/phone.css">
    <!--[if gte IE 8]>
    <link rel="stylesheet" href="css/styleforie.css">
    <![endif]-->

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/jquery.lazyload.js" type="text/javascript"></script>
    <script src="js/teacher.js" type="text/javascript"></script>
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
        <!-- .html后缀是分发器 -->
		<li class="li1"><a href="index.html">${title[0]}</a></li><h1 class="h1"></h1>
		<li class="li2"><a href="teacher.html">${title[1] }</a></li>
		<li class="li3"><a href="subject.html">${title[2] }</a></li>
		<li class="li4"><a href="studentProject.html">${title[3] }</a></li>
		<li class="li5"><a href="findWork.html">${title[4] }</a></li>
		<li class="li6"><a href="about.html">${title[5] }</a></li>
		<li class="li7"><a href="company.html">${title[6] }</a></li>
    </ul>
</div>
<div class="kctx">
    <div class="kctx_title">
        衡阳源辰IT培训学校 >就业详情
    </div>
    <div id="jobbox">
    <ul class="ii"></ul>
    </div>
</div>
<div id="footer">
    <div class="address">
        <p>
			<span>${footer[0] }</span>
			<span>${footer[1] }</span>
			<span>${footer[2] }</span>
		</p>
		<p>
			<span>${footer[3] }</span>
			<span>${footer[4] }</span>
		</p>
    </div>
</div>
<script>
$.post('toprejobdetails',function(data){
	//data=data.rows;
	//显示课程体系信息
	showJobdetails(data);
},'json');
function showJobdetails(data){
	for(var i=0;i<data.length;i++){
		var jd_pic=data[i].jd_pic.replace(",","");
		jd_pic=jd_pic.substring(22); 
		$('ul.ii').prepend('<li><img src="../'+jd_pic+'"  data-original="../'+jd_pic+'" alt=""><div><p>'+data[i].jd_name+data[i].jd_salary+' </p></div></li> ');
	}
}
</script>
</body>
</html>
