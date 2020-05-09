package com.rice.H001.homecontroller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
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

import com.rice.H001.homeservice.H001HomeService;
import com.rice.H001.homevo.H001HomeVO;

import com.fasterxml.jackson.core.JsonProcessingException; 
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/*")
public class H001HomeController {
	@Autowired
	private H001HomeService h001HomeService;
	private H001HomeVO h001HomeVO;
	
	private static final Logger logger = LoggerFactory.getLogger(H001HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, H001HomeVO h001HomeVO, HttpServletRequest request) throws IOException, ParseException {	
		//토익 접수 크롤링

		//인터넷접수, 추가접수, 시험일자, 성적발표일
		SimpleDateFormat today = new SimpleDateFormat ("yy.MM.dd");
		Date time = new Date();
		//�삤�뒛�궇吏� 諛쏆븘�샂
		String todayDate = today.format(time);
		Date toDayAll= today.parse(todayDate);
		
		//System.out.println("�삤�뒛 : " +toDayAll);
		//System.out.println("�삤�뒛2 : " +todayDate);

		
		//db�궇吏� 諛쏆븘���꽌 鍮꾧탳 諛� 鍮쇨린, 鍮쇨린�뒗 dday�뿉 �궗�슜
		String toeicDate = h001HomeService.selectToeicDate();
		SimpleDateFormat toeicDateAll = new SimpleDateFormat("yy.MM.dd");
		Date compareDate= toeicDateAll.parse(todayDate);
		
		//System.out.println("toeicDate : "+toeicDate);
		
		int compare = toDayAll.compareTo(compareDate);
		//System.out.println(" compare  : "+compare);
		
		
		//�궇吏� 李⑥씠
		    final String DATE_PATTERN = "yy.MM.dd";
	        final int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
	        String inputStartDate =  todayDate;
	        String inputEndDate =toeicDate;
	        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
	        Date startDate = sdf.parse(inputStartDate);
	        Date endDate = sdf.parse(inputEndDate);
	        long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
	      //  System.out.println(difference);
		
	
	       


		
		
		
		if(difference < 0 )
		{		
		System.out.println("ybm �젒�냽�빐�꽌 諛쏆븘�샂");
		String URL = "https://exam.ybmnet.co.kr/toeic/"; 
		Document doc =Jsoup.connect(URL).get(); 
		Elements elemExDate = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > a");
		String exDatet = elemExDate.toString();
		String exDate = exDatet.replace("<a href=\"/YBMSisacom.asp?SiteURL=https://appexam.ybmnet.co.kr&amp;pageURL=/toeic/receipt/receipt.asp?toeic_times=404\">", "")
				.replace("<span style=\"color:#dc2f3c\">(�씪)</span> 09:20</a>", "")
				.replace("<span style=\"color:#5384d0\">(�넗)</span> 14:20</a>", "");//�떆�뿕�씪
		h001HomeVO.setExDate(exDate);//�떆�뿕�씪
		//System.out.println("�떆�뿕�씪 : " +exDate);
		
		Elements elemrecepShedule = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(3)");
		String recepShedulet = elemrecepShedule.toString();
		String recepShedule = recepShedulet.replace("<td class=\"str\">", "").replace("(�썡) �삤�쟾 8�떆</td>", "");//�젒�닔留덇컧
		//System.out.println("�젒�닔留덇컧 : "+recepShedule);
		h001HomeVO.setRecepShedule(recepShedule);
		
		Elements elemDateRls = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(2)");
		String dateRlst = elemDateRls.toString();
		String dateRls = dateRlst.replace("<td class=\"str\">", "").replace("(紐�) �삤�쟾 6�떆</td>", "");//�꽦�쟻諛쒗몴�씪
		//System.out.println("�꽦�쟻諛쒗몴�씪 : "+dateRls);
		h001HomeVO.setDateRls(dateRls);
		
		h001HomeService.updateToeicShedule(h001HomeVO);
		
		model.addAttribute("compare",difference);
		model.addAttribute("dateRls",dateRls);
		model.addAttribute("exDate",exDate);
		model.addAttribute("recepShedule",recepShedule);
		
		
		
		//System.out.println(" exDate  : "+exDate);
		//System.out.println(" recepShedule  : "+recepShedule);
		//System.out.println(" dateRls  : "+dateRls);
		
		}else {
			
			List<Map<String, Object>>selectDdayList = h001HomeService.selectDdayList();	
			//System.out.println("�넗�씡 �젙蹂대━�뒪�듃 : "+selectDdayList);
			
			String dateRls = (String) selectDdayList.get(0).get("dateRls");
			String exDate = selectDdayList.get(0).get("exDate").toString();
			String recepShedule = selectDdayList.get(0).get("recepShedule").toString();
			
			model.addAttribute("compare",difference);
			model.addAttribute("dateRls",dateRls);
			model.addAttribute("exDate",exDate);
			model.addAttribute("recepShedule",recepShedule);
			
		//	System.out.println(" exDate  : "+exDate);
		//	System.out.println(" recepShedule  : "+recepShedule);
		//	System.out.println(" dateRls  : "+dateRls);
			
		}
		
		
		return "index";
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String main(Model model, HttpServletRequest request) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String authId= request.getParameter("authId");
		String locale= request.getParameter("locale");
		List<Map<String, Object>>map = h001HomeService.getMenuList((String)authId);//1000은 테스트용  authId로 변경해야함
		String mapList = mapper.writeValueAsString(map);
		
		return  mapList;
	}
	
	@RequestMapping(value = "/sublist", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sublist(Model model, HttpServletRequest request) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String memnum= request.getParameter("memnum");
		List<Map<String, Object>>map = h001HomeService.selectSubjectList((String)memnum);//1000은 테스트용  authId로 변경해야함
		String mapListSub = mapper.writeValueAsString(map);
		
		return  mapListSub;
	}
	
	@RequestMapping(value = "selectSysdate", method = RequestMethod.GET, produces = "application/json ; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectSysdate(HttpServletRequest request) {
		Map<String, Object> selectSysdate = h001HomeService.selectSysdate();//1000은 테스트용  authId로 변경해야함
		System.out.println("selectSysdate_controller : "+selectSysdate);
		
		return  selectSysdate;
	}

	@RequestMapping(value = "dateClassChoice", produces = "application/text; charset=utf8")
	@ResponseBody
	public List<Map<String, Object>> dateClassChoice(H001HomeVO h001HomeVO, HttpServletRequest request) {
		List<Map<String, Object>> dateClassChoice = h001HomeService.dateClassChoice(h001HomeVO);
		
		return  dateClassChoice;
	}
	
	//오늘 날짜 받아오기
	@RequestMapping(value = "selectDateToday", method = RequestMethod.GET, produces = "application/json ; charset=utf8")
	@ResponseBody
	public Map<String, Object> selectDateToday(HttpServletRequest request) {
		Map<String, Object> selectDateToday = h001HomeService.selectDateToday();
		System.out.println("selectDateToday : "+selectDateToday);
		
		return  selectDateToday;
	}
	
	
	// 오늘 수업 목록 가져오기
	@RequestMapping(value = "/getTodayClass", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getTodayClass(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getTodayClass");
		List<Map<String, Object>> resultList = h001HomeService.getTodayClass(info);
		
		return new ResponseEntity(resultList, HttpStatus.OK);
	}
	
}
