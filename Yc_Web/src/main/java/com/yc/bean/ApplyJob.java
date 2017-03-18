package com.yc.bean;

import java.io.Serializable;

/**
 * 应聘申请表
 * 
 * @author S3
 *
 */
public class ApplyJob implements Serializable {

	private static final long serialVersionUID = -1944019079338999232L;

	private Integer a_id;
	private String a_name; // 姓名
	private String a_tel; // 电话
	private String a_email; // 邮箱
	private String a_orientation; // 方向
	private String a_detail; // 自我简介
	private String a_time; // 申请时间
	private Integer a_status; // 0 待审核，1 已审核

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

	public String getA_tel() {
		return a_tel;
	}

	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	public String getA_orientation() {
		return a_orientation;
	}

	public void setA_orientation(String a_orientation) {
		this.a_orientation = a_orientation;
	}

	public String getA_detail() {
		return a_detail;
	}

	public void setA_detail(String a_detail) {
		this.a_detail = a_detail;
	}

	public String getA_time() {
		return a_time;
	}

	public void setA_time(String a_time) {
		this.a_time = a_time;
	}

	public Integer getA_status() {
		return a_status;
	}

	public void setA_status(Integer a_status) {
		this.a_status = a_status;
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
		return "Applyjob [a_id=" + a_id + ", a_name=" + a_name + ", a_tel=" + a_tel + ", a_email=" + a_email
				+ ", a_orientation=" + a_orientation + ", a_detail=" + a_detail + ", a_time=" + a_time + ", a_status="
				+ a_status + "]";
	}

}
