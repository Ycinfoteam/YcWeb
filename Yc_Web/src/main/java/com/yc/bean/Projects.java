package com.yc.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
public class Projects implements Serializable {

	private static final long serialVersionUID = -1819646038260294843L;
	private Integer p_id;
	private String p_name;     //项目名
	private String p_pic;      //项目图片
	private String p_developer;	 //开发者
	private String p_time;		//开发时间
	private String p_addr;     //项目发布地址 
	private List<MultipartFile> p_picUrl;//对应界面上的<input type="file" name="pdfsUrl"/>
	/*private int start;
	private int end;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	/*private List<Projects> rows;// 页面显示数据
	private int total; // 页面分页数据
	private  int currentPage=1;
	private int pageSize=9;
	private int maxPage=1;
	
	public List<Projects> getRows() {
		return rows;
	}
	public void setRows(List<Projects> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}*/
	public Integer getP_id() {
		return p_id;
	}
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_pic() {
		return p_pic;
	}
	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}
	
	public List<String> getp_picStringList(){
		List<String>list=new ArrayList<String>();
		if(p_pic!=null&&p_pic.length()>0){
			String[] strs=p_pic.split(",");
			for(String s:strs){
				list.add(s);
			}
		}
		return list;
	}
	
	
	public List<MultipartFile> getP_picUrl() {
		return p_picUrl;
	}
	public void setP_picUrl(List<MultipartFile> p_picUrl) {
		this.p_picUrl = p_picUrl;
	}
	public String getP_developer() {
		return p_developer;
	}
	public void setP_developer(String p_developer) {
		this.p_developer = p_developer;
	}

	/*public Date getP_time() {
		return p_time;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public void setP_time(Date p_time) {
		this.p_time = p_time;
	}*/
	
	
	public String getP_addr() {
		return p_addr;
	}
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}
	@Override
	public String toString() {
		return "Projects [p_id=" + p_id + ", p_name=" + p_name + ", p_pic=" + p_pic + ", p_developer=" + p_developer
				+ ", p_time=" + p_time + ", p_addr=" + p_addr + "]";
	}
	
	
}
