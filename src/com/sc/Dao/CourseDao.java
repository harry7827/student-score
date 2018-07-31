package com.sc.Dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sc.bean.Course;
import com.sc.bean.Croom;
import com.sc.bean.Users;
import com.sc.utils.MyJdbcUtil;
/**
 * 课程dao
 */
public class CourseDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	
	//添加课程信息
	public void addCourse(Course course) throws SQLException {
		String sql="insert into course values(null,?,?,?,?,?)";
		Croom croom=course.getCroom();
		int crid = croom.getCrid();
		Object [] params= {course.getCname(),course.getCscore(),course.getTeacher().getUid(),crid,course.getCdate()};
		runner.update(sql, params);
	}
	
	//查找所有课程信息
	//待优化
    public List<Course> findAllCourse() throws SQLException {
    	String sql="select cid,cname,cscore,cteacher,crid,cdate from course";
    	List<Course> courseList=new ArrayList<Course>();
    	courseList=runner.query(sql, new BeanListHandler<>(Course.class));
    	for (Course course : courseList) {
    		Croom croom = new Croom();
    		int cid = course.getCid();
    		
    		String sql1="select crid from course where cid=?";
    		int crid=(int) runner.query(sql1, new ScalarHandler(), cid);
    		CroomDao croomDao=new CroomDao();
    		croom = croomDao.findByCrid(crid);
    		course.setCroom(croom);
    		
    		String sql2="select cteacher from course where cid=?";
    		int uid = (int) runner.query(sql2, new ScalarHandler(),cid);
    		UsersDao usersDao=new UsersDao();
    		Users users = usersDao.findUserByUid(uid);
    		course.setTeacher(users);
		}
		return courseList;
	}
    
	//分页查找所有课程信息,未完成
    public List<Course> findAllCourseByPage() throws SQLException {
    	String sql="select cid,cname,cscore,cteacher,crid,cdate from course";
    	List<Course> courseList=new ArrayList<Course>();
    	courseList=runner.query(sql, new BeanListHandler<>(Course.class));
    	for (Course course : courseList) {
    		Croom croom = new Croom();
    		int cid = course.getCid();
    		
    		String sql1="select crid from course where cid=?";
    		int crid=(int) runner.query(sql1, new ScalarHandler(), cid);
    		CroomDao croomDao=new CroomDao();
    		croom = croomDao.findByCrid(crid);
    		course.setCroom(croom);
    		
    		String sql2="select cteacher from course where cid=?";
    		int uid = (int) runner.query(sql2, new ScalarHandler(),cid);
    		UsersDao usersDao=new UsersDao();
    		Users users = usersDao.findUserByUid(uid);
    		course.setTeacher(users);
		}
		return courseList;
	}
    
    //通过cid更新课程信息
	public void updateByCid(Course course) throws SQLException {
		String sql="update course set cname=?,cscore=?,cteacher=?,crid=?,cdate=? where cid=?";
		int crid = course.getCroom().getCrid();
		int teacherId=course.getTeacher().getUid();
		Object [] params= {course.getCname(),course.getCscore(),teacherId,crid,course.getCdate(),course.getCid()};
		runner.update(sql, params);
	}
	
	//通过cid删除课程信息
	public void deleteCourseByCid(int cid) throws SQLException {
		String sql="delete from course where cid=?";
		runner.update(sql, cid);
	}
	
	//通过cid查找课程信息
	//待优化
	public Course findCourseByCid(int cid) throws SQLException {
		String sql="select * from course where cid=?";
		Course course = runner.query(sql,new BeanHandler<>(Course.class),cid);
		
		String sql1="select crid from course where cid=?";
		int crid = (int) runner.query(sql1, new ScalarHandler(),cid);
		CroomDao croomDao=new CroomDao();
		Croom croom = croomDao.findByCrid(crid);
		course.setCroom(croom);
		
		String sql2="select cteacher from course where cid=?";
		int uid = (int) runner.query(sql2, new ScalarHandler(),cid);
		UsersDao usersDao=new UsersDao();
		Users users = usersDao.findUserByUid(uid);
		course.setTeacher(users);
		
		return course;
	}
	
}
