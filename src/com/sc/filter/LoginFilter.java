package com.sc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author harry
 *判断是否登入,不登入大部分页面无权访问
 */
public class LoginFilter implements Filter {
	
	private FilterConfig config;
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String noLoginPaths = config.getInitParameter("noLoginPaths");
		
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
		
		if(noLoginPaths!=null){
			String[] strArray = noLoginPaths.split(";");
			for (int i = 0; i < strArray.length; i++) {
				
				if(strArray[i]==null || "".equals(strArray[i]))continue;
				String requestURI = request.getRequestURI();
				if(requestURI.indexOf(strArray[i])!=-1 ){
					chain.doFilter(req, resp);
					return;
				}
			}
			
		}
		
		if (request.getSession().getAttribute("currentUsers")!=null) {
			chain.doFilter(req, resp);
		}else {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		config = arg0;
	}
	
}
