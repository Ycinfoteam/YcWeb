package com.yc.bean;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


/**
 * 就业详情表
 * @author S3
 *
 */
public class Jobdetails implements Serializable {

	private static final long serialVersionUID = -1722024606175467050L;
	private Integer jd_id;
	private String jd_pic; // 图片
	private String jd_name; // 学员姓名
	private String jd_salary; // 学员薪资
	private String jd_emptime; // 就业时间
	private String jd_company; // 所在公司
	private String jd_school; // 毕业学校
	private String jd_profession; // 专业
	private String jd_palace;//就业地址
	List<MultipartFile> jd_picUrl=null;
	private Integer start; // 起始行
	private Integer offset; // 偏移量
	private Integer jd_status;//就业详情
	
	public Integer getJd_status() {
		return jd_status;
	}

	public void setJd_status(Integer jd_status) {
		this.jd_status = jd_status;
	}

	public String getJd_palace() {
		return jd_palace;
	}

	public void setJd_palace(String jd_palace) {
		this.jd_palace = jd_palace;
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

	public List<MultipartFile> getJd_picUrl() {
		return jd_picUrl;
	}

	public void setJd_picUrl(List<MultipartFile> jd_picUrl) {
		this.jd_picUrl = jd_picUrl;
	}

	public void setJd_pic(String jd_pic) {
		this.jd_pic = jd_pic;
	}

	public Integer getJd_id() {
		return jd_id;
	}

	public void setJd_id(Integer jd_id) {
		this.jd_id = jd_id;
	}

	public String getJd_name() {
		return jd_name;
	}

	public void setJd_name(String jd_name) {
		this.jd_name = jd_name;
	}

	



	public String getJd_salary() {
		return jd_salary;
	}

	public void setJd_salary(String jd_salary) {
		this.jd_salary = jd_salary;
	}

	public String getJd_pic() {
		return jd_pic;
	}

	public String getJd_emptime() {
		return jd_emptime;
	}

	public void setJd_emptime(String jd_emptime) {
		this.jd_emptime = jd_emptime;
	}

	public String getJd_company() {
		return jd_company;
	}

	public void setJd_company(String jd_company) {
		this.jd_company = jd_company;
	}

	public String getJd_school() {
		return jd_school;
	}

	public void setJd_school(String jd_school) {
		this.jd_school = jd_school;
	}

	public String getJd_profession() {
		return jd_profession;
	}

	public void setJd_profession(String jd_profession) {
		this.jd_profession = jd_profession;
	}

	@Override
	public String toString() {
		return "Jobdetails [jd_id=" + jd_id + ", jd_pic=" + jd_pic + ", jd_name=" + jd_name + ", jd_salary=" + jd_salary
				+ ", jd_emptime=" + jd_emptime + ", jd_company=" + jd_company + ", jd_school=" + jd_school
				+ ", jd_profession=" + jd_profession + ", jd_picUrl=" + jd_picUrl + "]";
	}

	

	


}
