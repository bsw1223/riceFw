package com.rice.C001.boardvo;

import java.util.Date;

public class C001BoardVO {
	private Long bno;
	private String title, content, writer;
	private Date regdate, updateDate;
	

	
	
	
	public C001BoardVO() {
	}



	@Override
	public String toString() {
		return "C001BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", updateDate=" + updateDate + "]";
	}



	public C001BoardVO(Long bno, String title, String content, String writer, Date regdate, Date updateDate) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.updateDate = updateDate;
	}
	
	
	
	public C001BoardVO(Long bno, String title, String content, String writer, Date updateDate) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.updateDate = updateDate;
	}



	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	

}
