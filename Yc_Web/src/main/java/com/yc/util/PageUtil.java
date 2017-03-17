package com.yc.util;

/**
 * 分页工具
 * @author S3
 *
 */
public class PageUtil {

	public static int judgeStart(Integer page, Integer rows){
		if(page!=null && page!=null){
			int start=(page-1)*rows;
			return start;
		}
		return 0;
	}
	
	public static int judgeOffset(Integer rows){
		if(rows!=null){
			int offset=rows;
			return offset;
		}
		return 2;
	}
}
