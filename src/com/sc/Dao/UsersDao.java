package com.sc.Dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sc.bean.Users;
import com.sc.utils.MyJdbcUtil;

/**
 * 用户dao 所有用户
 */
public class UsersDao {
	
	private QueryRunner runner=new QueryRunner(MyJdbcUtil.getDataSource());
	
	/**
	 * 通过email和密码查找用户
	 * @param users
	 * @throws SQLException
	 */
    public Users signin (Users users) throws SQLException{
    	String sql = "select * from users where email=? and password=?";
    	Users usersResult = null;
		usersResult = runner.query(sql, new BeanHandler<Users>(Users.class),users.getEmail(),users.getPassword());
        return usersResult;
    }
	/**
	 * 通过email修改用户密码
	 * @param users
	 * @throws SQLException
	 */
    public void changePwdByEmail (Users Users) throws SQLException {
    	String sql = "update users set password=? where email=?";
		runner.update(sql,Users.getPassword(),Users.getEmail());
    }
	/**
	 * 通过uid修改用户信息
	 * name,sex,grade,school,major,qq,phone,email,adress
	 * @param users
	 * @throws SQLException
	 */
    public void updateUsersByUid (Users users) throws SQLException {
    	String sql = "update users set name=?,sex=?,grade=?,school=?,major=?,qq=?,phone=?,email=?,adress=? where uid=?";
    	Object [] param= {users.getName(),users.getSex(),users.getGrade(),users.getSchool(),users.getMajor(),users.getQq(),
    			users.getPhone(),users.getEmail(),users.getAdress(),users.getUid()};
		runner.update(sql,param);
    }
	/**
	 * 通过email修改用户信息
	 * name,sex,grade,school,major,qq,phone,adress
	 * @param users
	 * @throws SQLException
	 */
    public void updateUsersByEmail (Users users) throws SQLException {
    	String sql = "update users set name=?,sex=?,grade=?,school=?,major=?,qq=?,phone=?,adress=? where email=?";
    	Object [] param= {users.getName(),users.getSex(),users.getGrade(),users.getSchool(),users.getMajor(),users.getQq(),
    			users.getPhone(),users.getAdress(),users.getEmail()};
		runner.update(sql,param);
    }
	/**
	 * 添加用户
	 * @param users
	 * @throws SQLException
	 */
    public void addUsers (Users users) throws SQLException {
    	String sql = "insert into users value(null,?,?,?,?,?,?,?,?,?,?,?,?)";
    	Object [] param= {users.getSchool_num(),users.getName(),users.getGrade(),users.getSchool(),users.getMajor(),users.getEmail(),
    			users.getPassword(),users.getRole(),users.getSex(),users.getQq(),users.getPhone(),users.getAdress()};
    	
		runner.update(sql, param);
    }
	/**
	 * 查询所有admin之外的用户
	 * @param users
	 * @throws SQLException
	 */
    public List<Users> findAllUsers () throws SQLException {
    	String sql = "select * from users where role <>0";
    	List<Users> usersList = null;
    	try {
    		usersList = runner.query(sql, new BeanListHandler<Users>(Users.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return usersList;
    }
	/**
	 * 查询学生之外的所有用户
	 * @param users
	 * @throws SQLException
	 */
    public List<Users> findAllStudent () throws SQLException {
    	String sql = "select * from users where role not in(0,1)";
    	List<Users> usersList = null;
    	try {
    		usersList = runner.query(sql, new BeanListHandler<Users>(Users.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return usersList;
    }
	/**
	 * 通过uid删除用户
	 * @param users
	 * @throws SQLException
	 */
    public void deleteUserByUid (int uid) throws SQLException {
    	String sql = "delete from users where uid=?";
    	try {
			runner.update(sql,uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
	/**
	 * 通过uid查询用户
	 * @param users
	 * @throws SQLException
	 */
    public Users findUserByUid (int uid) throws SQLException {
    	String sql = "select * from users where uid=?";
    	Users users = null;
    	try {
    		users=runner.query(sql, new BeanHandler<Users>(Users.class),uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return users;
    }
	/**
	 * 通过角色查询用户
	 * @param users
	 * @throws SQLException
	 */
    public List<Users> findUserByRole (int role) throws SQLException {
    	String sql = "select * from users where role=?";
    	List<Users> usersList = null;
    	try {
    		usersList=runner.query(sql, new BeanListHandler<Users>(Users.class),role);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return usersList;
    }
    
    
}
