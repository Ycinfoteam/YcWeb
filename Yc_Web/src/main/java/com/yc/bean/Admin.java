package com.yc.bean;

import java.io.Serializable;

/**
 * 管理员
 * 
 * @author S3
 *
 */
public class Admin implements Serializable {

	private static final long serialVersionUID = 371525309521087732L;

	private Integer a_id;
	private String a_name;
	private String a_pwd;

	private Integer start; // 起始行
	private Integer offset; // 偏移量

	public Integer getA_id() {
		return a_id;
	}

	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
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

	@Override
	public String toString() {
		return "Admin [a_id=" + a_id + ", a_name=" + a_name + ", a_pwd=" + a_pwd + ", start=" + start + ", offset="
				+ offset + "]";
	}

}
