package com.sc.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import com.sc.bean.Course;
import com.sc.bean.Croom;
import com.sc.bean.Users;
import com.sc.service.CourseService;
import com.sc.service.CroomService;
import com.sc.service.UsersService;

/**
 * Created by harry 18-6-13.
 */
@WebServlet(urlPatterns = "/course", name = "course")
public class CourseServlet extends BaseServlet{
	private static final long serialVersionUID = -7492756256285100047L;
    public String addCourse(HttpServletRequest req, HttpServletResponse resp) {
    	Map<String, String[]> map = req.getParameterMap();
    	int crid = Integer.parseInt(req.getParameter("crid"));
    	int teacherId=Integer.parseInt(req.getParameter("cteacher"));
    	Course course=new Course();
    	try {
    		BeanUtils.populate(course, map);
    		CourseService courseService=new CourseService();
    		courseService.addCourse(course,crid,teacherId);
        	req.setAttribute("msg", "添加课程成功!!!");
		} catch (SQLException e1) {
			req.setAttribute("msg", "添加课程失败!!!");
			System.out.println("添加课程失败");
		} catch (Exception e) {
			req.setAttribute("msg", "添加课程失败!!!");
			System.out.println("添加课程失败");
		}
    	
    	return listTeacherAndCroom(req,resp);
    }
    
    public String listTeacherAndCroom(HttpServletRequest req, HttpServletResponse resp) {
		try {
			//查询所有老师
			UsersService usersService=new UsersService();
			List<Users> roleList = usersService.findUserByRole(1);
			req.setAttribute("roleList", roleList);
			//查询所有教室
			CroomService croomService=new CroomService();
			List<Croom> croomList = croomService.findAllCroom();
			req.setAttribute("croomList", croomList);
		} catch (SQLException e) {
			req.setAttribute("msg", "查询所有老师或教室失败");
			System.out.println("查询所有老师或教室失败");
		}
		
    	return "/admin/courseadd.jsp";
    }
    
    public String findAllCourse(HttpServletRequest req, HttpServletResponse resp) {
    	try {
			//查询所有老师
			UsersService usersService=new UsersService();
			List<Users> roleList = usersService.findUserByRole(1);
			req.setAttribute("roleList", roleList);
			//查询所有教室
			CroomService croomService=new CroomService();
			List<Croom> croomList = croomService.findAllCroom();
			req.setAttribute("croomList", croomList);
		} catch (SQLException e) {
			req.setAttribute("msg", "查询所有老师或教室失败");
			System.out.println("查询所有老师或教室失败");
		}
    	
    	try {
    		CourseService courseService=new CourseService();
			List<Course> courseList = courseService.findAllCourse();
			req.setAttribute("courseList", courseList);
			
		} catch (SQLException e) {
			req.setAttribute("msg", "查询所有课程失败");
			System.out.println("查询所有课程失败");
		}
    	//判断角色,跳转到不同界面
    	Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		if (currentUsers.getRole() == 0) {
            return "/admin/course.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/infocourse.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/scourse.jsp";
        }
		return "";
    }
    
    public String updateCourseByCid(HttpServletRequest req, HttpServletResponse resp) {
    	int uid = Integer.parseInt(req.getParameter("cteacher"));
    	int crid = Integer.parseInt(req.getParameter("crid"));
    	Map<String, String[]> map = req.getParameterMap();
    	Course course=new Course();
    	
    	try {
    		BeanUtils.populate(course, map);
		} catch (Exception e1) {
			System.out.println("1");
			req.setAttribute("msg", "更新课程信息失败！！！");
			System.out.println("");
		}
    	
    	try {
    		UsersService usersService=new UsersService();
        	CroomService croomService=new CroomService();
			Users teacher = usersService.findUserByUid(uid);
			Croom croom = croomService.findByCrid(crid);
			course.setCroom(croom);
			course.setTeacher(teacher);
		} catch (SQLException e2) {
			System.out.println("2");
			req.setAttribute("msg", "更新课程信息失败！！！");
		}
    	
    	try {
    		CourseService courseService=new CourseService();
			courseService.updateByCid(course);
			req.setAttribute("msg", "更新课程信息成功！！！");
		} catch (SQLException e3) {
			System.out.println("3");
			req.setAttribute("msg", "更新课程信息失败！！！");
		}
    	
    	return findAllCourse(req,resp);
    }
    
    public String deleteCourseByCid(HttpServletRequest req, HttpServletResponse resp) {
    	int cid = Integer.parseInt(req.getParameter("cid"));
    	try {
    		CourseService courseService=new CourseService();
    		courseService.deleteCourseByCid(cid);
			req.setAttribute("msg", "删除课程成功！！!");
		} catch (SQLException e) {
			req.setAttribute("msg", "删除课程失败，课程可能已有学生选了。。。");
			System.out.println("删除课程失败");
		}
    	return findAllCourse(req,resp);
    }

}
