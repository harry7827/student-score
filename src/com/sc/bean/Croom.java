package com.sc.bean;
/*
 * 教室
 */
public class Croom {
	//教室ID
    private int crid;
    //教室名eg：9#702
    private  String crname;
    //最大容纳人数
    private int crmaxnum;
    
	public int getCrid() {
		return crid;
	}
	public void setCrid(int crid) {
		this.crid = crid;
	}
	public String getCrname() {
		return crname;
	}
	public void setCrname(String crname) {
		this.crname = crname;
	}
	public int getCrmaxnum() {
		return crmaxnum;
	}
	public void setCrmaxnum(int crmaxnum) {
		this.crmaxnum = crmaxnum;
	}
    
}
