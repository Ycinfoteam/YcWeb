package com.yc.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class JsonUtils {
	public static Gson gson=new Gson();
	public static void print(Object obj,HttpServletResponse resp) throws IOException{
		PrintWriter out=resp.getWriter();
		String json=gson.toJson(obj);
		out.println(json);
		out.flush();
		out.close();
	}
}
