package com.sc.Dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sc.bean.Croom;
import com.sc.utils.MyJdbcUtil;
/**
 * 教室dao
 */
public class CroomDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	
	public void addCroom(Croom croom) {
		String sql="insert into croom values(null,?,?)";
		Object [] params= {croom.getCrname(),croom.getCrmaxnum()};
		try {
			runner.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("添加教室失败");
		}
	}
	
	public List<Croom> findAllCroom() throws SQLException {
		List<Croom> croomList=new ArrayList<Croom>();
		String sql="select crid,crname,crmaxnum from croom";
		croomList = runner.query(sql, new BeanListHandler<>(Croom.class));
		return croomList;
	}
	
	public void updateByCrid(Croom croom) {
		String sql="update croom set crname=?,crmaxnum=? where crid=?";
		Object [] params= {croom.getCrname(),croom.getCrmaxnum(),croom.getCrid()};
		try {
			runner.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteByCrid(int crid) throws SQLException {
		String sql="delete from croom where crid=?";
		runner.update(sql, crid);
	}
	
	public Croom findByCrid(int crid) throws SQLException {
		Croom croom=new Croom();
		String sql="select crname,crmaxnum from croom where crid=?";
		croom = runner.query(sql, new BeanHandler<Croom>(Croom.class),crid);
		croom.setCrid(crid);
		return croom;
	}
	
}
