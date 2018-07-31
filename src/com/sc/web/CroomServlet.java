package com.sc.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.sc.bean.Croom;
import com.sc.service.CroomService;

/**
 * Created by harry 18-6-13.
 */
@WebServlet(urlPatterns = "/croom", name = "croom")
public class CroomServlet extends BaseServlet{
	private static final long serialVersionUID = -7492756256285100047L;
    public String addCroom(HttpServletRequest req, HttpServletResponse resp) {
    	Map<String, String[]> map = req.getParameterMap();
    	Croom croom=new Croom();
    	try {
			BeanUtils.populate(croom, map);
			CroomService croomService=new CroomService();
			croomService.addCroom(croom);
			req.setAttribute("msg", "添加教室成功！！！");
		}  catch (Exception e) {
			req.setAttribute("msg", "添加教室失败！！！");
			System.out.println("添加教室失败！！！");
		} 
    	return "/admin/classroomadd.jsp";
    }
    
    public String findAllCroom(HttpServletRequest req, HttpServletResponse resp) {
		try {
			CroomService croomService=new CroomService();
			List<Croom> croomList = croomService.findAllCroom();
			req.setAttribute("croomList", croomList);
		} catch (SQLException e) {
			req.setAttribute("msg", "查询所有教室失败！！！");
			System.out.println("显示所有教室失败");
		}
    	return "/admin/classroom.jsp";
    }
    
    public String deleteByCrid(HttpServletRequest req, HttpServletResponse resp) {
    	int crid = Integer.parseInt(req.getParameter("crid"));
    	try {
    		CroomService croomService=new CroomService();
			croomService.deleteByCrid(crid);
    		req.setAttribute("msg", "删除教室成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "删除教室失败！！！");
			System.out.println("删除教室失败");
		}
    	return findAllCroom(req,resp);
    }
    
    public String updateByCrid(HttpServletRequest req, HttpServletResponse resp) {
    	Map<String, String[]> map = req.getParameterMap();
    	Croom croom=new Croom();
    	try {
    		BeanUtils.populate(croom, map);
    		CroomService croomService=new CroomService();
			croomService.updateByCrid(croom);
    		req.setAttribute("msg", "更新教室信息成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "更新教室信息失败！！！");
			System.out.println("更新教室信息失败");
		}
    	return findAllCroom(req,resp);
    }
}
