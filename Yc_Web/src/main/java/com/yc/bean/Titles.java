package com.yc.bean;

import java.io.Serializable;

public class Titles implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3718706870072946424L;
	private Integer t_id;
	private String t_name;
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
	
}
