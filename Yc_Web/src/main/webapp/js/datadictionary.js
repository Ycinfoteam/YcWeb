         
$(function(){
	
	$.ajax({	//拼接公司简介
		url:'../findDataDictionaryDescription',
		type:'post',
		dataType:'json',
		success:function(data){
			$('#finddescription').empty('');
			$('#finddescription').append(data);
		}
			
	});

	$.ajax({	//拼接footer部分
		url:'../findDataDictionaryFooter',
		type:'post',
		dataType:"json",
		success:function(data){
			var content=new Array();
			content=data.split("/"); 
			$('#findfooter').empty('');
			var str='<p><span>'+content[0]+'</span><span>'+content[1]+'</span><span>'+content[2]+'</span></p>'
				+'<p><span>'+content[3]+'</span><span>'+content[4]+'</span></p>'
			$('#findfooter').append(str);
		}
	});
	
});
