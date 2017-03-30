package com.yc.biz;

import java.util.List;

import com.yc.bean.Admin;

public interface AdminBiz {

	public List<Admin> findAdmin(Admin admin);

	public void addAdmin(Admin admin);

	public void updateAdmin(Admin admin);

	public void deleteAdmin(Admin admin);

	public int findCount(Admin admin);
}
