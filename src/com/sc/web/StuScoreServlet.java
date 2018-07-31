package com.sc.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sc.bean.Score;
import com.sc.bean.Users;
import com.sc.service.StuScoreService;

/**
 * Created by harry 18-6-13.
 */
@WebServlet("/stuScore")
public class StuScoreServlet extends BaseServlet {
	private static final long serialVersionUID = -7492756256285100047L;
    public String findAllStuScore(HttpServletRequest req, HttpServletResponse resp) {
    	try {
    		StuScoreService stuScoreService=new StuScoreService();
    		List<Score> allStuScore = stuScoreService.findAllStuScore();
			req.setAttribute("allStuScore", allStuScore);
		} catch (SQLException e) {
			req.setAttribute("msg", "服务器维护中。。。");
			System.out.println("查询所有学生成绩失败");;
		}
    	//判断角色,跳转到不同界面
    	Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		if (currentUsers.getRole() == 0) {
			return "/admin/score.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/score.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/infoscore.jsp";
        }
		return "";
    }
}
