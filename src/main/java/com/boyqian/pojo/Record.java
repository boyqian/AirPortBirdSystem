package com.boyqian.pojo;

import java.util.Date;

/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018年8月9日-下午10:23:22
 **/
public class Record {

	private int recordId;
	private int birdId;
	private String birdName;
	private Date Time;
	private int num;
	private double height;
	private String area;

	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}
	public int getBirdId() {
		return birdId;
	}
	public void setBirdId(int birdId) {
		this.birdId = birdId;
	}
	public Date getTime() {
		return Time;
	}
	public void setTime(Date time) {
		Time = time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBirdName() {
		return birdName;
	}
	public void setBirdName(String birdName) {
		this.birdName = birdName;
	}
}
