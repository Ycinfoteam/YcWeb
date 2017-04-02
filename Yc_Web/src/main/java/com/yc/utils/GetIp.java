package com.yc.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class GetIp {
/*
 * 日志对象
 */
	private static Logger log =LogManager.getLogger(GetIp.class);
	//获取Ip地址
	public String getRemortIP(HttpServletRequest request){
		if(request.getHeader("x-forwarded-for")==null){
			//log.debug("the person who "+request.getRemoteAddr()+"was logining the system.");
			return request.getRemoteAddr();
		}
	//	log.debug("the person who"+request.getHeader("x-forwarded-for")+"was logining the system.");
		return request.getHeader("x-forwarded-for");
		
	}
}
