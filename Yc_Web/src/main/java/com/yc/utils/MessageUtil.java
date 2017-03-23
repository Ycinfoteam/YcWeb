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

	public static void sendMessageToAdmin(String adminName,String adminTel) throws ApiException{
		String url="http://gw.api.taobao.com/router/rest";
		String appkey="23705431";
		String secret="e08df7bef7d24564ca24739f0969f344";
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("李润泽");
		req.setSmsParamString( "{name:'"+adminName+"'}");
		req.setRecNum(adminTel);
		req.setSmsTemplateCode("SMS_56640051");
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
	}
	
	public static void sendMessageToApply(String applyName,String applyTel) throws ApiException{
		String url="http://gw.api.taobao.com/router/rest";
		String appkey="23705431";
		String secret="e08df7bef7d24564ca24739f0969f344";
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend("123456");
		req.setSmsType("normal");
		req.setSmsFreeSignName("李润泽");
		req.setSmsParamString( "{name:'"+applyName+"'}");
		req.setRecNum(applyTel);
		req.setSmsTemplateCode("SMS_56640051");
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
	}
}
