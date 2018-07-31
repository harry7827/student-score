package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.ScoreDao;
import com.sc.bean.Score;

public class StuScoreService {
	public List<Score> findAllStuScore() throws SQLException {
		ScoreDao scoreDao=new ScoreDao();
		List<Score> allStuScore = scoreDao.findAllStuScore();
		return allStuScore;
	}
	
}
