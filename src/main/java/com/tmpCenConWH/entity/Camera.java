package com.tmpCenConWH.entity;

public class Camera {

	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Float getX() {
		return x;
	}
	public void setX(Float x) {
		this.x = x;
	}
	public Float getY() {
		return y;
	}
	public void setY(Float y) {
		this.y = y;
	}
	public Float getZ() {
		return z;
	}
	public void setZ(Float z) {
		this.z = z;
	}
	public Float getDistIrr() {
		return distIrr;
	}
	public void setDistIrr(Float distIrr) {
		this.distIrr = distIrr;
	}
	public Float getIncAngX() {
		return incAngX;
	}
	public void setIncAngX(Float incAngX) {
		this.incAngX = incAngX;
	}
	public Float getIncAngZ() {
		return incAngZ;
	}
	public void setIncAngZ(Float incAngZ) {
		this.incAngZ = incAngZ;
	}
	public Float getDistGroundPro() {
		return distGroundPro;
	}
	public void setDistGroundPro(Float distGroundPro) {
		this.distGroundPro = distGroundPro;
	}
	public Float getK() {
		return k;
	}
	public void setK(Float k) {
		this.k = k;
	}
	public Float getB() {
		return b;
	}
	public void setB(Float b) {
		this.b = b;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	private String tagId;
	private Double longitude;
	private Double latitude;
	private Float x;
	private Float y;
	private Float z;
	private Float distIrr;//照射距离
	private Float incAngX;//与x轴夹角
	private Float incAngZ;//与z轴夹角
	private Float distGroundPro;//地面投影距离
	private Float k;
	private Float b;
	private String url;
}
