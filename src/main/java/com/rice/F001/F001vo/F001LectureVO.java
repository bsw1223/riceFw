package com.rice.F001.F001vo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/* F001 회원관리 */
@Component
public class F001LectureVO {
	private static final Logger logger = LoggerFactory.getLogger(F001LectureVO.class);
	String subId = null;
	String codeName = null;
	String codeOrder = null;
	String subCode = null;
	String subDesc = null;
	String subRegDate = null;
	String subAblDate = null;
	String subName = null;
	String memNum = null;
	String openStartDate = null;
	String classId= null;
	String classDesc= null;
    int classCapacity= 0;
    String classPrice= null;
    String openclassName= null;
    String planId = null;
    String openEndDate= null;
    String openStartTime= null;
    String openEndTime= null;
	
	
	
	
	
    
    public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassDesc() {
		return classDesc;
	}
	public void setClassDesc(String classDesc) {
		this.classDesc = classDesc;
	}
	public int getClassCapacity() {
		return classCapacity;
	}
	public void setClassCapacity(int classCapacity) {
		this.classCapacity = classCapacity;
	}
	public String getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(String classPrice) {
		this.classPrice = classPrice;
	}
	public String getOpenclassName() {
		return openclassName;
	}
	public void setOpenclassName(String openclassName) {
		this.openclassName = openclassName;
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
	
	public String getOpenStartDate() {
		return openStartDate;
	}
	public void setOpenStartDate(String openStartDate) {
		this.openStartDate = openStartDate;
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	
	
	
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	@Override
	public String toString() {
		return "F001LectureVO [subId=" + subId + ", codeName=" + codeName + ", codeOrder=" + codeOrder + ", subCode="
				+ subCode + ", subDesc=" + subDesc + ", subRegDate=" + subRegDate + ", subAblDate=" + subAblDate
				+ ", subName=" + subName + ", getSubName()=" + getSubName() + ", getSubCode()=" + getSubCode()
				+ ", getSubDesc()=" + getSubDesc() + ", getSubRegDate()=" + getSubRegDate() + ", getSubAblDate()="
				+ getSubAblDate() + ", getSubId()=" + getSubId() + ", getCodeName()=" + getCodeName()
				+ ", getCodeOrder()=" + getCodeOrder() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getSubDesc() {
		return subDesc;
	}
	public void setSubDesc(String subDesc) {
		this.subDesc = subDesc;
	}
	public String getSubRegDate() {
		return subRegDate;
	}
	public void setSubRegDate(String subRegDate) {
		this.subRegDate = subRegDate;
	}
	public String getSubAblDate() {
		return subAblDate;
	}
	public void setSubAblDate(String subAblDate) {
		this.subAblDate = subAblDate;
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(String codeOrder) {
		this.codeOrder = codeOrder;
	}
	public static Logger getLogger() {
		return logger;
	}
	

}
