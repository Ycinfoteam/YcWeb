$.post('toprehistory',function(datas){
	showdata(datas);
	//显示团购信息
},'json');

var data = [];
function showdata(datas){
	alert(datas);
	for(var i=0;i<datas.length;i++){
	data.push({
		'date' :datas[i].h_createtime,
		'intro' :datas[i].h_content,
		'media' :datas[i].h_creator
	})
	}
}
alert(data);
