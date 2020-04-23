package com.rice.C002.chatvo;

public class C002ChatroomVO {
	/*
		 TABLE CHATROOM
		    chatroomId    VARCHAR2(20) NOT NULL,	// 채팅방 ID
		    chatroomName    VARCHAR2(100),			// 채팅방 이름
		    memNum    VARCHAR2(20)					// 방장 번호
		    
		    memName VARCHAR2						// 방장 이름
	 */
	
	String chatroomId;
	String chatroomName;
	String memNum;
	
	public String getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(String chatroomId) {
		this.chatroomId = chatroomId;
	}
	public String getChatroomName() {
		return chatroomName;
	}
	public void setChatroomName(String chatroomName) {
		this.chatroomName = chatroomName;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
}
