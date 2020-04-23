package com.rice.D002.bookcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rice.A001.memvo.A001MemVO;
import com.rice.D002.bookservice.D002BookService;
import com.rice.D002.bookvo.D002BookVO;

@Controller
@RequestMapping("/booking/*")
public class D002BookController {
	private static final Logger logger = LoggerFactory.getLogger(D002BookController.class);
	
	@Autowired
	private D002BookService d002BookService;
	
	@RequestMapping(value = "/bookstudyroom", method = RequestMethod.GET)
	public String getBookStudyroom(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("get /bookstudyroom");
		return "D_Bookstudyroom";
	}
	
	@RequestMapping(value = "/getClassList", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getClassList(HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get /getClassList");
		List<Map<String, Object>> resultMap = d002BookService.getClassList();
		
		return resultMap;
	}
	
	@RequestMapping(value = "/getBookingList", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getBookingList(HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get /getBookingList");
		List<Map<String, Object>> resultMap = d002BookService.getBookingList();
		
		return resultMap;
	}
	
	@RequestMapping(value = "/getMybookList", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public List getMybookList(@RequestBody Map param,  HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get /getBookingList");
		List<Map<String, Object>> resultMap = d002BookService.getMybookList(param);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/getBookingInfo", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map getBookingInfo(@RequestParam("bookNum") String bookNum, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getBookingInfo");
		String bookMem = d002BookService.getBookingMem(bookNum);
		logger.info("bookMem : " + bookMem);
		Map<String, Object> bookInfo = d002BookService.getBookingInfo(bookNum);
 		
		HttpSession session = request.getSession(false);
		A001MemVO vo = (A001MemVO) session.getAttribute("loginMem");
		if(vo != null) {	// 로그인 정보가 있을 경우
			logger.info("vo.getMemNum() :" + vo.getMemNum());
			if(vo.getMemNum().equals(bookMem)) {	// 로그인 회원과 예약자가 같을 경우, 모달창 채우기
				bookInfo.put("modalMsg", "1");	// modal true
				
			} else {	// 로그인 회원과 예약자가 다를 경우, 
				bookInfo.put("modalMsg", "0");	// modal false
			}
		}
		
		return bookInfo;
	}
	
	@RequestMapping(value = "/getClassInfo", method =  {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public Map getClassInfo(@RequestParam("classId") String classId, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getClassInfo");
		Map<String, Object> resultMap = d002BookService.getClassInfo(classId);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/insertBooking", method = RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public String insertBooking(@RequestBody D002BookVO d002BookVO, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post /insertBooking");
		String result = null;
		try {
			d002BookService.insertBooking(d002BookVO);
			result = "1";
		} catch (Exception e) {
			result = "0";
		}
		return result;
	}
	
	@RequestMapping(value = "/deleteBooking", method = RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public String deleteBooking(@RequestBody D002BookVO d002BookVO, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post /deleteBooking");
		String result = null;
		try {
			d002BookService.deleteBooking(d002BookVO);
			result = "1";
		} catch (Exception e) {
			result = "0";
		}
		return result;
	}
	
	@RequestMapping(value = "/updateBooking", method = RequestMethod.POST, produces="application/json; charset=utf8")
	@ResponseBody
	public String updateBooking(@RequestBody D002BookVO d002BookVO, HttpServletRequest request, HttpServletResponse response) {
		logger.info("post /updateBooking");
		String result = null;
		try {
			d002BookService.updateBooking(d002BookVO);
			result = "1";
		} catch (Exception e) {
			result = "0";
		}
		return result;
	}
}
