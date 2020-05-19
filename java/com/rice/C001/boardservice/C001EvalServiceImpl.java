package com.rice.C001.boardservice;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.C001.boarddao.C001EvalDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class C001EvalServiceImpl implements C001EvalService{
	private static final Logger logger = LoggerFactory.getLogger(C001EvalServiceImpl.class);
	
	@Autowired
	private C001EvalDAO c001EvalDAO;

	// 평가 생성을 위한 get sequence val 
	@Override
	public String getEvalId() {
		return c001EvalDAO.getEvalId();
	}
	// 수업의 학생 리스트 가져오기
	@Override
	public List<String> getMemList(Map info) {
		return c001EvalDAO.getMemList(info);
	}
	// 새로운 평가 생성
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertEval(Map info) {
		c001EvalDAO.insertEval(info);
		c001EvalDAO.insertEvalScore(info);
	}
	// 평가 목록 get
	@Override
	public List<Map<String, Object>> getEvalList(Map info) {
		return c001EvalDAO.getEvalList(info);
	}
	// 평가 입력 학생 점수 불러오기 
	@Override
	public List<Map<String, Object>> getEvalScore(Map info) {
		return c001EvalDAO.getEvalScore(info);
	}
	// 평가 점수 update 
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateScore(List<Map<String, Object>> info) {
		for(int i = 0 ; i < info.size() ; i++) {
			c001EvalDAO.updateScore(info.get(i));
		}
	}

	//////////////////학생//////////////////////
	// 성적 리스트 가져오기 
	@Override
	public List<Map<String, Object>> getStuScoreList(Map info) {
		return c001EvalDAO.getStuScoreList(info);
	}
	// 평균 성적 get
	@Override
	public List<Map<String, Object>> getAvgScore(Map info) {
		return c001EvalDAO.getAvgScore(info);
	}
	// 내 성적 chart get
	@Override
	public List<Map<String, Object>> getChartScore(Map info) {
		return c001EvalDAO.getChartScore(info);
	}
}
