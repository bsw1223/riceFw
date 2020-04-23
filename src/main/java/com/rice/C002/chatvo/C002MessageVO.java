package com.rice.C002.chatvo;

public class C002MessageVO {
	/*
	 TABLE MESSAGE
	    msgDatetime    VARCHAR2(30),	// 메시지 전송시간
	    msgText    VARCHAR2(500),		// 메시지 내용
	    memNum    VARCHAR2(20) NOT NULL,	// 채팅참여자 일련변호
	    chatroomId    VARCHAR2(20) NOT NULL	// 채팅방 ID
	 */
	
	String msgDatetime;
	String msgText;
	String memNum;
	String chatroomId;
	
	public String getMsgDatetime() {
		return msgDatetime;
	}
	public void setMsgDatetime(String msgDatetime) {
		this.msgDatetime = msgDatetime;
	}
	public String getMsgText() {
		return msgText;
	}
	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}
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
