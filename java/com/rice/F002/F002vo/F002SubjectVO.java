package com.rice.F002.F002vo;

import org.springframework.stereotype.Component;

@Component
public class F002SubjectVO {
	private String subId;
	private String subCode;
	private String codeName;
	private String subName;
	private String subDesc;
	private String subRegDate;
	private String subAblDate;
	
	@Override
	public String toString() {
		return "F002SubjectVO [subId=" + subId + ", subCode=" + subCode + ", codeName=" + codeName + ", subName="
				+ subName + ", subDesc=" + subDesc + ", subRegDate=" + subRegDate + ", subAblDate=" + subAblDate + "]";
	}
	
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
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
}
