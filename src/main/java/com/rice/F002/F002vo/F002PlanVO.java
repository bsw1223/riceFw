package com.rice.F002.F002vo;

import org.springframework.stereotype.Component;

@Component
public class F002PlanVO {
	private String planId;
	private String planCode;
	private String planName;
	private String planLectureContent;
	private String memNum;
	private String planStartDate;
	private String planEndDate;
	private String planStartTime;
	private String planEndTime;
	private int planCapacity;
	
	@Override
	public String toString() {
		return "F002PlanVO [planId=" + planId + ", planCode=" + planCode + ", planName=" + planName
				+ ", planLectureContent=" + planLectureContent + ", memNum=" + memNum + ", planStartDate="
				+ planStartDate + ", planEndDate=" + planEndDate + ", planStartTime=" + planStartTime + ", planEndTime="
				+ planEndTime + ", planCapacity=" + planCapacity + "]";
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public String getPlanCode() {
		return planCode;
	}
	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getPlanLectureContent() {
		return planLectureContent;
	}
	public void setPlanLectureContent(String planLectureContent) {
		this.planLectureContent = planLectureContent;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getPlanStartDate() {
		return planStartDate;
	}
	public void setPlanStartDate(String planStartDate) {
		this.planStartDate = planStartDate;
	}
	public String getPlanEndDate() {
		return planEndDate;
	}
	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}
	public String getPlanStartTime() {
		return planStartTime;
	}
	public void setPlanStartTime(String planStartTime) {
		this.planStartTime = planStartTime;
	}
	public String getPlanEndTime() {
		return planEndTime;
	}
	public void setPlanEndTime(String planEndTime) {
		this.planEndTime = planEndTime;
	}
	public int getPlanCapacity() {
		return planCapacity;
	}
	public void setPlanCapacity(int planCapacity) {
		this.planCapacity = planCapacity;
	}
}
