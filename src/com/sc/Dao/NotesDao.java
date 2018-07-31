package com.sc.Dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sc.bean.Notes;
import com.sc.bean.PageBean;
import com.sc.utils.MyJdbcUtil;
/**
 * 公告dao
 */
public class NotesDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	
	public void addNote(Notes notes) throws SQLException {
		String sql="insert into notes values(null,?,?,?,?)";
		Object [] params= {notes.getTitle(),notes.getStart_time(),notes.getStop_time(),notes.getNdesc()};
		runner.update(sql, params);
	}
	
    public List<Notes> findAllNotes() throws SQLException {
    	String sql="select nid,title,start_time,stop_time,ndesc from notes";
    	List<Notes> notesList=new ArrayList<Notes>();
    	notesList=runner.query(sql, new BeanListHandler<>(Notes.class));
		return notesList;
	}
    //分页查询所有公告
    public PageBean<Notes> findAllNotesByPage(int pageCode,int pageSize) throws SQLException {
    	PageBean<Notes> notesPageBean=new PageBean<Notes>();
    	String sql="select nid,title,start_time,stop_time,ndesc from notes limit ?,?";
    	List<Notes> notesList=new ArrayList<Notes>();
    	notesList=runner.query(sql, new BeanListHandler<>(Notes.class),(pageCode-1)*pageSize,pageSize);
    	List<Notes> notesCount = findAllNotes();
    	int pageCount=notesCount.size();
    	notesPageBean.setBeanList(notesList);
    	notesPageBean.setPageCode(pageCode);
    	notesPageBean.setPageSize(pageSize);
    	notesPageBean.setTotalCount(pageCount);
		return notesPageBean;
	}
    
	public void updateByNid(Notes notes) throws SQLException {
		String sql="update notes set title=?,start_time=?,stop_time=?,ndesc=? where nid=?";
		Object [] params= {notes.getTitle(),notes.getStart_time(),notes.getStop_time(),notes.getNdesc(),notes.getNid()};
		runner.update(sql, params);
		
	}
    
	public void deleteNotesByNid(int nid) throws SQLException {
		String sql="delete from notes where nid=?";
		runner.update(sql, nid);
	}
    
}
