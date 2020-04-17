package com.rice.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rice.C001.qnavo.C001QnAVO;

@Component("fileUtils")
public class FileUtils {
	
	private static final String filepath ="C:\\download\\test";
	
	public List<Map<String, Object>>parseinsertfileinfo(C001QnAVO vo,MultipartHttpServletRequest mpRequest)throws Exception{
		
		
		Iterator<String> iterator =mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String orignialFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		String boNum = vo.getBoNum();
		File file = new File(filepath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()== false) {
				originalFileName = multipartFile.getOriginalFilename();
				orignialFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString()+ orignialFileExtension;
				
				file = new File(filepath+storedFileName);
				multipartFile.transferTo(file);
				listMap= new HashMap<String, Object>();
				listMap.put("boNum", boNum);
				listMap.put("ORG_FILENAME", originalFileName);
				listMap.put("STORED_FILENAME",storedFileName);
				listMap.put("FILESIZE", multipartFile.getSize());
				list.add(listMap);
				
			}
		}
				return list;
	}

	private static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
