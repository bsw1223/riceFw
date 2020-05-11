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

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		String toeicDate = h001HomeService.selectToeicDate();
		String toeicDateS = h001HomeService.selectToeicDateS();
		SimpleDateFormat toeicDateAll = new SimpleDateFormat("yy.MM.dd");
		SimpleDateFormat toeicDateAllS = new SimpleDateFormat("yy.MM.dd");
		Date compareDate= toeicDateAll.parse(todayDate);
		Date compareDateS= toeicDateAll.parse(todayDate);
		
		//System.out.println("toeicDate : "+toeicDate);
		
		int compare = toDayAll.compareTo(compareDate);
		int compareS = toDayAll.compareTo(compareDateS);
		//System.out.println(" compare  : "+compare);
		
		
		    final String DATE_PATTERN = "yy.MM.dd";
	        final int MILLI_SECONDS_PER_DAY = 24 * 60 * 60 * 1000;
	        String inputStartDate =  todayDate;
	        String inputEndDate =toeicDate;
	        String inputEndDateS =toeicDateS;
	        SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
	        Date startDate = sdf.parse(inputStartDate);
	        Date endDate = sdf.parse(inputEndDate);
	        Date endDateS = sdf.parse(inputEndDateS);
	        long difference = (endDate.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
	        long differenceS = (endDateS.getTime() - startDate.getTime()) / MILLI_SECONDS_PER_DAY;
	        System.out.println("differenceS :"+differenceS);
	        System.out.println("difference :"+difference);
		
		
		
		if(difference == 0 )
		{		
		//System.out.println("ybm �젒�냽�빐�꽌 諛쏆븘�샂");
		String URL = "https://exam.ybmnet.co.kr/toeic/"; 
		Document doc =Jsoup.connect(URL).get(); 
		Elements elemExDate = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(1) > a");
		String exDatet = elemExDate.toString();
		String exDate = exDatet.replace("<a href=\"/YBMSisacom.asp?SiteURL=https://appexam.ybmnet.co.kr&amp;pageURL=/toeic/receipt/receipt.asp?toeic_times=404\">", "")
				.replace("<span style=\"color:#dc2f3c\">(일)</span> 09:20</a>", "")
				.replace("<span style=\"color:#5384d0\">(토)</span> 14:20</a>", "");//�떆�뿕�씪
		h001HomeVO.setExDate(exDate);//�떆�뿕�씪
		//System.out.println("exDate : " +exDate);
		Elements elemrecepShedule = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(3)");
		String recepShedulet = elemrecepShedule.toString();
		String recepShedule = recepShedulet.replace("<td class=\"str\">", "").replace("(월) 오전 8시</td>", "")
											.replace("(수) 낮 12시</td>", "");//�젒�닔留덇컧
		//System.out.println("recepShedule : "+recepShedule);
		h001HomeVO.setRecepShedule(recepShedule);
		
		Elements elemDateRls = doc.select("#reg_table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(2)");
		String dateRlst = elemDateRls.toString();
		String dateRls = dateRlst.replace("<td class=\"str\">", "").replace("(목) 오전 6시</td>", "");//�꽦�쟻諛쒗몴�씪
		//System.out.println("dateRls : "+dateRls);
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
			
			//System.out.println(" exDate  : "+exDate);
			//System.out.println(" recepShedule  : "+recepShedule);
			//System.out.println(" dateRls  : "+dateRls);
			
		}
		
		
		
		
		if(differenceS == 0 )
		{		
			System.out.println("TS 접속해서 정보가져오기 ");
		String URLS = "https://exam.ybmnet.co.kr/toeicswt/"; 
		Document docS =Jsoup.connect(URLS).get(); 
		//System.out.println("docS :" +docS);
		Elements elemExDateS = docS.select("#tabSchedule1sub > table > tbody > tr > td > div > table > tbody > tr:nth-child(1) > td:nth-child(1) > strong");
		String exDatetS = elemExDateS.toString();
		System.out.println("exDatestS : "+exDatetS);
		String exDateS = exDatetS.replace("<strong>", "").replace("<span style=\"color:#458ace\">(토)</span></strong>", "")
								.replace("2020년 ", "20.")
								.replace("월 ", ".")
								.replace("일", "");
								
								
		System.out.println("exDateS : "+exDateS);//시험일
			
		h001HomeVO.setExDateS(exDateS);//�떆�뿕�씪
		
		
		Elements elemrecepSheduleS = docS.select("#tabSchedule1sub > table > tbody > tr > td > div > table > tbody > tr:nth-child(1) > td:nth-child(2)");
		String recepSheduletS = elemrecepSheduleS.toString();
		System.out.println("recepSheduletS : "+ recepSheduletS);
		String recepSheduleS = recepSheduletS.replace("<td>", "").replace("(목) 낮 12시</td>", "").replace("(금) 낮 12시</td>", "")
												.replace("2020년 ", "20.")
												.replace("월 ", ".")
												.replace("일", "");
		System.out.println("recepSheduleS: "+recepSheduleS);
		
		h001HomeVO.setRecepSheduleS(recepSheduleS);//성적발표 예정일
		
		
		Elements elemDateRlsS = docS.select("#tabSchedule1sub > table > tbody > tr > td > div > table > tbody > tr:nth-child(1) > td.left");
		System.out.println("elemDateRlsS : "+elemDateRlsS);
		String dateRlstS = elemDateRlsS.toString();
		String dateRlsS = dateRlstS.replace("<td class=\"left\"><span class=\"dday\">", "")
									.replace("D-10", "")
									.replace("D-9", "")
									.replace("D-8", "")
									.replace("D-7", "")
									.replace("D-6", "")
									.replace("D-5", "")
									.replace("D-4", "")
									.replace("D-3", "")
									.replace("D-2", "")
									.replace("D-1", "")
									.replace("</span>", "")
									.replace("(금) 오전 10시</td>", "")
									.replace("(금) 오후 2시</td>", "")		
									.replace("2020년 ", "20.")
									.replace("월 ", ".")
									.replace("일", "");
		
		System.out.println("dateRlsS : "+dateRlsS);
		h001HomeVO.setDateRlsS(dateRlsS);//접수마감일
		
		h001HomeService.updateToeicSheduleS(h001HomeVO);
		
		model.addAttribute("compareS",differenceS);
		model.addAttribute("dateRlsS",dateRlsS);
		model.addAttribute("exDateS",exDateS);
		model.addAttribute("recepSheduleS",recepSheduleS);
		}else {
			System.out.println("TS 접속안함 ");
			List<Map<String, Object>>selectDdayListS = h001HomeService.selectDdayListS();	
			System.out.println("�넗�씡 �젙蹂대━�뒪�듃 : "+selectDdayListS);
			
			String dateRlsS = (String) selectDdayListS.get(0).get("dateRls");
			String exDateS = selectDdayListS.get(0).get("exDate").toString();
			String recepSheduleS = selectDdayListS.get(0).get("recepShedule").toString();
			
			model.addAttribute("compareS",differenceS);
			model.addAttribute("dateRlsS",dateRlsS);
			model.addAttribute("exDateS",exDateS);
			model.addAttribute("recepSheduleS",recepSheduleS);
			
			System.out.println(" exDateS  : "+exDateS);
			System.out.println(" recepSheduleS  : "+recepSheduleS);
			System.out.println(" dateRlsS  : "+dateRlsS);
		}
		
		
		
		return "index";
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String main(Model model, HttpServletRequest request) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String authId= request.getParameter("authId");
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
}
