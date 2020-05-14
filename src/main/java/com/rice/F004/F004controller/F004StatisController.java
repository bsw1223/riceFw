package com.rice.F004.F004controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.F004.F004service.F004StatisService;

@Controller
@RequestMapping("/statis/*")
public class F004StatisController {
	private static final Logger logger = LoggerFactory.getLogger(F004StatisController.class);
	
	@Autowired
	private F004StatisService f004StatisService;
	
	// 강사 매출 통계 페이지
	@RequestMapping(value = "/tchSales", method = RequestMethod.GET)
	public String gettchSales(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /statis/tchSales");
		
		return "F_tchSales";
	}
	
	// 강사 매출 list 가져오기
	@RequestMapping(value = "/getTchSales", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> gettchSalesList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /statis/getTchSales");
		List<Map<String, Object>> resultList= f004StatisService.getTchSalesList(info);
		
		return new ResponseEntity(resultList, HttpStatus.OK);
	}
	
	// 월 매출 통계 페이지
	@RequestMapping(value = "/monthSales", method = RequestMethod.GET)
	public String getmonthSales(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /statis/monthSales");
		
		return "F_monthSales";
	}
	
	// 월 매출 list 가져오기
	@RequestMapping(value = "/getMonthSales", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getmonthSalesList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /statis/getMonthSales");
		List<Map<String, Object>> resultList= f004StatisService.getmonthSales(info);
		
		return new ResponseEntity(resultList, HttpStatus.OK);
	}
}
