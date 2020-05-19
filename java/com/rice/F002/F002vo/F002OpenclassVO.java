package com.rice.F002.F002vo;

import org.springframework.stereotype.Component;

@Component
public class F002OpenclassVO {
	private String openclassId;	// 개설교과목 ID
	private String openclassName; // 개설교과목명
	private String classId;	// 강의실 ID
	private String className;// 강의실명
	private int classCapacity;	// 수강정원
	private String classDesc;
	private int classPrice;
	private String openStartDate;
	private String openEndDate;
	private String openStartTime;
	private String openEndTime;
	private String openclassDays;	// 총 수업일수
	private String classMon;	//
	private String classTue;
	private String classWed;
	private String classThur;
	private String classFri;
	private String classSat;
	private String classSun;
	private String subId;
	private String memNum;
	private String memName;
	
	@Override
	public String toString() {
		return "F002OpenclassVO [openclassId=" + openclassId + ", openclassName=" + openclassName + ", classId="
				+ classId + ", className=" + className + ", classCapacity=" + classCapacity + ", classDesc=" + classDesc
				+ ", classPrice=" + classPrice + ", openStartDate=" + openStartDate + ", openEndDate=" + openEndDate
				+ ", openStartTime=" + openStartTime + ", openEndTime=" + openEndTime + ", openclassDays="
				+ openclassDays + ", classMon=" + classMon + ", classTue=" + classTue + ", classWed=" + classWed
				+ ", classThur=" + classThur + ", classFri=" + classFri + ", classSat=" + classSat + ", classSun="
				+ classSun + ", subId=" + subId + ", memNum=" + memNum + ", memName=" + memName + "]";
	}
	public String getOpenclassId() {
		return openclassId;
	}
	public void setOpenclassId(String openclassId) {
		this.openclassId = openclassId;
	}
	public String getOpenclassName() {
		return openclassName;
	}
	public void setOpenclassName(String openclassName) {
		this.openclassName = openclassName;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassCapacity() {
		return classCapacity;
	}
	public void setClassCapacity(int classCapacity) {
		this.classCapacity = classCapacity;
	}
	public String getClassDesc() {
		return classDesc;
	}
	public void setClassDesc(String classDesc) {
		this.classDesc = classDesc;
	}
	public int getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(int classPrice) {
		this.classPrice = classPrice;
	}
	public String getOpenStartDate() {
		return openStartDate;
	}
	public void setOpenStartDate(String openStartDate) {
		this.openStartDate = openStartDate;
	}
	public String getOpenEndDate() {
		return openEndDate;
	}
	public void setOpenEndDate(String openEndDate) {
		this.openEndDate = openEndDate;
	}
	public String getOpenStartTime() {
		return openStartTime;
	}
	public void setOpenStartTime(String openStartTime) {
		this.openStartTime = openStartTime;
	}
	public String getOpenEndTime() {
		return openEndTime;
	}
	public void setOpenEndTime(String openEndTime) {
		this.openEndTime = openEndTime;
	}
	public String getOpenclassDays() {
		return openclassDays;
	}
	public void setOpenclassDays(String openclassDays) {
		this.openclassDays = openclassDays;
	}
	public String getClassMon() {
		return classMon;
	}
	public void setClassMon(String classMon) {
		this.classMon = classMon;
	}
	public String getClassTue() {
		return classTue;
	}
	public void setClassTue(String classTue) {
		this.classTue = classTue;
	}
	public String getClassWed() {
		return classWed;
	}
	public void setClassWed(String classWed) {
		this.classWed = classWed;
	}
	public String getClassThur() {
		return classThur;
	}
	public void setClassThur(String classThur) {
		this.classThur = classThur;
	}
	public String getClassFri() {
		return classFri;
	}
	public void setClassFri(String classFri) {
		this.classFri = classFri;
	}
	public String getClassSat() {
		return classSat;
	}
	public void setClassSat(String classSat) {
		this.classSat = classSat;
	}
	public String getClassSun() {
		return classSun;
	}
	public void setClassSun(String classSun) {
		this.classSun = classSun;
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
}