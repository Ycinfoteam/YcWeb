var data = [];
$.ajax({
	url:'toprehistory',
	type:'post',
	dataType:'json',
	async:false,
	success:function(datas){
		if(datas!=null){
			for(var i=0;i<datas.length;i++){
				data.push({
					'date' :datas[i].h_createtime,
					'intro' :datas[i].h_content,
					'media' :datas[i].h_creator
				});	
			}
		}
	}
});

