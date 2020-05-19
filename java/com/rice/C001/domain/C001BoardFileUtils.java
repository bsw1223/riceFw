package com.rice.C001.domain;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class C001BoardFileUtils {
	private static final String filePath="c:\\dev\\file\\";
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String fileName = null;
		String fileNameExtension = null;
		String saveFilename= null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		
		String bno = (String)map.get("IDX");
		
		File file = new File(filePath);
		if(file.exists()==false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			
				multipartFile = multipartHttpServletRequest.getFile(iterator.next());
				if(multipartFile.isEmpty()==false) {
					fileName = multipartFile.getOriginalFilename();
					fileNameExtension=fileName.substring(fileName.lastIndexOf("."));
					saveFilename = C001BoardCommonUtils.getRandomString() + fileNameExtension;
					
					file = new File(filePath + saveFilename);
					multipartFile.transferTo(file);
					
					listMap = new HashMap<String,Object>();
					listMap.put("bno", bno);
					listMap.put("fileName", fileName);
					listMap.put("saveFilename", saveFilename);
					listMap.put("saveFilename", saveFilename);
					listMap.put("filesize", multipartFile.getSize());
					list.add(listMap);
					
				}
		}
		
		return list;
	}
				


}
