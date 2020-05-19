package com.rice.C002.friendvo;

public class C002FriendVO {
	/*
	  TABLE OPENCLASS
		    openclassId    VARCHAR2(20) NOT NULL,	// '개설교과과정ID'
		    memNum    VARCHAR2(20) NOT NULL,		// '사용자(강사)일련번호'
		    openclassName    VARCHAR2(100),			// '개설교과명'
		    
	  TABLE ENROLMENT
		    enrId    VARCHAR2(20) NOT NULL,			// '수강신청ID'
		    openclassId    VARCHAR2(20) NOT NULL,	// '개설교과과정ID'
		    memNum    VARCHAR2(20) NOT NULL,		// '수강신청자(학생)일련번호'
		    openclassName    VARCHAR2(100)			// '개설교과명'
	 */
	

	private String memNum;		// 학생 번호
	private String memName;		// 학생 이름
	private String openclassId;	// 수강 신청 번호
	private String openclassName;	// 수강 신청 과목명
	
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
}
