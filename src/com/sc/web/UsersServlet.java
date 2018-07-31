package com.sc.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.sc.bean.Users;
import com.sc.service.UsersService;
import com.sc.utils.MD5;

/**
 * Created by harry 18-6-13.
 */
@WebServlet(urlPatterns = "/users", name = "users")
public class UsersServlet extends BaseServlet {
	private static final long serialVersionUID = -7492756256285100047L;
	
	/**
	 * 所有用户登入验证
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        if (email.isEmpty() || password.trim().isEmpty()){
            req.setAttribute("error", "用户名或密码为空!");
            return "/index.jsp";
        }
        Users users = new Users();
        users.setEmail(email);
        users.setPassword(password);
        try {
        	UsersService usersService=new UsersService();
        	Users currentUsers = usersService.login(users);
            if (currentUsers == null){
                req.setAttribute("error", "用户名或密码错误！");
                return "/index.jsp";
            }else {
            	//登入成功,报存到session
                HttpSession session = req.getSession();
                currentUsers.setPassword(password);
                session.setAttribute("currentUsers", currentUsers);
                //记住用户名功能
                if (remember!=null && "true".equals(remember)) {
                	String autoLogin = email+"-h-e-"+password;
                	Cookie c=new Cookie("autoLogin", autoLogin);
                	c.setPath(req.getContextPath());
                	c.setMaxAge(60*60*24);
        			resp.addCookie(c);
        		}else {
        			Cookie cookie=new Cookie("autoLogin", "");
        			cookie.setPath(req.getContextPath());
        			cookie.setMaxAge(0);
        			resp.addCookie(cookie);
        		}
                //判断角色,跳转到不同界面
                if (currentUsers.getRole() == 0) {
                    resp.sendRedirect(req.getContextPath()+"/admin/index.jsp");
                    return "";
                } else if (currentUsers.getRole() == 1){
                    resp.sendRedirect(req.getContextPath()+"/teacher/index.jsp");
                    return "";
                } else if (currentUsers.getRole() == 2){
                    resp.sendRedirect(req.getContextPath()+"/student/index.jsp");
                    return "";
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return "/index.jsp";
	}
	
	/**
	 * 所有用户修改密码
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	public String changePwd(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String old_password = req.getParameter("old_password");
        String new_password = req.getParameter("new_password");
        String new_passwordAgain = req.getParameter("new_passwordAgain");
        Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
        int role = currentUsers.getRole();
        //用户没登入获取不到session会跳转到登入页
        if(currentUsers!=null){
	        if (new_password.trim().equals(new_passwordAgain.trim())&&
	        		new_password!=null&&
	        		new_passwordAgain!=null&&
	        		!new_password.equals("")&&
	        		!new_passwordAgain.equals("")&&
	        		MD5.md5(currentUsers.getPassword()).equals(old_password)
	        		) {
	        	try {
	        		UsersService usersService=new UsersService();
	        		usersService.changePwd(currentUsers, new_password);
	        		req.setAttribute("msg","修改密码成功！！！");
		        	req.setAttribute("currentUsers", currentUsers);
	        	} catch (Exception e) {
	        		req.setAttribute("msg","修改密码失败！！！");
	            }
	        	
	        	if (role==1) {
					return "/teacher/changepasswd.jsp";
				}else if(role==2){
					return "/student/changepasswd.jsp";
				}
	        	
			}else {
				req.setAttribute("currentUsers", currentUsers);
				req.setAttribute("msg", "修改密码失败！！！");
				//判断角色,跳转到不同界面
				if (role==1) {
					return "/teacher/changepasswd.jsp";
				}else if(role==2){
					return "/student/changepasswd.jsp";
				}else if(role==0) {
					return "/admin/changepasswd.jsp";
				}
			}
        }
        return "/index.jsp";
	}
	
	/**
	 * 管理员添加用户操作
	 * @param req
	 * @param resp
	 * @return
	 */
	public String usersAdd(HttpServletRequest req, HttpServletResponse resp) {
		Map<String, String[]> map = req.getParameterMap();
		Users users=new Users();
		try {
			BeanUtils.populate(users, map);
			UsersService usersService=new UsersService();
			//服务器端再次加密密码
//			String password = users.getPassword();
//			String md5Password = MD5.md5(password);
//			users.setPassword(md5Password);
			usersService.usersAdd(users);
			req.setAttribute("msg", "添加用户成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "添加用户失败！！！");
			System.out.println("添加用户失败");
		}
		return "/admin/useradd.jsp";
	}
	/**
	 * 管理员修改用户信息
	 * @param req
	 * @param resp
	 * @return
	 */
	public String updateUsersInfo(HttpServletRequest req, HttpServletResponse resp) {
		Map<String, String[]> map=req.getParameterMap();
		Users users=new Users();
		try {
			BeanUtils.populate(users, map);
			UsersService usersService=new UsersService();
			usersService.updateUsersInfo(users);
			req.setAttribute("msg", "更新用户信息成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "更新用户信息失败！！！");
			System.out.println("更新用户失败");
		}
		return findAllUsers(req,resp);
	}
	
	/**
	 * 管理员查询所有用户和用户信息
	 * @param req
	 * @param resp
	 * @return
	 */
	public String findAllUsers(HttpServletRequest req, HttpServletResponse resp) {
		try {
			UsersService usersService=new UsersService();
			List<Users> usersList = usersService.findAllUsers();
			req.setAttribute("usersList", usersList);
		} catch (Exception e) {
			req.setAttribute("msg", "服务器维护中。。。");
			System.out.println("查询所有用户失败");
		}
		return "/admin/user.jsp";
	}
	/**
	 * 管理员删除用户，单个删除
	 * @param req
	 * @param resp
	 * @return
	 */
	public String deleteUserByUid(HttpServletRequest req, HttpServletResponse resp) {
		int uid = Integer.parseInt(req.getParameter("uid"));
		try {
			UsersService usersService=new UsersService();
			usersService.deleteUserByUid(uid);
			req.setAttribute("msg", "删除用户成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "删除用户失败！！！");
			System.out.println("删除用户失败");
		}
		return findAllUsers(req,resp);
	}
	/**
	 * 用户个人显示自己信息
	 * @param req
	 * @param resp
	 * @return
	 */
	public String showUsersInfo(HttpServletRequest req, HttpServletResponse resp) {
		Users currentUsers=(Users) req.getSession().getAttribute("currentUsers");
		int uid = currentUsers.getUid();
		UsersService usersService=new UsersService();
		try {
			Users users = usersService.findUserByUid(uid);
			req.getSession().setAttribute("currentUsers", users);
			req.setAttribute("users", users);
		} catch (SQLException e) {
			req.setAttribute("msg", "用户信息刷新失败！！！");
			System.out.println("查找用户失败");
		}
		//判断角色,跳转到不同界面
		if (currentUsers.getRole() == 0) {
            return "/admin/changeinfo.jsp";
        } else if (currentUsers.getRole() == 1){
            return "/teacher/changeinfo.jsp";
        } else if (currentUsers.getRole() == 2){
            return "/student/changeinfo.jsp";
        }
		return "";
	}
	
	/**
	 * 用户个人修改自己信息
	 * @param req
	 * @param resp
	 * @return
	 */
	public String usersChangeInfo(HttpServletRequest req, HttpServletResponse resp) {
		Map<String, String[]> map=req.getParameterMap();
		Users users=new Users();
		try {
			BeanUtils.populate(users, map);
			UsersService usersService=new UsersService();
			usersService.usersChangeInfo(users);
			req.setAttribute("msg", "更新用户信息成功！！！");
		} catch (Exception e) {
			req.setAttribute("msg", "更新用户信息失败！！！");
			System.out.println("更新用户失败");
		}
		
		return showUsersInfo(req,resp);
	}
	
	
}
