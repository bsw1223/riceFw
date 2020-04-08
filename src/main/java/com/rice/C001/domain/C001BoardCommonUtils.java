package com.rice.C001.domain;

import java.util.UUID;

public class C001BoardCommonUtils {

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-","");
	}
	
}
