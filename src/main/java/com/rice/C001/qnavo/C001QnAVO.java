package com.rice.C001.qnavo;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("C001QnAVO")
public class C001QnAVO{
	
	private String boNum;
	private String boCode;
	private String boTitle;
	private String boContent;
	private String boRegDate;
	private String boUpdateDate;
	private String boURL;
	private String memNum;
	private List<classattachedFileVO> attachedFileList;
	

	public String getBoNum() {
		return boNum;
	}
	public void setBoNum(String boNum) {
		this.boNum = boNum;
	}
	public String getBoCode() {
		return boCode;
	}
	public void setBoCode(String boCode) {
		this.boCode = boCode;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoRegDate() {
		return boRegDate;
	}
	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}
	public String getBoUpdateDate() {
		return boUpdateDate;
	}
	public void setBoUpdateDate(String boUpdateDate) {
		this.boUpdateDate = boUpdateDate;
	}
	public String getBoURL() {
		return boURL;
	}
	public void setBoURL(String boURL) {
		this.boURL = boURL;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public List<classattachedFileVO> getAttachedFileList() {
		return attachedFileList;
	}
	public void setAttachedFileList(List<classattachedFileVO> attachedFileList) {
		this.attachedFileList = attachedFileList;
	}
}
