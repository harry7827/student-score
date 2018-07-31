package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.CourseDao;
import com.sc.Dao.CroomDao;
import com.sc.Dao.UsersDao;
import com.sc.bean.Course;
import com.sc.bean.Croom;
import com.sc.bean.Users;

public class CourseService {
	public void addCourse(Course course,int crid,int teacherId) throws SQLException {
		CroomDao croomDao=new CroomDao();
		//通过传过来的ID设置croom属性
		Croom croom = croomDao.findByCrid(crid);
		course.setCroom(croom);
		//通过传过来的ID设置teacher属性
		UsersDao usersDao=new UsersDao();
		Users teacher = usersDao.findUserByUid(teacherId);
		course.setTeacher(teacher);
		
    	CourseDao courseDao=new CourseDao();
    	courseDao.addCourse(course);
	}
	
	public List<Course> findAllCourse() throws SQLException {
		CourseDao courseDao=new CourseDao();
		List<Course> courseList = courseDao.findAllCourse();
		return courseList;
	}
	
	public void updateByCid(Course course) throws SQLException {
		CourseDao courseDao=new CourseDao();
		courseDao.updateByCid(course);
	}
	
	public void deleteCourseByCid(int cid) throws SQLException {
		CourseDao courseDao=new CourseDao();
		courseDao.deleteCourseByCid(cid);
	}
	
}
