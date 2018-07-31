package com.sc.Dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sc.bean.Score;
import com.sc.bean.Ucourse;
import com.sc.utils.MyJdbcUtil;
/**
 * 学生成绩dao
 */
public class ScoreDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	
	//待优化
	public List<Score> findAllStuScore() throws SQLException {
		String sql="select sid,ucid,pscore,qscore,zscore from score";
		List<Score> scoreList = runner.query(sql, new BeanListHandler<>(Score.class));
		for (Score score : scoreList) {
			//通过sid获得ucid设置ucourse属性
			int sid = score.getSid();
			String sql1="select ucid from score where sid=?";
			int ucid = (int) runner.query(sql1, new ScalarHandler(),sid);
			UcourseDao ucourseDao=new UcourseDao();
			Ucourse ucourse = ucourseDao.findStuCourseByUcid(ucid);
			score.setUcourse(ucourse);
			
		}
		return scoreList;
	}
}
