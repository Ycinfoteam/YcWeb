package com.yc.utils;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

/**
 * 短信工具类
 * @author S3
 *
 */
public class MessageUtil {

	private static String url="http://gw.api.taobao.com/router/rest";
	private static String appkey="23705431";
	private static String secret="e08df7bef7d24564ca24739f0969f344";
	
	/**
	 * 短信工具
	 * @param name	收信人姓名
	 * @param tel	收信人电话
	 * @param typeId	模板ID
	 * @throws ApiException
	 */
	public static void sendMessage(String name,String tel,String typeId) throws ApiException{
		
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("李润泽");
		req.setSmsParamString( "{name:'"+name+"'}");
		req.setRecNum(tel);
		req.setSmsTemplateCode(typeId);
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
	}
}
