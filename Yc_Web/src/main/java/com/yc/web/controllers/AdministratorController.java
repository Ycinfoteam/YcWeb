package com.yc.web.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.Administrator;
import com.yc.utils.JsonModel;
import com.yc.utils.PropertiesUtil;

@Controller
public class AdministratorController {
	
	private static final Logger log=Logger.getLogger(AdministratorController.class);

	@RequestMapping(value="findAdministrator",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAdministrator() throws IOException{
		log.info("findAdministrator called....");
		Properties p=PropertiesUtil.readProperties("admin.properties");
		
		Administrator administrator =new Administrator();
		administrator.setName(p.getProperty("name"));
		administrator.setTel(p.getProperty("tel")); 
		List<Administrator> list=new ArrayList<Administrator>();
		list.add(administrator);
		JsonModel model=new JsonModel();
		model.setRows(list);
		model.setTotal(1);
		Gson gson =new Gson();
		return gson.toJson(model); 
	}
	
	@RequestMapping(value="findAdministrator1",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findAdministrator1() throws IOException{
		log.info("findAdministrator1 called....");
		Properties properties=PropertiesUtil.readProperties("admin.properties");
		Gson gson =new Gson();
		return gson.toJson(properties); 
	}
	
	@RequestMapping(value="updateAdministrator")
	public @ResponseBody void updateAdministrator(@RequestParam(value="name") String name,@RequestParam(value="tel") String tel) throws IOException{
		log.info("updateAdministrator called ...");
		System.out.println(name+"--"+tel);
		PropertiesUtil.writeProperties("admin.properties", name, tel); 
	}
	
	
	
}
