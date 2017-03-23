package com.yc.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Activities implements Serializable {

	private static final long serialVersionUID = 8279832372916477571L;
	private Integer ac_id;
	private String ac_time;      //活动时间
	private String ac_illus;	//说明
	private String ac_pic;     //图片（多图）
	private List<MultipartFile> ac_picUrl;//对应界面上的<input type="file" name="pdfsUrl"/>
	public List<String> getac_picStringList(){
		List<String>list=new ArrayList<String>();
		if(ac_pic!=null&&ac_pic.length()>0){
			String[] strs=ac_pic.split(",");
			for(String s:strs){
				list.add(s);
			}
		}
		return list;
	}
	public List<MultipartFile> getAc_picUrl() {
		return ac_picUrl;
	}
	public void setAc_picUrl(List<MultipartFile> ac_picUrl) {
		this.ac_picUrl = ac_picUrl;
	}
	public Integer getAc_id() {
		return ac_id;
	}
	public void setAc_id(Integer ac_id) {
		this.ac_id = ac_id;
	}
	/*@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getAc_time() {
		return ac_time;
	}
	public void setAc_time(Date ac_time) {
		this.ac_time = ac_time;
	}
	*/
	public String getAc_illus() {
		return ac_illus;
	}
	public String getAc_time() {
		return ac_time;
	}
	public void setAc_time(String ac_time) {
		this.ac_time = ac_time;
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
