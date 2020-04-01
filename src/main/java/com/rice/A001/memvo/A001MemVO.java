package com.rice.A001.memvo;


public class A001MemVO {
	/*
	    memNum    VARCHAR2(20) DEFAULT '1000' NOT NULL,
	    memId    VARCHAR2(20) NOT NULL,
	    memPwd    VARCHAR2(20) NOT NULL,
	    memName    VARCHAR2(30) NOT NULL,
	    memTel    VARCHAR2(30) NOT NULL,
	    memEmail    VARCHAR2(50) NOT NULL,
	    memJoinDate    VARCHAR2(30) DEFAULT SYSDATE NOT NULL,
	    memLevel    INTEGER DEFAULT 1,
	    memPoint    INTEGER DEFAULT 0,
	    authId    VARCHAR2(10) NOT NULL,
	    memStateCode    VARCHAR2(20) DEFAULT '1100' NOT NULL
	 */
	
	private String memNum;
	private String memId;
	private String memPwd;
	private String memName;
	private String memTel;
	private String memEmail;
	private String memJoinDate;
	private Long memLevel;
	private Long memPoint;
	private String authId;
	private String memStateCode;
	
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemJoinDate() {
		return memJoinDate;
	}
	public void setMemJoinDate(String memJoinDate) {
		this.memJoinDate = memJoinDate;
	}
	public Long getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(Long memLevel) {
		this.memLevel = memLevel;
	}
	public Long getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(Long memPoint) {
		this.memPoint = memPoint;
	}
	public String getAuthId() {
		return authId;
	}
	public void setAuthId(String authId) {
		this.authId = authId;
	}
	public String getMemStateCode() {
		return memStateCode;
	}
	public void setMemStateCode(String memStateCode) {
		this.memStateCode = memStateCode;
	}
}
