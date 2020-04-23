package com.rice.C002.chatvo;

public class C002MemberChatVO {
	/*
	 	TABLE MEMBERCHAT
		    memNum    VARCHAR2(20)     NOT NULL,
		    chatroomId    VARCHAR2(20) NOT NULL
	 */
	
	String memNum;
	String chatroomId;
	
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getChatroomId() {
		return chatroomId;
	}
	public void setChatroomId(String chatroomId) {
		this.chatroomId = chatroomId;
	}
}
