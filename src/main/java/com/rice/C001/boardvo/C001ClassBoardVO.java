package com.rice.C001.boardvo;

import java.util.List;

public class C001ClassBoardVO {
	String boNum, boCode, boContent, boRegdate, boTitle, boUpdateDate, boURL, memNum, memId;
	int boViews, boLikes;
	
	List<C001FileUploadVO> filelist;
	
	public List<C001FileUploadVO> getFilelist() {
		return filelist;
	}
	public void setFilelist(List<C001FileUploadVO> filelist) {
		this.filelist = filelist;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getBoUpdateDate() {
		return boUpdateDate;
	}
	public void setBoUpdateDate(String boUpdateDate) {
		this.boUpdateDate = boUpdateDate;
	}
	public String getBoNum() {
		return boNum;
	}
	public void setBoNum(String boNum) {
		this.boNum = boNum;
	}
	public String getBoCode() {
		return boCode;
	}
	public void setBoCode(String boCode) {
		this.boCode = boCode;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoRegdate() {
		return boRegdate;
	}
	public void setBoRegdate(String boRegdate) {
		this.boRegdate = boRegdate;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoURL() {
		return boURL;
	}
	public void setBoURL(String boURL) {
		this.boURL = boURL;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public int getBoViews() {
		return boViews;
	}
	public void setBoViews(int boViews) {
		this.boViews = boViews;
	}
	public int getBoLikes() {
		return boLikes;
	}
	public void setBoLikes(int boLikes) {
		this.boLikes = boLikes;
	}
	@Override
	public String toString() {
		return "C001ClassBoardVO [boNum=" + boNum + ", boCode=" + boCode + ", boContent=" + boContent + ", boRegdate="
				+ boRegdate + ", boTitle=" + boTitle + ", boUpdateDate=" + boUpdateDate + ", boURL=" + boURL
				+ ", memNum=" + memNum + ", memId=" + memId + ", boViews=" + boViews + ", boLikes=" + boLikes
				+ ", filelist=" + filelist + "]";
	}
	
}
