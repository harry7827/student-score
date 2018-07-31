package com.sc.bean;

/**
 * 公告
 */
public class Notes {
    private int nid;
    //公告主题
    private String title;
    //开始时间
    private String start_time;
    //结束时间
    private String stop_time;
    //主体
    private String ndesc;
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getStop_time() {
		return stop_time;
	}
	public void setStop_time(String stop_time) {
		this.stop_time = stop_time;
	}
	public String getNdesc() {
		return ndesc;
	}
	public void setNdesc(String ndesc) {
		this.ndesc = ndesc;
	}

    
}
