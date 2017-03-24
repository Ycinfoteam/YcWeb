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
	
	@RequestMapping(value="findDataDictionaryFooter",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findDataDictionaryFooter(@ModelAttribute DataDictionary dataDictionary ){
		log.info("findDataDictionaryFooter called....");
		List<DataDictionary> list=this.dataDictionaryBiz.findDataDictionary(dataDictionary);
		String footer=list.get(0).getFooter();
		Gson gson =new Gson();
		return gson.toJson(footer);
	}
	
	@RequestMapping(value="findDataDictionaryDescription",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findDataDictionarydescription(@ModelAttribute DataDictionary dataDictionary){
		log.info("findDataDictionarydescription called....");
		List<DataDictionary> list =this.dataDictionaryBiz.findDataDictionary(dataDictionary);
		String description=list.get(0).getDescription();
		Gson gson =new Gson();
		return gson.toJson(description);
	}
	
	@RequestMapping(value="findDataDictionaryLogo",produces ="text/html;charset=UTF-8")
	public @ResponseBody String findDataDictionaryLogo(@ModelAttribute DataDictionary dataDictionary){
		log.info("findDataDictionaryLogo called...");
		List<DataDictionary> list= this.dataDictionaryBiz.findDataDictionary(dataDictionary);
		String logo=list.get(0).getLogo();
		Gson gson=new Gson();
		return gson.toJson(logo);
	}
	
	@RequestMapping(value="updateFooter")
	public @ResponseBody int updateFooter(@ModelAttribute DataDictionary dataDictionary){
		log.info("updateFooter called...");
		this.dataDictionaryBiz.updateFooter(dataDictionary);
		return 1;
	}
	
	@RequestMapping(value="updateDescription")
	public @ResponseBody int updateDescription(@ModelAttribute DataDictionary dataDictionary){
		log.info("updateDescription called...");
		this.dataDictionaryBiz.updateDescription(dataDictionary);
		return 1;
	}
	
	@RequestMapping(value="updateLogo")
	public @ResponseBody int updateLogo(@ModelAttribute DataDictionary dataDictionary){
		log.info("updateLogor called...");
		this.dataDictionaryBiz.updateLogo(dataDictionary);
		return 1;
	}
	
}
