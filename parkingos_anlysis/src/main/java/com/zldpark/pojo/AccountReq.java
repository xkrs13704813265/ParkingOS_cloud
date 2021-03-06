package com.zldpark.pojo;

import java.io.Serializable;
import java.util.List;

public class AccountReq implements Serializable {
	private long startTime = -1;//查询起始时间
	private long endTime = -1;//查询结束时间
	private long id;
	private int type;//0：按收费员编号统计 1：按车场编号统计 2：按泊位段编号查询 3：按泊位查询 4:按运营集团查询
	private int pageNum = -1;
	private int pageSize = -1;
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public long getStartTime() {
		return startTime;
	}
	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}
	public long getEndTime() {
		return endTime;
	}
	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "AccountReq [startTime=" + startTime + ", endTime=" + endTime
				+ ", id=" + id + ", type=" + type + ", pageNum=" + pageNum
				+ ", pageSize=" + pageSize + "]";
	}
}
