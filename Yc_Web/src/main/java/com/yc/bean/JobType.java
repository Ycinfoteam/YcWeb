package com.yc.bean;

import java.io.Serializable;

//方向分类
public class JobType implements Serializable {

	private static final long serialVersionUID = -1503428153576050305L;
	private Integer j_id;
	private String j_name;
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
	public Integer getJ_id() {
		return j_id;
	}

	public void setJ_id(Integer j_id) {
		this.j_id = j_id;
	}

	public String getJ_name() {
		return j_name;
	}

	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}

	@Override
	public String toString() {
		return "JobType [j_id=" + j_id + ", j_name=" + j_name + "]";
	}

}
