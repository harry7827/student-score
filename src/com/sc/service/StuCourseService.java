package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.UcourseDao;
import com.sc.bean.Ucourse;

public class StuCourseService {
	public List<Ucourse> findAllStuCourse() throws SQLException {
		UcourseDao ucourseDao = new UcourseDao();
		List<Ucourse> allStuCourse = ucourseDao.findAllStuCourse();
		return allStuCourse;
	}
	
    public void addStuCourse(int uid,int cid) throws SQLException {
    	UcourseDao ucourseDao=new UcourseDao();
    	ucourseDao.addStuCourse(uid, cid);
    }
	
    public void deleteStuCourse(int uid,int cid) throws SQLException {
    	UcourseDao ucourseDao=new UcourseDao();
    	ucourseDao.deleteStuCourse(uid, cid);
    }
    
    public long findStuCourseByUidCid(int uid,int cid) {
    	UcourseDao ucourseDao=new UcourseDao();
    	long count=0;
		try {
			count = ucourseDao.findStuCourseByUidCid(uid, cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return count;
    }
}
