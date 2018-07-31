package com.sc.bean;

import java.util.List;
/**
 * 分页类
 * @author harry
 */
public class PageBean<T> {
	//总数
	private int totalCount;
	//当前页码
	private int pageCode;
	//每页数量
	private int pageSize;
	//查询条件
	private String url;
	//
	private List<T> beanList;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCode() {
		return pageCode;
	}
	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		int totalPage = totalCount / pageSize;
		if(totalCount % pageSize == 0){
			return totalPage;
		}else{
			return totalPage + 1;
		}
	}
	public List<T> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}
	
}
