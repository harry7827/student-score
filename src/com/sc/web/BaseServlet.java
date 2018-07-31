package com.sc.web;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Created by harry 18-6-13.
 */
@SuppressWarnings("rawtypes")
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1212L;

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String methodName=request.getParameter("method");
		
		Class clazz=this.getClass();
		if (methodName==null||methodName.trim().equals("")) {
			throw new RuntimeException("method参数非法");
		}
		Method method=null;
		try {
			method=clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("你传入的方法"+method+"不存在");
		}
		try {
			String result=(String) method.invoke(this,request,response);
			//System.out.println(result);
			if (request!=null && !result.trim().isEmpty()) {
				request.getRequestDispatcher(result).forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("服务器内部出错了。。。");
			throw new RuntimeException("服务器内部出错了。。。");
		}
		
	}

}
