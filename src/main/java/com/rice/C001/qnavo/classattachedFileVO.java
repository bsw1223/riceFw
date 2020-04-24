package com.rice.C001.qnavo;

import org.apache.ibatis.type.Alias;

@Alias("classattachedFileVO")
public class classattachedFileVO {
	
	private String boNum;
	private String fileName;
	private String filePath;
	private String saveFileName;
	private String fileSize;
	private String	fileCode;
	private String createDate;
	private String memId;
	private int CLASSFILENUM;
	
	
	
	
	public String getBoNum() {
		return boNum;
	}
	public void setBoNum(String boNum) {
		this.boNum = boNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileCode() {
		return fileCode;
	}
	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getCLASSFILENUM() {
		return CLASSFILENUM;
	}
	public void setCLASSFILENUM(int cLASSFILENUM) {
		CLASSFILENUM = cLASSFILENUM;
	}
	
}
