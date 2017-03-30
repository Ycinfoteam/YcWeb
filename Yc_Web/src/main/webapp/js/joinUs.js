//查出所有的工作种类
$(function(){
	
	$.ajax({
		url:'../showJobType',
		type:'post',
		dataType:"json",
		success:function(data){
			$('#findAllJobType').empty('');
			var str='';
			for(var i=0;i<data.length;i++){
				str+='<option value='+data[i].j_id+'>'+data[i].j_name+'</option>'
			}
			$('#findAllJobType').append(str);
		}
	});

	$('input[name="a_email"]').blur(function(){
		
		var email=$(this).val();
		if(!isEmail(email)){
			alert('邮箱格式不正确');
		}
	});
	
});

//邮箱验证
function isEmail(str){
	var reg=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+$/;
	return reg.test(str);
}

//form表单验证

