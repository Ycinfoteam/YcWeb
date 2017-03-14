package com.yc.bean;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Coursys implements Serializable {

	private static final long serialVersionUID = -7346238853185557362L;
	private Integer cs_id;
	private String cs_name;     //方向名
	private String cs_pic="";      //图片说明
	private String cs_version;  //版本
	private String cs_text;     //文字说明
	private Integer cs_status;	//状态（1显示，0不显示）
	private List<MultipartFile> picUrl;//对应界面上的            	<input name="pdfsUrl" type="file">
	
	public List<MultipartFile> getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(List<MultipartFile> picUrl) {
		this.picUrl = picUrl;
	}
	public Integer getCs_status() {
		return cs_status;
	}
	public void setCs_status(Integer cs_status) {
		this.cs_status = cs_status;
	}
	public Integer getCs_id() {
		return cs_id;
	}
	public void setCs_id(Integer cs_id) {
		this.cs_id = cs_id;
	}
	public String getCs_name() {
		return cs_name;
	}
	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}
	public String getCs_pic() {
		return cs_pic;
	}
	public void setCs_pic(String cs_pic) {
		this.cs_pic = cs_pic;
	}
	public String getCs_version() {
		return cs_version;
	}
	public void setCs_version(String cs_version) {
		this.cs_version = cs_version;
	}
	public String getCs_text() {
		return cs_text;
	}
	public void setCs_text(String cs_text) {
		this.cs_text = cs_text;
	}
	
}
