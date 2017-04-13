package com.yc.bean;

import java.io.Serializable;
import java.util.List;

public class Students implements Serializable {

	private static final long serialVersionUID = -126555970239925228L;
	private Integer s_id;
	private List<Integer> s_ids;
	private String s_name; // 姓名
	private String s_tel; // 电话
	private String s_direction; // 意向方向
	private Integer s_status;// 是否发送了开班信息
	private String s_date;
	private Integer start; // 起始行
	private Integer offset; // 偏移量

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public List<Integer> getS_ids() {
		return s_ids;
	}

	public void setS_ids(List<Integer> s_ids) {
		this.s_ids = s_ids;
	}

	public Integer getS_status() {
		return s_status;
	}

	public void setS_status(Integer s_status) {
		this.s_status = s_status;
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

	public Integer getS_id() {
		return s_id;
	}

	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_tel() {
		return s_tel;
	}

	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}

	public String getS_direction() {
		return s_direction;
	}

	public void setS_direction(String s_direction) {
		this.s_direction = s_direction;
	}

	@Override
	public String toString() {
		return "Students [s_id=" + s_id + ", s_ids=" + s_ids + ", s_name=" + s_name + ", s_tel=" + s_tel
				+ ", s_direction=" + s_direction + ", s_status=" + s_status + ", s_date=" + s_date + ", start=" + start
				+ ", offset=" + offset + "]";
	}

}
