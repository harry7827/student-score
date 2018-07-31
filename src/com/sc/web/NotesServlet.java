package com.sc.web;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.sc.bean.Notes;
import com.sc.bean.PageBean;
import com.sc.bean.Users;
import com.sc.service.NotesService;

/**
 * Created by harry 18-6-13.
 */
@WebServlet(urlPatterns = "/notes", name = "notes")
public class NotesServlet extends BaseServlet{
	private static final long serialVersionUID = -7492756256285100047L;
	
	/**
	 * 管理员添加公告信息
	 * @param req
	 * @param resp
	 * @return
	 */
    public String notesAdd(HttpServletRequest req, HttpServletResponse resp) {
    	Map<String, String[]> map = req.getParameterMap();
    	Notes notes=new Notes();
    	try {
			BeanUtils.populate(notes, map);
			NotesService notesService=new NotesService();
			notesService.notesAdd(notes);
	    	req.setAttribute("msg", "添加公告成功!!!");
		} catch(RuntimeException e){
    		req.setAttribute("error", "公告开始时间应大于开始时间!");
			System.out.println("添加公告失败");
    	} catch (Exception e) {
			req.setAttribute("msg", "添加公告失败!!!");
			System.out.println("添加公告失败");
		}
    	return "/admin/notesadd.jsp";
    }
    
    /**
	 * 管理员查看所有公告信息
	 * @param req
	 * @param resp
	 * @return
	 */
    public String findAllNotes(HttpServletRequest req, HttpServletResponse resp) {
    	try {
    		NotesService notesService=new NotesService();
			List<Notes> notesList = notesService.findAllNotes();
			req.setAttribute("notesList", notesList);
		} catch (SQLException e) {
			req.setAttribute("msg", "服务器维护中。。。");
			System.out.println("查询所有公告失败");
		}
    	
    	//判断角色,跳转到不同界面
    	Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		if (currentUsers.getRole() == 0) {
			return "/admin/notesmanage.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/notes.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/notes.jsp";
        }
		return "";
    }
    /**
	 * 管理员查看所有公告信息(分页)
	 * @param req
	 * @param resp
	 * @return
	 */
    public String findAllNotesByPage(HttpServletRequest req, HttpServletResponse resp) {
    	int pageCode=Integer.parseInt(req.getParameter("pageCode"));
    	int pageSize=5;
    	try {
    		NotesService notesService=new NotesService();
    		PageBean<Notes> notesPageBean = notesService.findAllNotesByPage(pageCode, pageSize);
			req.setAttribute("notesPageBean", notesPageBean);
		} catch (SQLException e) {
			req.setAttribute("msg", "服务器维护中。。。");
			System.out.println("查询所有公告失败");
		}
    	
    	//判断角色,跳转到不同界面
    	Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		if (currentUsers.getRole() == 0) {
			return "/admin/notesmanage.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/notes.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/notes.jsp";
        }
		return "";
    }
    /**
	 * 管理员删除公告信息
	 * @param req
	 * @param resp
	 * @return
	 */
    public String deleteNotesByNid(HttpServletRequest req, HttpServletResponse resp) {
    	int nid = Integer.parseInt(req.getParameter("nid"));
    	try {
    		NotesService notesService=new NotesService();
			notesService.deleteNotesByNid(nid);
			req.setAttribute("msg", "删除公告成功!!!");
		} catch (SQLException e) {
			req.setAttribute("msg", "删除公高失败!!!");
			System.out.println("删除公告失败");
		}
    	return findAllNotesByPage(req,resp);
    }
    /**
	 * 管理员修改公告信息
	 * @param req
	 * @param resp
	 * @return
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
	 */
    public String updateNotesByNid(HttpServletRequest req, HttpServletResponse resp) {
    	Map<String, String[]> map = req.getParameterMap();
    	Notes notes=new Notes();
    	try {
			BeanUtils.populate(notes, map);
			NotesService notesService=new NotesService();
			notesService.updateNotesByNid(notes);
	    	req.setAttribute("msg", "更新公告成功!!!");
    	}catch(RuntimeException e){
    		req.setAttribute("msg", "更新公告失败!公告开始时间应大于开始时间!");
			System.out.println("更新公告失败");
    	}catch (Exception e) {
			req.setAttribute("msg", "更新公告失败!");
			System.out.println("更新公告失败");
		}
    	return findAllNotesByPage(req,resp);
    }
}
