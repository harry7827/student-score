package com.sc.bean;
/*
 * 学生选课
 */
public class Ucourse {
	private int ucid;
	//选课人
	private Users users;
	//课程
	private Course course;
	public int getUcid() {
		return ucid;
	}
	public void setUcid(int ucid) {
		this.ucid = ucid;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
}
