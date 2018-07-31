package com.sc.Dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sc.bean.Course;
import com.sc.bean.Ucourse;
import com.sc.bean.Users;
import com.sc.utils.MyJdbcUtil;
/**
 * 学生选课dao
 */
public class UcourseDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	//待优化
	public List<Ucourse> findAllStuCourse() throws SQLException {
		String sql="select ucid,uid,cid from ucourse";
		List<Ucourse> ucourseList=new ArrayList<Ucourse>();
		List<Map<String, Object>> mapList = runner.query(sql, new MapListHandler());
		for (Map<String, Object> map : mapList) {
			Ucourse ucourse=new Ucourse();
			int ucid=(int) map.get("ucid");
			ucourse.setUcid(ucid);
			
			int uid=(int) map.get("uid");
			UsersDao usersDao=new UsersDao();
			Users users = usersDao.findUserByUid(uid);
			ucourse.setUsers(users);
			
			int cid=(int) map.get("cid");
			CourseDao courseDao=new CourseDao();
			Course course = courseDao.findCourseByCid(cid);
			ucourse.setCourse(course);
			
			ucourseList.add(ucourse);
		}
		return ucourseList;
	}
	
	public Ucourse findStuCourseByUcid(int ucid) throws SQLException {
		String sql="select uid,cid from ucourse where ucid=?";
		List<Map<String, Object>> mapList = runner.query(sql, new MapListHandler(),ucid);
		Ucourse ucourse=new Ucourse();
		ucourse.setUcid(ucid);
		for (Map<String, Object> map : mapList) {
			
			int uid=(int) map.get("uid");
			UsersDao usersDao=new UsersDao();
			Users users = usersDao.findUserByUid(uid);
			ucourse.setUsers(users);
			
			int cid=(int) map.get("cid");
			CourseDao courseDao=new CourseDao();
			Course course = courseDao.findCourseByCid(cid);
			ucourse.setCourse(course);
			
		}
		return ucourse;
	}
	
	public void addStuCourse(int uid,int cid) throws SQLException {
		String sql="insert into ucourse values(null,?,?)";
		runner.update(sql,uid,cid);
	}
	
	public void deleteStuCourse(int uid,int cid) throws SQLException {
		String sql="delete from ucourse where uid=? and cid=?";
		runner.update(sql,uid,cid);
	}
	
	public long findStuCourseByUidCid(int uid,int cid) throws SQLException {
		String sql="select count(*) from ucourse where uid=? and cid=?";
		Object object = runner.query(sql, new ScalarHandler(),uid,cid);
		long count = (long) object;
		return count;
	}
	
}
