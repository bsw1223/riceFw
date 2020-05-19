package com.rice.C001.boardvo;

public class C001CommentVO {
	@Override
	public String toString() {
		return "C001CommentVO [boNum=" + boNum + ", comtNum=" + comtNum + ", parentNum=" + parentNum + ", userId="
				+ userId + ", comtRegdate=" + comtRegdate + ", comtContent=" + comtContent + ", comtUpdateDate="
				+ comtUpdateDate + "]";
	}

	String boNum, comtNum, parentNum, userId, comtRegdate, comtContent, comtUpdateDate;

	public String getBoNum() {
		return boNum;
	}

	public void setBoNum(String boNum) {
		this.boNum = boNum;
	}

	public String getComtNum() {
		return comtNum;
	}

	public void setComtNum(String comtNum) {
		this.comtNum = comtNum;
	}

	public String getParentNum() {
		return parentNum;
	}

	public void setParentNum(String parentNum) {
		this.parentNum = parentNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getComtRegdate() {
		return comtRegdate;
	}

	public void setComtRegdate(String comtRegdate) {
		this.comtRegdate = comtRegdate;
	}

	public String getComtContent() {
		return comtContent;
	}

	public void setComtContent(String comtContent) {
		this.comtContent = comtContent;
	}

	public String getComtUpdateDate() {
		return comtUpdateDate;
	}

	public void setComtUpdateDate(String comtUpdateDate) {
		this.comtUpdateDate = comtUpdateDate;
	}
}
