package com.rice.F001.F001vo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/* F001 회원관리 */
@Component("F001VO")
public class F001VO {
	private static final Logger logger = LoggerFactory.getLogger(F001VO.class);
	/*
		memNum    VARCHAR2(20) DEFAULT '1000' NOT NULL,
	    memId    VARCHAR2(30) NOT NULL,
	    memPwd    VARCHAR2(20),
	    memName    VARCHAR2(50) NOT NULL,
	    memTel    VARCHAR2(30),
	    memEmail    VARCHAR2(100),
	    memJoinDate    VARCHAR2(30) DEFAULT SYSDATE,
	    memModifyDate    VARCHAR2(30) DEFAULT SYSDATE,
	    memLevel    INTEGER DEFAULT 1,
	    memPoint    INTEGER DEFAULT 0,
	    authId    VARCHAR2(10) DEFAULT '1001' NOT NULL,
	    memStateCode    VARCHAR2(20) DEFAULT '1100' NOT NULL,
	    snsId    VARCHAR2(255),
	    snsType    VARCHAR2(10)
	 */
	String memNum;
	String memId;
	String memPwd;
	String memName;
	String memTel;
	String memEmail;
	String memJoinDate;
	String memModifyDate;
	Integer memLevel;
	Integer memPoint;
	String authId;
	String memStateCode;
	String snsId;
	String snsType;
	
	public F001VO() {
		logger.info("F001VO");
	}
	
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
	public String getMemModifyDate() {
		return memModifyDate;
	}
	public void setMemModifyDate(String memModifyDate) {
		this.memModifyDate = memModifyDate;
	}
	public Integer getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(Integer memLevel) {
		this.memLevel = memLevel;
	}
	public Integer getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(Integer memPoint) {
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
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
}
