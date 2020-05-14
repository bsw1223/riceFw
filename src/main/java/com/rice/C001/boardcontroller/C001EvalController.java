package com.rice.C001.boardcontroller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rice.C001.boardservice.C001EvalService;

@Controller
@RequestMapping("/eval/*")
public class C001EvalController {
	private static final Logger logger = LoggerFactory.getLogger(C001EvalController.class);
	
	@Autowired
	private C001EvalService c001EvalService;
	
	// �깉濡쒖슫 �룊媛� �깮�꽦�븯湲�
	@RequestMapping(value = "/insertEval", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> insertEval(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /insertEval");
		String evalId = c001EvalService.getEvalId();
		info.put("evalId", evalId);
		List<String> memList = c001EvalService.getMemList(info);
		info.put("memList", memList);
		
		logger.info(info.toString());
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			c001EvalService.insertEval(info);
			resultMap.put("insert_msg", "1");
		} catch (Exception e) {
			resultMap.put("insert_msg", "0");
		}
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	// �룊媛� 紐⑸줉 遺덈윭�삤湲�
	@RequestMapping(value = "/getEvalList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getEvalList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getEvalList");
		
		List<Map<String, Object>> resultMap = c001EvalService.getEvalList(info);
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	// �룊媛� �븰�깮 �젏�닔 紐⑸줉 遺덈윭�삤湲�
	@RequestMapping(value = "/getEvalScore", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getEvalScore(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getEvalList");
		
		List<Map<String, Object>> resultMap = c001EvalService.getEvalScore(info);
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	// �룊媛� �젏�닔 �뾽�뜲�씠�듃
	@RequestMapping(value = "/updateScore", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> updateScore(@RequestBody List<Map<String, Object>> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /updateScore");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			c001EvalService.updateScore(info);
			resultMap.put("update_msg", "1");
		} catch (Exception e) {
			resultMap.put("update_msg", "0");
		}
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	/////////////////////////�븰�깮///////////////////////////////
	// �꽦�쟻 由ъ뒪�듃 媛��졇�삤湲� 
	@RequestMapping(value = "/getStuScoreList", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getStuScoreList(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getStuScoreList");
		List<Map<String, Object>> resultMap = c001EvalService.getStuScoreList(info);
		logger.info("ajax log testtest" + resultMap.toString());		
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
	// 李⑦듃 �꽦�쟻 媛��졇�삤湲� 
	@RequestMapping(value = "/getChartScore", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<?> getChartScore(@RequestBody Map<String, Object> info, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {
		logger.info("get/post /getChartScore");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> avgScore = c001EvalService.getAvgScore(info);
		List<Map<String, Object>> chartScore = c001EvalService.getChartScore(info);
		
		resultMap.put("avgScore", avgScore);
		resultMap.put("chartScore", chartScore);
		
		return new ResponseEntity(resultMap, HttpStatus.OK);
	}
	
}
