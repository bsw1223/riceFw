package com.rice.F001.F001vo;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/* F001 회원관리 */
@Component
public class F001LectureVO {
	private static final Logger logger = LoggerFactory.getLogger(F001LectureVO.class);
	String subId = null;
	String codeName = null;
	String codeOrder = null;
	String subCode = null;
	String subDesc = null;
	String subRegDate = null;
	String subAblDate = null;
	String subName = null;
	String memNum = null;
	String memName = null;
	String openStartDate = null;
	String classId= null;
	String classDesc= null;
    int classCapacity= 0;
    String classPrice= null;
    String openclassName= null;
    String planId = null;
    String openEndDate= null;
    String openStartTime= null;
    String openEndTime= null;
    String bulId = null;
	ArrayList<String> classIdKakao =null;
	String item_name = null;
	ArrayList<String> classPriceS =null;
	ArrayList<String> openclassNameS =null;
	String cId= null;
	String cName= null;
	String cPrice= null;
	String cartOrderId= null;
	String classSun = null;
	String classMon = null;
	String classTue = null;
	String classWed = null;
	String classThur = null;
	String classFri = null;
	String classSat = null;
	
	
	
	
    
  
	public String getClassSun() {
		return classSun;
	}
	public void setClassSun(String classSun) {
		this.classSun = classSun;
	}
	public String getClassMon() {
		return classMon;
	}
	public void setClassMon(String classMon) {
		this.classMon = classMon;
	}
	public String getClassTue() {
		return classTue;
	}
	public void setClassTue(String classTue) {
		this.classTue = classTue;
	}
	public String getClassWed() {
		return classWed;
	}
	public void setClassWed(String classWed) {
		this.classWed = classWed;
	}
	public String getClassThur() {
		return classThur;
	}
	public void setClassThur(String classThur) {
		this.classThur = classThur;
	}
	public String getClassFri() {
		return classFri;
	}
	public void setClassFri(String classFri) {
		this.classFri = classFri;
	}
	public String getClassSat() {
		return classSat;
	}
	public void setClassSat(String classSat) {
		this.classSat = classSat;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPrice() {
		return cPrice;
	}
	public void setcPrice(String cPrice) {
		this.cPrice = cPrice;
	}
	public String getCartOrderId() {
		return cartOrderId;
	}
	public void setCartOrderId(String cartOrderId) {
		this.cartOrderId = cartOrderId;
	}
	@Override
	public String toString() {
		return "F001LectureVO [subId=" + subId + ", codeName=" + codeName + ", codeOrder=" + codeOrder + ", subCode="
				+ subCode + ", subDesc=" + subDesc + ", subRegDate=" + subRegDate + ", subAblDate=" + subAblDate
				+ ", subName=" + subName + ", memNum=" + memNum + ", memName=" + memName + ", openStartDate="
				+ openStartDate + ", classId=" + classId + ", classDesc=" + classDesc + ", classCapacity="
				+ classCapacity + ", classPrice=" + classPrice + ", openclassName=" + openclassName + ", planId="
				+ planId + ", openEndDate=" + openEndDate + ", openStartTime=" + openStartTime + ", openEndTime="
				+ openEndTime + ", bulId=" + bulId + ", classIdKakao=" + classIdKakao + ", item_name=" + item_name
				+ ", classPriceS=" + classPriceS + ", openclassNameS=" + openclassNameS + "]";
	}
	public ArrayList<String> getOpenclassNameS() {
		return openclassNameS;
	}
	public void setOpenclassNameS(ArrayList<String> openclassNameS) {
		this.openclassNameS = openclassNameS;
	}
	
	public ArrayList<String> getClassPriceS() {
		return classPriceS;
	}
	public void setClassPriceS(ArrayList<String> classPriceS) {
		this.classPriceS = classPriceS;
	}
	
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public ArrayList<String> getClassIdKakao() {
		return classIdKakao;
	}
	public void setClassIdKakao(ArrayList<String> classIdKakao) {
		this.classIdKakao = classIdKakao;
	}
	public String getMemName() {
    	return memName;
    }
    public void setMemName(String memName) {
    	this.memName = memName;
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
	public String getClassDesc() {
		return classDesc;
	}
	public void setClassDesc(String classDesc) {
		this.classDesc = classDesc;
	}
	public int getClassCapacity() {
		return classCapacity;
	}
	public void setClassCapacity(int classCapacity) {
		this.classCapacity = classCapacity;
	}
	public String getClassPrice() {
		return classPrice;
	}
	public void setClassPrice(String classPrice) {
		this.classPrice = classPrice;
	}
	public String getOpenclassName() {
		return openclassName;
	}
	public void setOpenclassName(String openclassName) {
		this.openclassName = openclassName;
	}
	public String getOpenEndDate() {
		return openEndDate;
	}
	public void setOpenEndDate(String openEndDate) {
		this.openEndDate = openEndDate;
	}
	public String getOpenStartTime() {
		return openStartTime;
	}
	public void setOpenStartTime(String openStartTime) {
		this.openStartTime = openStartTime;
	}
	public String getOpenEndTime() {
		return openEndTime;
	}
	public void setOpenEndTime(String openEndTime) {
		this.openEndTime = openEndTime;
	}
	
	public String getOpenStartDate() {
		return openStartDate;
	}
	public void setOpenStartDate(String openStartDate) {
		this.openStartDate = openStartDate;
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	
	
	
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getSubDesc() {
		return subDesc;
	}
	public void setSubDesc(String subDesc) {
		this.subDesc = subDesc;
	}
	public String getSubRegDate() {
		return subRegDate;
	}
	public void setSubRegDate(String subRegDate) {
		this.subRegDate = subRegDate;
	}
	public String getSubAblDate() {
		return subAblDate;
	}
	public void setSubAblDate(String subAblDate) {
		this.subAblDate = subAblDate;
	}
	public String getSubId() {
		return subId;
	}
	public void setSubId(String subId) {
		this.subId = subId;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getCodeOrder() {
		return codeOrder;
	}
	public void setCodeOrder(String codeOrder) {
		this.codeOrder = codeOrder;
	}
	public static Logger getLogger() {
		return logger;
	}
	

}
