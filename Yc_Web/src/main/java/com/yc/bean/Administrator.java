package com.yc.bean;

import java.io.Serializable;

/**
 * 行政管理员
 * 
 * @author S3
 *
 */
public class Administrator implements Serializable {

	private static final long serialVersionUID = -307308388829592256L;
	private String name;
	private String tel;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
