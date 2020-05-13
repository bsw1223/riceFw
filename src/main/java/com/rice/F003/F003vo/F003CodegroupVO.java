package com.rice.F003.F003vo;

import org.springframework.stereotype.Component;

@Component
public class F003CodegroupVO {
	private String codeGroup;
	private String codeGroupName;
	
	@Override
	public String toString() {
		return "F003CodegroupVO [codeGroup=" + codeGroup + ", codeGroupName=" + codeGroupName + "]";
	}
	public String getCodeGroup() {
		return codeGroup;
	}
	public void setCodeGroup(String codeGroup) {
		this.codeGroup = codeGroup;
	}
	public String getCodeGroupName() {
		return codeGroupName;
	}
	public void setCodeGroupName(String codeGroupName) {
		this.codeGroupName = codeGroupName;
	}
}
