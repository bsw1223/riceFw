package com.rice.D002.bookvo;

public class D002BookVO {
	/*
	   TABLE BUILDING
		    bulName    VARCHAR2(100) NOT NULL,	// 건물명
		    bulMgr    VARCHAR2(50),				// 관리자
		    bulPhoneNum    VARCHAR2(100),		// 관리자번호
		    bulAddress    VARCHAR2(200),		// 주소
		    bulClassNum    INTEGER,				// 강의실 수
		    bulFloor    INTEGER,				// 층수
		    bulId    VARCHAR2(20) NOT NULL,		// 건물 ID
		    bulRemark    VARCHAR2(2000)			// 건물 비고
		    
		
		TABLE CLASSROOM
		    classCode    VARCHAR2(20) NOT NULL,	// 강의실종류(ex. 강의실2300, 스터디룸2301, 회의실2302 )
		    classNumber    INTEGER NOT NULL,	// 강의실호수
		    classFloorNum    INTEGER,			// 강의실층수
		    classCapacity    INTEGER,			// 수용인원
		    bulId    VARCHAR2(20) NOT NULL,		// 건물 ID
		    classId    VARCHAR2(20) NOT NULL,	// 강의실 ID
		    classRemark    VARCHAR2(2000)		// 강의실 비고
	 */
	
	String bulName;
	String bulId;
	String classId;
	String classNumber;
	
	public String getBulName() {
		return bulName;
	}
	public void setBulName(String bulName) {
		this.bulName = bulName;
	}
	public String getBulId() {
		return bulId;
	}
	public void setBulId(String bulId) {
		this.bulId = bulId;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassNumber() {
		return classNumber;
	}
	public void setClassNumber(String classNumber) {
		this.classNumber = classNumber;
	}	
}