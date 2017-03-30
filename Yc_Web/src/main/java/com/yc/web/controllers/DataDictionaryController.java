package com.yc.web.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yc.bean.DataDictionary;
import com.yc.biz.DataDictionaryBiz;

@Controller
public class DataDictionaryController {
	
	private static final Logger log=Logger.getLogger(DataDictionaryController.class);

	private DataDictionaryBiz dataDictionaryBiz;

	@Resource(name="dataDictionaryBizImpl")
	public void setDataDictionaryBiz(DataDictionaryBiz dataDictionaryBiz) {
		this.dataDictionaryBiz = dataDictionaryBiz;
	}
	
	
	@RequestMapping(value="findDataDictionary",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findDataDictionary(@ModelAttribute DataDictionary dataDictionary){
		log.info("findDataDictionary called...");
		List<DataDictionary> list=this.dataDictionaryBiz.findDataDictionary(dataDictionary);
		Gson gson =new Gson();
		return gson.toJson(list);
	}
	
	@RequestMapping(value="updateDataDictionary")
	public @ResponseBody int updateDataDictionary(@ModelAttribute DataDictionary dataDictionary){
		log.info("updateDataDictionary called...");
		this.dataDictionaryBiz.updateDataDictionary(dataDictionary);
		return 1;
	}
}
