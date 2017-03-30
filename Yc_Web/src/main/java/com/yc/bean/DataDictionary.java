package com.yc.bean;

import java.io.Serializable;

/**
 * 数据字典
 * 
 * @author S3
 *
 */
public class DataDictionary implements Serializable {

	private static final long serialVersionUID = 4683805071644883651L;

	private String id; // 主键
	private String type; // 类型
	private String description; // 描述

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "DataDictionary [id=" + id + ", type=" + type + ", description=" + description + "]";
	}

}
