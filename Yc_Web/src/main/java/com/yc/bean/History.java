package com.yc.bean;

import java.io.Serializable;
import java.sql.Time;

public class History implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3585418809341774140L;
	private Integer h_id;
	private String h_createtime;
	private String h_content;
	private String h_creator;
	private String h_reg;
	private Integer start; // 起始行
	private Integer offset; // 偏移量
	
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
	public Integer getH_id() {
		return h_id;
	}
	public void setH_id(Integer h_id) {
		this.h_id = h_id;
	}
	
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String h_content) {
		this.h_content = h_content;
	}
	
	public String getH_creator() {
		return h_creator;
	}
	public void setH_creator(String h_creator) {
		this.h_creator = h_creator;
	}
	public String getH_createtime() {
		return h_createtime;
	}
	public void setH_createtime(String h_createtime) {
		this.h_createtime = h_createtime;
	}
	public String getH_reg() {
		return h_reg;
	}
	public void setH_reg(String h_reg) {
		this.h_reg = h_reg;
	}
	@Override
	public String toString() {
		return "History [h_id=" + h_id + ", h_createtime=" + h_createtime + ", h_content=" + h_content + ", h_creator="
				+ h_creator + ", h_reg=" + h_reg + "]";
	}
	
	
}
