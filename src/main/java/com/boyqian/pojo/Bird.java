package com.boyqian.pojo;
/**
 * @author boyqian
 * @email boyqian@foxmail.com
 * @time 2018��8��9��-����10:25:22
 **/
public class Bird {

	private int birdId;
	private int typeId;
	private String typeName;
	private String birdName;
	public int getBirdId() {
		return birdId;
	}
	public void setBirdId(int birdId) {
		this.birdId = birdId;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getBirdName() {
		return birdName;
	}
	public void setBirdName(String birdName) {
		this.birdName = birdName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
