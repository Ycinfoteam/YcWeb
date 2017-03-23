
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
	
	
});
