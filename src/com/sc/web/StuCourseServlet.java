package com.sc.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sc.bean.Ucourse;
import com.sc.bean.Users;
import com.sc.service.StuCourseService;
/**
 * Created by harry 18-6-13.
 */
@WebServlet("/stuCourse")
public class StuCourseServlet extends BaseServlet {
	private static final long serialVersionUID = -7492756256285100047L;

	public String findAllStuCourse(HttpServletRequest req, HttpServletResponse resp) {
    	try {
    		StuCourseService stuCourseService=new StuCourseService();
    		List<Ucourse> allStuCourse = stuCourseService.findAllStuCourse();
			req.setAttribute("allStuCourse",allStuCourse);
		} catch (SQLException e) {
			req.setAttribute("msg", "服务器维护中。。。");
			System.out.println("查血所有学生选课失败");
		}
    	
    	//判断角色,跳转到不同界面
    	Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		if (currentUsers.getRole() == 0) {
			return "/admin/scourse.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/scourse.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/infoscourse.jsp";
        }
		return "";
    }
	
	public String addStuCourse(HttpServletRequest req, HttpServletResponse resp) {
		int cid = Integer.parseInt(req.getParameter("cid"));
		Users users = (Users) req.getSession().getAttribute("currentUsers");
		int uid = users.getUid();
		StuCourseService stuCourseService=new StuCourseService();
		if (stuCourseService.findStuCourseByUidCid(uid, cid)>=1) {
			req.setAttribute("msg", "选课失败!你已经选了这门课了！");
		}else {
			try {
	    		stuCourseService.addStuCourse(uid, cid);
				req.setAttribute("msg", "选课成功！！！");
			} catch (SQLException e) {
				req.setAttribute("msg", "选课失败。。。");
				System.out.println("学生选课失败");
			}
		}
		
		return "/course?method=findAllCourse";
	}
	
	public String deleteStuCourse(HttpServletRequest req, HttpServletResponse resp) {
		int cid = Integer.parseInt(req.getParameter("cid"));
		Users users = (Users) req.getSession().getAttribute("currentUsers");
		int uid = users.getUid();
		try {
    		StuCourseService stuCourseService=new StuCourseService();
    		stuCourseService.deleteStuCourse(uid, cid);
			req.setAttribute("msg", "删除选课成功！！！");
		} catch (SQLException e) {
			req.setAttribute("msg", "删除选课失败。。。");
			System.out.println("删除选课失败");
		}
		return "/stuCourse?method=findAllStuCourse";
	}
	
}
