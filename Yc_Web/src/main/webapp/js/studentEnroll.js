//发送短信验证码
var yzm;
$('input[name="yanzhengma"]').click(function(){
	var tel=$('#s_tel').val();
	$.ajax({
		url:'sendTelYZM',
		dataType:'text',
		traditional:true,
		success:function(data,status){
			if(data!=null){
				yzm=data;
				alert("请去注意查收验证码！！！");
			}
		}, 
		error:function(data,status){
			if(data==0){
				alert("发送失败！！！");
			}
		}
	});
	$('#s_tel_msg').text('10分钟内有效').css("color","red");
});

function checkname(){
	var s_name=$('#s_name').val();
	var reg=/^[\u4E00-\u9FA5A]{1,8}$/;//用户名
	if(reg.test(s_name)){
		$('#s_name_msg').text('');
		return true;
	}else if(""==s_name){
		$('#s_name_msg').text('姓名不能为空').css("color","red");
		return false;
	}else{
		$('#s_name_msg').text('请输入2~4个汉字').css("color","red");
		return false;
	}
}

function checkphone(){
	alert(1111);
	var reg=/^1[34578]\d{9}$/;//手机
	var tel=$('#s_tel').val();
	if(reg.test(tel)){
		$('#s_tel_msg1').text('');
		return true;
	}else if(""==tel){
		$('#s_tel_msg1').text('手机号码不能为空').css("color","red");
		return false;
	}else{
		$('#s_tel_msg1').text('格式有误').css("color","red");
		return false;
	}
}

function checkyzm(){
	var code=$('#yzm').val();
	if(code==yzm){
		return true;
	}else{
		$('#s_tel_msg').text('验证码错误，请重新输入').css("color","red");
		return false;
	}
}

function rex(){
	if(checktel()&&checkname()&&checkyzm()){
		$('#successmsg').text('30个工作日内请注意查收开班通知短信').css("color","red");
		return true; 
	}
		return false;
}

