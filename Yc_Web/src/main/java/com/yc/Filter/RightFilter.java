package com.yc.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;

/**
 * 后台登录过滤器
 * @author S3
 *
 */
public class RightFilter implements Filter {


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		HttpServletRequest req=(HttpServletRequest) request;
		if( req.getSession().getAttribute("user")!=null){
			chain.doFilter(request, response);
		}else{
			req.getSession().setAttribute("errmsg", "请先登录");
			request.getRequestDispatcher("/admin/tobacklogin").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}
	
    public RightFilter() {

    }

	public void destroy() {
	
	}

}
