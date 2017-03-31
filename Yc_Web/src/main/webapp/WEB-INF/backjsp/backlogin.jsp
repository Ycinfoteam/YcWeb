<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	height:100px;
	background-color:gray;
}
#logo{
	width:550px;
	height:110px;
/* 	border:2px yellow solid; */
	margin-top:120px;
}

#login {
	margin:auto;
	height:400px;
	width:550px;
/* 	border:2px red solid; */
	
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
	padding-left:140px;
	font-weight:bold;
}

#login_form input {
	margin-top:20px;
}

#submit{
	width:80px;
	margin-left:168px;
}
#forget{
	width:80px;
	margin-left:30px;
	margin-top:25px;
}

img{
	display:inline-block;
	width:75px;
	height:85px;
	margin-top:24px;
	margin-left:120px;
}
#title{
	float:right;
	margin-right:155px;
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
	margin-left:120px;

}
</style>
<meta charset="UTF-8">
<title>源辰官网后台登录</title>
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
			<input name="a_name" type="text" required="true" placeholder="请输入用户名..."><br/>
			<label>密&nbsp;&nbsp;&nbsp;码:</label>
			<input name="a_pwd" type="password" required="true" placeholder="请输入密码..."/><br/>
			<input id="submit" type="button" onclick="login()"  value="登录" />
			<input id="forget" type="button" onclick="forget()" value="忘记密码"/><br/>
		</form>
		<span class="error"></span>
	</div>
</body>

<script type="text/javascript" src="backjs/jquery.min.js"></script>
<script type="text/javascript">
	 function login(){
		var a_name=$('input[name="a_name"]').val();
		var a_pwd=$('input[name="a_pwd"]').val();
		$.ajax({
			url:'login', 
			type:'post',
			dataType:'json',
			data:{
				a_name:a_name,
				a_pwd:a_pwd
			},
			success:function(data){
				 if(data==1){
					 window.location.href="tobackmain";
				}else{
					$('.error').append('用户名或密码错误，请检查后重新登录。');
				} 
			}
		});
	}
</script>
</html>