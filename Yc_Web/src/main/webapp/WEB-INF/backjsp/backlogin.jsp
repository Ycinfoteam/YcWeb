<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//基底网址
	String path= request.getContextPath();
	//			http  					 :// 		localhost		   :		8080         /douban	/
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	height:100px;
	background-color:#85B3C2;
}
#logo{
	width:550px;
	height:110px;
/* 	border:2px yellow solid; */
	margin-top:20px;
}

#login {
	margin:auto;
	height:430px;
	width:450px;
 	border:2px black solid; 
 	border-radius:20px;
 	background-color: #F3F3F3;
 	margin-top:80px;
	
}

#login_form {
/* 	border:2px white solid; */
	width: 550px;
	height: 160px;
	display:inline-block;
	margin:auto;

}
#login_form label{
	width:80px;
	text-align: center;
	display:inline-block;
	padding-left:100px;
}

#login_form input {
	margin-top:20px;
	border-radius:5px;
}

#submit{
	width:80px;
	margin-left:128px;
	border:none;
	font-size:16px;
}
#submit:hover{
	background-color: #EAE7C7;
}
#forget{
	width:80px;
	margin-left:30px;
	margin-top:25px;
	border:none;
	font-size:16px;
}
#forget:hover{
	background-color: #EAE7C7;
}
a:hover{
	background-color: #EAE7C7;
}
img{
	display:inline-block;
	width:75px;
	height:85px;
	margin-top:24px;
	margin-left:80px;
}
#title{
	float:right;
	margin-right:195px;
	margin-top:2px;
	height:110px;	
}
h1{
	color:orange;
}
h3{
	color:orange;
	margin-top:-5px;
}
.error{
	color:orange;
	margin-left:90px;
	text-align: center;
	width:300px;
	height:20px;

}
</style>
<meta charset="UTF-8">
<title>源辰官网后台登录</title>
<base href="<%=basePath %>">
</head>
<body>
	<div id="login">
		<div id="logo">
			<img alt="" src="images/logo.png">
			<div id="title">
			<h1>源辰信息科技</h1>
	            <h3>yuan chen info tech</h3>
			</div>
			
    	</div>
		<form id="login_form">
			<label>用户名:</label> 
			<input name="a_name" type="text" placeholder="请输入用户名..."><br/>
			<label>密&nbsp;&nbsp;&nbsp;码:</label>
			<input name="a_pwd" type="password" placeholder="请输入密码..."/><br/>
			<label>验证码:</label>
			<input type="text" name="validateCode"/>
			<img id="randImg" border=0 src="imageCode.jsp" style="height:17px; margin-left:145px;">
			<a href="javascript:void(0);" onclick="loadImage()" style="color:black;text-decoration:none;margin-left:15px;">换一张</a><br/>
			<input id="submit" type="button" onclick="login()"  value="登    录" />
			<input id="forget" type="button" onclick="forget()" value="忘记密码"/><br/>
		</form>
		<p class="error"></p>
	</div>
</body>

<script type="text/javascript" src="backjs/jquery.min.js"></script>
<script type="text/javascript">

	 function login(){
		var a_name=$('input[name="a_name"]').val();
		var a_pwd=$('input[name="a_pwd"]').val();
		var validateCode=$('input[name="validateCode"]').val();
		$.ajax({
			url:'login', 
			type:'post',
			dataType:'json',
			data:{
				a_name:a_name,
				a_pwd:a_pwd,
				validateCode:validateCode
			},
			success:function(data){
				 if(data==1){
					 window.location.href="tobackmain";
				}else if(data==0){
					$('.error').append('用户名或密码错误，请检查后重新登录。');
					$('input[name="a_pwd"]').click(function(){
						$(this).val('');
						$('input[name="validateCode"]').val('');
						$('.error').empty('');
						loadImage();
					});
					loadImage();
				}else if(data==2){
					$('.error').append('验证码错误');
					$('input[name="a_pwd"]').click(function(){
						$(this).val('');
						$('input[name="validateCode"]').val('');
						$('.error').empty('');
						loadImage();
					});
				} 
			}
		});
	}
	 
	//刷新验证码
	function loadImage(){
		var img=document.getElementById("randImg");
		img.src="imageCode.jsp?r="+Math.random();
	}
	
</script>
</html>