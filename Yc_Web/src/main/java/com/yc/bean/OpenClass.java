package com.yc.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class OpenClass {
	
	private Integer oc_id;
	private String oc_name;
	private String oc_pic;
	private String oc_time;	//创建时间
	private Integer oc_status;
	private List<MultipartFile> picUrl;//对应界面上的            	
	private Integer start; // 起始行
	private Integer offset; // 偏移量
	
	
	public Integer getOc_status() {
		return oc_status;
	}
	public void setOc_status(Integer oc_status) {
		this.oc_status = oc_status;
	}
	public String getOc_time() {
		return oc_time;
	}
	public void setOc_time(String oc_time) {
		this.oc_time = oc_time;
	}
	public List<MultipartFile> getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(List<MultipartFile> picUrl) {
		this.picUrl = picUrl;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public Integer getOc_id() {
		return oc_id;
	}
	public void setOc_id(Integer oc_id) {
		this.oc_id = oc_id;
	}
	public String getOc_name() {
		return oc_name;
	}
	public void setOc_name(String oc_name) {
		this.oc_name = oc_name;
	}
	public String getOc_pic() {
		return oc_pic;
	}
	public void setOc_pic(String oc_pic) {
		this.oc_pic = oc_pic;
	}
}
