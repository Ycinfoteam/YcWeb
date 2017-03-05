package com.yc.bean;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

public class Activities implements Serializable {

	private static final long serialVersionUID = 8279832372916477571L;
	private Integer ac_id;
	private Date ac_time;      //活动时间
	private String ac_illus;	//说明
	private String ac_pic;     //图片（多图）
	
	public Integer getAc_id() {
		return ac_id;
	}
	public void setAc_id(Integer ac_id) {
		this.ac_id = ac_id;
	}
	
	public Date getAc_time() {
		return ac_time;
	}
	public void setAc_time(Date ac_time) {
		this.ac_time = ac_time;
	}
	public String getAc_illus() {
		return ac_illus;
	}
	public void setAc_illus(String ac_illus) {
		this.ac_illus = ac_illus;
	}
	public String getAc_pic() {
		return ac_pic;
	}
	public void setAc_pic(String ac_pic) {
		this.ac_pic = ac_pic;
	}
	@Override
	public String toString() {
		return "Activities [ac_id=" + ac_id + ", ac_time=" + ac_time + ", ac_illus=" + ac_illus + ", ac_pic=" + ac_pic
				+ "]";
	}
	
}
