package com.rice.common;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.ibleaders.utility.ib_json.parser.JSONParser;
import com.rice.F001.F001service.F001LectureService;
import com.rice.F001.F001vo.F001LectureVO;
import com.rice.common.KakaoPay;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; 
 
@Controller
public class KakaoPayController {

	@Autowired
    private KakaoPay kakaopay;
    @Autowired
    private F001LectureService f001LectureService;

    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
	@RequestMapping(value = "/kakaoPay", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=utf8")
	public String kakaoPay(@RequestParam Map<String,Object> insertEnrolLecS, KakaoPayApprovalVO kakaoPayApprovalVO,AmountVO amountVO,F001LectureVO f001LectureVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//수강신청 insert
		//List<HashMap> wholeEnrol = new ArrayList<HashMap>();
		
		JsonUtil jutil = new JsonUtil();
		//System.out.println(insertEnrolLecS.get("wholeEnrol").getClass().getName());
		String wholeEnrol = (String) insertEnrolLecS.get("wholeEnrol");

		JSONArray jsonarr = new JSONArray(wholeEnrol);
		
		List<Map<String, Object>> tmp = jutil.getListMapFromJsonArray(jsonarr);
	
		//System.out.println("===========" + tmp.toString());
		
		insertEnrolLecS.put("wholeEnrol", tmp);
		
		System.out.println("컨트롤러 : "+insertEnrolLecS.get("wholeEnrol"));
		System.out.println(insertEnrolLecS.get("wholeEnrol").getClass().getName());
		List whoelSub = new ArrayList();
		 whoelSub =  (List) insertEnrolLecS.get("wholeEnrol");
		System.out.println("size : "+whoelSub.size());	
		System.out.println("type : "+whoelSub.get(0).getClass().getName());	
		System.out.println("whoelSub.get(0) :"+whoelSub.get(0));	
		
		ArrayList classIdList = new ArrayList();
		for(int i =0 ; i<whoelSub.size();i++) {
		Object stringTextO = whoelSub.get(i);
		String stringText = stringTextO.toString();
		String splitId = stringText.substring(stringText.length()-5, stringText.length()-1);//ClassId 하나씩 스트링으로 잘라냄
		classIdList.add(splitId);
		System.out.println("classIdList : "+classIdList);
		}
				
		HttpSession session = request.getSession(false);
		/*
		 * if(session != null){session.invalidate();} session =
		 * request.getSession(true);
		 */
		   session.setAttribute("classIdList", classIdList);
//		   ArrayList sessionClassIdList = new ArrayList();//세션사용
//		   sessionClassIdList.add(session.getAttribute("classIdList"));//세션에 저장
//		   System.out.println("sessionClassIdList :"+sessionClassIdList);
		    
		    
		    
		f001LectureService.insertEnrolLec(insertEnrolLecS);
			
				
		//System.out.println("controller_ selectLecPlanId : "+ selectLecPlanId);
		//System.out.println("kakaoPayApprovalVO : "+kakaoPayApprovalVO);
		//System.out.println("amountVO : "+amountVO.toString());
		//System.out.println("f001LectureVO  : "+f001LectureVO.toString());
		//System.out.println(f001LectureVO.getClassIdKakao());
		return "redirect:" + kakaopay.kakaoPayReady(kakaoPayApprovalVO,amountVO);
		
	}
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
    	// System.out.println("성공");
    	 model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    	 return "F_EnrolSucess";
    }
 
}