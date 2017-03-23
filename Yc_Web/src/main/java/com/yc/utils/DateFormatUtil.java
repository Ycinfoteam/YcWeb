package com.yc.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间格式化
 * @author S3
 *
 */
public class DateFormatUtil {

	/**
	 * 
	 * @param date	     系统时间
	 * @param format  格式化  	eg: yyyy-MM-dd
	 * @return
	 */
	public static String ycDateformat(Date date,String format){
		
		SimpleDateFormat dateformat=new SimpleDateFormat(format);
		String d=dateformat.format( date );
		return d;
	}
}
