package com.rice.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.rice.B001.attendservice.B001AttendService;

@Component
public class AttendProcesser {
	private static final Logger logger = LoggerFactory.getLogger(AttendProcesser.class);
	
	@Autowired
	private B001AttendService b001AttendService;
	
											// fixedRate = 10000 : 10초 마다 실행
	@Scheduled(cron = "0 50 23 * * *") 		// cron = "0 50 23 * * *" 매일 11시 50분에 실행
	public void handle() {
		Date time = new Date();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		String currentDate = format.format(time);
		int currentDay = cal.get(Calendar.DAY_OF_WEEK);	// 1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토 

		logger.info("==========>>: " + currentDate + "=======" + currentDay);
		
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("currentDate", currentDate);
		info.put("currentDay", currentDay);
		
		List<Map<String, Object>> resultList = b001AttendService.getEnrId(info);
		info.put("enrId", resultList);
		logger.info("info===========" + info.toString());
		
		b001AttendService.insertAbsent(info);
	}
}
