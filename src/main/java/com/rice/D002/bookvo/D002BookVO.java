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
		    
		TABLE BOOKING
		    bookNum    VARCHAR2(200) NOT NULL,	// 대여번호 (sequence)
		    classId    VARCHAR2(20) NOT NULL,	// 강의실 ID
		    bookStartTime    VARCHAR2(50) NOT NULL,	// 대여시작시간
		    bookEndTime    VARCHAR2(50) NOT NULL,	// 대여종료시간
		    bookPurpose    VARCHAR2(2000),			// 대여 사유
		    bookCode    VARCHAR2(20) DEFAULT '1300' NOT NULL,	// 대여상태코드
		    memNum    VARCHAR2(20) NOT NULL,		// 사용자 일련번호
		    bookTitle    VARCHAR2(200) NOT NULL		// 대여명
	 */
	
	String bulName;
	String bulId;
	String classId;
	String classNumber;

	String bookTitle;
	String bookStartTime;
	String bookEndTime;
	String bookPurpose;
	String memNum;
	
	@Override
	public String toString() {
		return "D002BookVO [bulName=" + bulName + ", bulId=" + bulId + ", classId=" + classId + ", classNumber="
				+ classNumber + ", bookTitle=" + bookTitle + ", bookStartTime=" + bookStartTime + ", bookEndTime="
				+ bookEndTime + ", bookPurpose=" + bookPurpose + ", memNum=" + memNum + "]";
	}	
	
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
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookStartTime() {
		return bookStartTime;
	}
	public void setBookStartTime(String bookStartTime) {
		this.bookStartTime = bookStartTime;
	}
	public String getBookEndTime() {
		return bookEndTime;
	}
	public void setBookEndTime(String bookEndTime) {
		this.bookEndTime = bookEndTime;
	}
	public String getBookPurpose() {
		return bookPurpose;
	}
	public void setBookPurpose(String bookPurpose) {
		this.bookPurpose = bookPurpose;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
}