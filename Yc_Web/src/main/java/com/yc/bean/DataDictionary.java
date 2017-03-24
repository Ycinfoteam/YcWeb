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

	private Integer id;
	private String footer; // 页脚文字
	private String description; // 公司简介
	private String logo; // 公司logo

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Override
	public String toString() {
		return "DataDictionary [id=" + id + ", footer=" + footer + ", description=" + description + ", logo=" + logo
				+ "]";
	}

}
