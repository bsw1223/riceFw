package com.rice.C001.boarddto;

import java.util.List;

import com.rice.C001.boardvo.C001FileUploadVO;

public class AttachFileDTO {
	String fileName, uploadPath, uuid;
	boolean image;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	
	int replyCnt;
	
	List<C001FileUploadVO> attachList;
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public List<C001FileUploadVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<C001FileUploadVO> attachList) {
		this.attachList = attachList;
	}
}
