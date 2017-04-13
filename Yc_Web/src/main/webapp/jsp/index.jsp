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
	<meta http-equiv="Cache-Control" content="max-age=7200" />
	<meta http-equiv="expires" Content="Fri, 01 Sep 2017 08:00:00 GMT">
	<meta name="Keywords" Content="源辰,源辰信息,源辰信息科技,源辰信息科技官网,源辰信息科技有限公司">
	<meta name="Description" Content="公司是由多名资深项目经理共同组建而成，主要技术骨干在国内外从事多年软件项目研发工作，有在大型软件公司担任多年项目经理的经验；紧跟国内外先进的主流技术，具有较强的软件开发管理和技术指导能力。公司的发展目标是成为领先的软件开发服务商和IT软件工程师的供应商，我们致力于融合先进管理理念和信息技术，为企业和学员创造价值。我们的宗旨是服务于学生，致力于企业。">
	<link rel="shortcut icon" href="images/logo.png">
	<title>源辰信息科技官网</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<link rel="stylesheet" media="screen and (min-width: 1024px)" href="css/newcomputer.css">
	<link rel="stylesheet" media="screen and (min-width: 768px) and (max-width: 1024px)" href="css/pad.css">
	<link rel="stylesheet" media="screen and (max-width: 768px)" href="css/phone.css">	
	
</head>
<body>

		</div>
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
	<div id="banner">
		<div id="banner_content">
			<p class="first_des">${company[0] }</p>
			<p>${company[1] }</p>
			<p>${company[2] }</p>
		</div>
	</div>
	<div id="content">
		<div id="teacher">
			<h3>师资介绍</h3>

            <div id="toggle_team">
                <span class="choice_team">教学团队</span>
                <span>管理团队</span>
                <i id="team_underline"></i>
            </div>

			<div id="teacher_content">
				<div id="teacher_team">
					<ul>
					 <c:forEach items="${teacherinfo}" var="tcinfo">
						<li id="zy">
                            <img src="${tcinfo.t_pic }" data-original="${tcinfo.t_pic }" />
                            <h4>${tcinfo.t_name}</h4>
                            <p>${tcinfo.t_motto }</p>
                            <p id="zy_intro" class="teacher_intro"><span>技术方向：</span>${tcinfo.t_skill }</p>
                        </li>
                   </c:forEach>
					</ul>
                </div>
                <div id="manage_team" style="display: none;">
					<ul>
					<!-- 数据库中无管理团队 -->
						<li id="ly">
							<img src="images/loading.gif" data-original="images/teacher_ly.png" />
							<h4>刘源老师</h4>
							<p>总经理</p>
							<p id="ly_intro" class="teacher_intro"><span>经验：</span>10年的互联网行业人力资源管理经验，主要负责制度制定、人才储备及阶梯队伍建设、年度培训计划制定与实施对互联网行业团队管理及团队建设工作有一定的经验，专注互联网行业员工管理培训及职业生涯规划领域。</p>
						</li>
						<li id="hcy">
							<img src="images/loading.gif" data-original="images/teacher_hcy.png" />
							<h4>黄初云老师</h4>
							<p>教学行政管理</p>
							<p id="hcy_intro" class="teacher_intro"><span>经验：</span>致公大学护理学讲师、班主任；长沙麓山专修学院，主管教学，班主任及学生档案管理；现任衡阳市源辰信息有限公司教学行政管理，班主任。</p>
						</li>
					</ul>
                </div>
			</div>
		</div>
			<div id="course">
			<h3>课程体系</h3>
			<div id="course_content">
				<ul>
				<!-- 中文乱码 -->
					<li class="j2ee course_current">
						<span>J2EE开发工程师</span>
					</li>
					<li class="html5">
						<span>前端工程师</span>
					</li>
					<li class="ubuntu">
						<span>嵌入式软件工程师</span>
					</li>
					<li class="cloud">
						<span>大数据开发工程师</span>
					</li>
				</ul>
				<div id="course_img">
					<img src="images/loading.gif" data-original="images/J2EE开发工程师.png" alt="J2EE开发工程师">
				</div>
			</div>
		</div>
		<div id="project">
			<h3>学员项目</h3>
			<ul>
			<!-- 否则放大镜功能失效  因为它放大镜的放大图片名字是前台传送-->
				<li><img src="images/loading.gif" data-original="images/proj_1.jpg" alt="前端项目-网易云音乐"></li>
				<li><img src="images/loading.gif" data-original="images/proj_2.jpg" alt="大数据项目-分析与报表"></li>
				<li><img src="images/loading.gif" data-original="images/proj_3.jpg" alt="大数据项目-数据操作"></li>
				<li><img src="images/loading.gif" data-original="images/proj_4.jpg" alt="Java项目-人事管理系统"></li>
				<li><img src="images/loading.gif" data-original="images/proj_5.jpg" alt="Java项目-三国杀"></li>
			</ul>
		</div>
		<div id="work">
			<h3>就业详情</h3>
				  <div id="jobbox">
    <ul class="ii"></ul>
    </div>
		</div>

	</div>
	<div id="active">
		<h1>公司活动</h1>
		<div id="act_content">
			<ul>
				<c:forEach items="${activties }"  var="ac">
					<li><a target="_blank" href="${ac }"><img src="${ac }"></a></li>
				</c:forEach>
			</ul>
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


	<div id="floatBox">
        <a id="arrow_up">
            <span class="gotop"></span>
            <span class="text">回到顶部</span>
        </a>
        <a id="code"   class="a2">
            <span class="code"></span>
            <span class="text">扫码重播</span>
            <img src="images/code.png"/>
        </a>
        <a id="qq_converse" class="a3" href="tencent://Message/?Uin=1728952785&websiteName=www.hyycinfo.com&Menu=yes">
            <span class="kefu"></span>
            <span class="text">Q Q交谈</span>
        </a>
		<!--<a id="qq_converse"  class="a3" href="tencent://Message/?Uin=1728952785&websiteName=www.hyycinfo.com&Menu=yes"></a>-->
	</div>
	<!-- <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script> -->
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery.lazyload.js" type="text/javascript"></script>
	<script src="js/newindex.js" type="text/javascript"></script>
	<script type="text/javascript">
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
	
	$.post('to')
	</script>
</body>
</html>