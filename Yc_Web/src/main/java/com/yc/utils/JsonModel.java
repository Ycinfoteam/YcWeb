package com.yc.utils;

import java.io.Serializable;

public class JsonModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private long total;
	private Object rows;

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

}
