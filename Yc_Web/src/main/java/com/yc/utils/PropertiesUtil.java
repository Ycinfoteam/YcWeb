package com.yc.utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 加载  .properties 文件工具类
 * @author S3
 *
 */
public class PropertiesUtil {

	public static Map<String, String> readProperties(String file) throws IOException{
		
		Map<String, String> map=new HashMap<String,String>();
		//InputStream input =PropertiesUtil.class.getClassLoader().getResourceAsStream(file);
		String path=PropertiesUtil.class.getClassLoader().getResource(file).getPath();
		InputStream input=new FileInputStream(path);
		BufferedReader bf=new BufferedReader(new InputStreamReader(input));
		Properties p = new Properties();
		try {
			p.load(bf);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			input.close();
			bf.close();
		}
		if(p.getProperty("name")!=null && p.getProperty("tel")!=null){
			map.put("name", p.getProperty("name"));
			map.put("tel", p.getProperty("tel"));
			return map;
		}
		return null;
	}
	
	public static void writeProperties(String file,String name,String tel) throws IOException{
		FileOutputStream fos = null;
		try {
			fos=new FileOutputStream(PropertiesUtil.class.getClassLoader().getResource(file).getPath());
			
			Properties p =new Properties();
			p.setProperty("name", name);
			p.setProperty("tel", tel);
			p.store(fos,"保存");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			fos.close();
		}
	}
	 
	public static void main(String[] args) throws IOException {
		//System.out.println(readProperties("admin.properties"));
		//writeProperties("admin.properties", "李润泽", "110");
	}
}
