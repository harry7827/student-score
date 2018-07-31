package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.NotesDao;
import com.sc.bean.Notes;
import com.sc.bean.PageBean;
import com.sc.utils.DateFormatUtils;

public class NotesService {
	
	public void notesAdd(Notes notes) throws SQLException,RuntimeException {
		long start=DateFormatUtils.parse(notes.getStart_time());
		long stop=DateFormatUtils.parse(notes.getStop_time());
		if (start>stop) {
			throw new RuntimeException("开始时间大于结束时间");
		}else {
			NotesDao notesDao = new NotesDao();
	    	notesDao.addNote(notes);
		}
		
	}
	
	public List<Notes> findAllNotes() throws SQLException {
		NotesDao notesDao = new NotesDao();
		List<Notes> notesList = notesDao.findAllNotes();
		return notesList;
	}
	//分页查询公告
	public PageBean<Notes> findAllNotesByPage(int pageCode,int pageSize) throws SQLException {
		NotesDao notesDao = new NotesDao();
		PageBean<Notes> notesPageBean = notesDao.findAllNotesByPage(pageCode, pageSize);
		return notesPageBean;
	}
	
	
	public void deleteNotesByNid(int nid) throws SQLException {
		NotesDao notesDao = new NotesDao();
		notesDao.deleteNotesByNid(nid);
	}
	
	public void updateNotesByNid(Notes notes) throws SQLException,RuntimeException {
		long start=DateFormatUtils.parse(notes.getStart_time());
		long stop=DateFormatUtils.parse(notes.getStop_time());
		if (start>stop) {
			throw new RuntimeException("开始时间大于结束时间");
		}else {
			NotesDao notesDao = new NotesDao();
	    	notesDao.updateByNid(notes);
		}
	}
}
