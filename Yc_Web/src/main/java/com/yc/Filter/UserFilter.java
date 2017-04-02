package com.yc.Filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

import com.yc.bean.Admin;
import com.yc.bean.Users;

/**
 * Servlet Filter implementation class UserFilter
 */
public class UserFilter implements Filter {

	  private static final Logger logger = Logger.getLogger(UserFilter.class);

	    private final static String DEFAULT_USERID="anonymous";
	    
    public UserFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
	    HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session= req.getSession();
        if (session==null){
            MDC.put("userId",DEFAULT_USERID);  
        }
        else{
        	List<Admin> admin=(List<Admin>) session.getAttribute("Admin");
            if (admin==null){
                MDC.put("userId",DEFAULT_USERID);
            }
            else
            {
                MDC.put("userId",admin.get(0).getA_name());
            }
        }
        logger.info("test for MDC.");
        
        chain.doFilter(request,response);
    }

	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
