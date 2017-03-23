<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%
	String path=request.getContextPath();//  /douban
	//http     ://  localhost :  8080 /  douban
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath %>">
<title>修改学员项目</title>
<!-- <style type="text/css">@import url("<c:url value="css/main.css"/>");</style> -->
</head>
<body>
<div id="global">
<form:form commandName="projects"  action="admin/updateprojects.action"  enctype="multipart/form-data" method="post">
    <fieldset>
        <legend>修改学员项目</legend>
         <form:hidden path="p_id"/>  
        <p>
            <label for="p_name">项目名: </label>
            <form:input id="p_name" path="p_name"/>
        </p>
        <p>
            <label for="p_developer">开发者: </label>
            <form:input id="p_developer" path="p_developer"/>
        </p>
        <p>
            <label for="p_time">开发时间 </label>
            <form:input id="p_time" path="p_time" onKeydown="if(event.keyCode==13)return false;"/>
        </p>
        <p>
            <label for="p_addr">开发地址: </label>
             $ <form:input id="p_addr" path="p_addr"/>
        </p>
        	<p>
        	<label for="description">详情：</label>
        	<form:input id="description" path="description"/>
        	</p>
        	<p>
        	<label for="p_pic">已上传图片：</label>
        	<ul>
        	<c:forEach items="${projects.p_picStringList }" var="p_picUrl">
        	<li><a href="${p_picUrl }">下载电子书</a></li>
        	</c:forEach>
        	</ul>
        	<div id="uploadFiles">
        	重新上传电子书:<input type="file" name="p_picUrl"/> <input type="file" name="p_picUrl"/>
        	</div></p>
        	        <p id="buttons">
            <input id="reset" type="reset" tabindex="4">
            <input id="submit" type="submit" tabindex="5" value="修改">
        </p>
    </fieldset>
</form:form>
</div>
</body>
</html>