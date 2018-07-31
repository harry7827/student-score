package com.sc.bean;
/*
 * 课程
 */
public class Course {
	//课程id
	private int cid;
	//课程名
	private String cname;
	//学分
	private double cscore;
	//任课老师
	private Users teacher;
	//上课roomId 外键
	private Croom croom;
	//上课时间 eg:周几 7,8节课
	private String cdate;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public double getCscore() {
		return cscore;
	}
	public void setCscore(double cscore) {
		this.cscore = cscore;
	}
	
	public Users getTeacher() {
		return teacher;
	}
	public void setTeacher(Users teacher) {
		this.teacher = teacher;
	}
	public Croom getCroom() {
		return croom;
	}
	public void setCroom(Croom croom) {
		this.croom = croom;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
}
