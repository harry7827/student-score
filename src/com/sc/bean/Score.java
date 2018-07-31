package com.sc.bean;
/*
 * 学生分数student score
 */
public class Score {
	private int sid;
	private Ucourse ucourse;
	private double pscore;
	private double qscore;
	private double zscore;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public Ucourse getUcourse() {
		return ucourse;
	}
	public void setUcourse(Ucourse ucourse) {
		this.ucourse = ucourse;
	}
	public double getPscore() {
		return pscore;
	}
	public void setPscore(double pscore) {
		this.pscore = pscore;
	}
	public double getQscore() {
		return qscore;
	}
	public void setQscore(double qscore) {
		this.qscore = qscore;
	}
	public double getZscore() {
		return zscore;
	}
	public void setZscore(double zscore) {
		this.zscore = zscore;
	}
	
}
