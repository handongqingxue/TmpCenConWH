package com.tmpCenConWH.entity;

public class Forklist {

	private Integer forklistId;
	public Integer getForklistId() {
		return forklistId;
	}
	public void setForklistId(Integer forklistId) {
		this.forklistId = forklistId;
	}
	public String getForklistName() {
		return forklistName;
	}
	public void setForklistName(String forklistName) {
		this.forklistName = forklistName;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public Float getOilQuantity() {
		return oilQuantity;
	}
	public void setOilQuantity(Float oilQuantity) {
		this.oilQuantity = oilQuantity;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	private String forklistName;
	private String tagId;
	private Float oilQuantity;
	private String driver;
	private String createTime;
	private Integer state;
	private Integer areaId;
}
