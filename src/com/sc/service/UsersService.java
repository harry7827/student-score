package com.sc.service;

import java.sql.SQLException;
import java.util.List;

import com.sc.Dao.UsersDao;
import com.sc.bean.Users;
import com.sc.utils.MD5;

public class UsersService {
	//所有service待优化
	private UsersDao usersDao=new UsersDao();
	
	public void changePwd(Users users,String new_password) throws SQLException {
		users.setPassword(new_password);
		usersDao.changePwdByEmail(users);
	}
	
	public Users login(Users users) throws SQLException {
		//对用户密码md5加密
		String password = users.getPassword();
        String md5Password = MD5.md5(password);
        users.setPassword(md5Password);
		Users currentUsers = usersDao.signin(users);
		return currentUsers;
	}
	
	public void usersAdd(Users users) throws SQLException {
		usersDao.addUsers(users);
	}
	
	public void updateUsersInfo(Users users) throws SQLException {
		usersDao.updateUsersByUid(users);
	}
	
	public void usersChangeInfo(Users users) throws SQLException {
		usersDao.updateUsersByEmail(users);
	}
	
	public List<Users> findAllUsers() throws SQLException {
		List<Users> usersList=usersDao.findAllUsers();
		return usersList;
	}
	
	public void deleteUserByUid(int uid) throws SQLException {
		usersDao.deleteUserByUid(uid);
	}
	
	public Users findUserByUid(int uid) throws SQLException {
		Users users = usersDao.findUserByUid(uid);
		return users;
	}
	
	public List<Users> findUserByRole(int role) throws SQLException {
		List<Users> roleList = usersDao.findUserByRole(role);
		return roleList;
	}
	
}
