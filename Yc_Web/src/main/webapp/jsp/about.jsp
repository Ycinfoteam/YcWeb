<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false" %>
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
    
    <link rel="shortcut icon" href="../images/logo.png">
    <title>源辰信息科技官网</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" media="screen and (min-width: 1024px)" href="css/newcomputer.css">
    <link rel="stylesheet" href="css/about.css">
    <link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 1024px)" href="css/pad.css">
    <link rel="stylesheet" media="screen and (max-width: 768px)" href="css/phone.css">

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
		<li class="li1"><a href="index.html" target="_blank" >${title[0]}</a></li><h1 class="h1"></h1>
		<li class="li2"><a href="teacher.html" target="_blank">${title[1] }</a></li>
		<li class="li3"><a href="subject.html">${title[2] }</a></li>
		<li class="li4"><a href="studentProject.html">${title[3] }</a></li>
		<li class="li5"><a href="findWork.html">${title[4] }</a></li>
		<li class="li6"><a href="about.html">${title[5] }</a></li>
		<li class="li7"><a href="company.html">${title[6] }</a></li>
    </ul>
</div>


<div id="main">
    <div id="main_L">
        <a href=""><img src="images/topAd.jpg"/></a>
        <div class="main_L_d">
            <p class="teacher_title">衡阳源辰IT培训学校 > 关于源辰</p>
            <div class="aboutMe">
                <h3>关于源辰</h3>
                <p class="about_title">发布：衡阳源辰IT培训学校      来源：关于源辰     时间：2016-08-03</p>
                <p>
                  ${content } 
                </p>
                <a href="job.html" style="padding-left:555px;font-size:15px;">>>>招聘信息</a>
                <br/>
            </div>

        </div>
    </div>
    <div id="main_R">
        <div class="kaiban">
            <p class="kbtitle">最新开班日期 | <a href="">更多</a></p>
            <div class="kb1">
                <dd><img src="images/qianrushi.jpg"/></dd>
                <dd class="kbtext">
                    <h5>嵌入式培训班</h5>
                    <p>开班日期：2月28日</p>
                    <a href="" class="kbtextInp1">我要咨询</a>
                    <a href="toStudentEnroll" class="kbtextInp2">我要报名</a>
                </dd>
            </div>
            <div class="kb1">
                <dd><img src="images/bigdata.jpg"/></dd>
                <dd class="kbtext">
                    <h5>大数据培训班</h5>
                    <p>开班日期：2月28日</p>
                    <a href="" class="kbtextInp1">我要咨询</a>
                    <a href="toStudentEnroll" class="kbtextInp2">我要报名</a>
                </dd>
            </div>
            <div class="kb1">
                <dd><img src="images/qianduan.jpg"/></dd>
                <dd class="kbtext">
                    <h5>Web前端培训班</h5>
                    <p>开班日期：2月28日</p>
                    <a href="" class="kbtextInp1">我要咨询</a>
                    <a href="toStudentEnroll" class="kbtextInp2">我要报名</a>
                </dd>
            </div>
            <div class="kb1">
                <dd><img src="images/javaLogo.jpg"/></dd>
                <dd class="kbtext">
                    <h5>JAVA培训班</h5>
                    <p>开班日期：2月28日</p>
                    <a href="#" class="kbtextInp1">我要咨询</a>
                    <a href="toStudentEnroll" class="kbtextInp2">我要报名</a>
                </dd>
            </div>

            <p class="ycNews">源辰新闻 | <a href="">更多</a></p>
            <ul>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
                <li><a href="">+ Win10用户数量下滑，...</a></li>
            </ul>
        </div>
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
</body>
</html>