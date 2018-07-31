package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.CroomDao;
import com.sc.bean.Croom;

public class CroomService {
	public void addCroom(Croom croom) {
		CroomDao croomDao=new CroomDao();
		croomDao.addCroom(croom);
	}
	
	public List<Croom> findAllCroom() throws SQLException {
		CroomDao croomDao=new CroomDao();
		List<Croom> croomList = croomDao.findAllCroom();
		return croomList;
	}
	
	public void deleteByCrid(int crid) throws SQLException {
		CroomDao croomDao=new CroomDao();
		croomDao.deleteByCrid(crid);
	}
	
	public Croom findByCrid(int crid) throws SQLException {
		CroomDao croomDao=new CroomDao();
		Croom croom = croomDao.findByCrid(crid);
		return croom;
	}
	
	public void updateByCrid(Croom croom) throws SQLException {
		CroomDao croomDao=new CroomDao();
		croomDao.updateByCrid(croom);
	}
}
