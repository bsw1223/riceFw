package com.rice.H001.homevo;

public class H001SchVO {
	
	
	private int id;
	private int schId;
	private String schTitle;
	private String schStart;
	private String schEnd;
	private String schDescription;
	private String schBackgroundColor;
	private String schType;
	private String memNum;
	private String schTextColor;
	private boolean schAllDay;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "H001SchVO [schId=" + schId + ", schTitle=" + schTitle + ", schStart=" + schStart + ", schEnd=" + schEnd
				+ ", schDescription=" + schDescription + ", schBackgroundColor=" + schBackgroundColor + ", schType="
				+ schType + ", memNum=" + memNum + ", schTextColor=" + schTextColor + ", schAllDay=" + schAllDay + "]";
	}
	public int getSchId() {
		return schId;
	}
	public void setSchId(int schId) {
		this.schId = schId;
	}
	public String getSchTitle() {
		return schTitle;
	}
	public void setSchTitle(String schTitle) {
		this.schTitle = schTitle;
	}
	public String getSchStart() {
		return schStart;
	}
	public void setSchStart(String schStart) {
		this.schStart = schStart;
	}
	public String getSchEnd() {
		return schEnd;
	}
	public void setSchEnd(String schEnd) {
		this.schEnd = schEnd;
	}
	public String getSchDescription() {
		return schDescription;
	}
	public void setSchDescription(String schDescription) {
		this.schDescription = schDescription;
	}
	public String getSchBackgroundColor() {
		return schBackgroundColor;
	}
	public void setSchBackgroundColor(String schBackgroundColor) {
		this.schBackgroundColor = schBackgroundColor;
	}
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getSchTextColor() {
		return schTextColor;
	}
	public void setSchTextColor(String schTextColor) {
		this.schTextColor = schTextColor;
	}
	public boolean isSchAllDay() {
		return schAllDay;
	}
	public void setSchAllDay(boolean schAllDay) {
		this.schAllDay = schAllDay;
	}
	
}
