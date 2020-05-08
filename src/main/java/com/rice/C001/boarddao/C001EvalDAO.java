package com.rice.C001.boarddao;

import java.util.List;
import java.util.Map;

public interface C001EvalDAO {
	// 평가 생성을 위한 get sequence val 
	public String getEvalId();
	// 수업의 학생 리스트 가져오기
	public List<String> getMemList(Map info);
	// 새로운 평가 생성
	public void insertEval(Map info);
	// 새로 등록된 평가에 학생 연결하기
	public void insertEvalScore(Map info);
	// 평가 목록 get
	public List<Map<String, Object>> getEvalList(Map info);
	// 평가 입력 학생 점수 불러오기 
	public List<Map<String, Object>> getEvalScore(Map info);
	// 평가 점수 update 
	public void updateScore(Map info);
	
	//////////////////학생//////////////////////
	// 성적 리스트 가져오기 
	public List<Map<String, Object>> getStuScoreList(Map info);
	// 평균 성적 get
	public List<Map<String, Object>> getAvgScore(Map info);
	// 내 성적 chart get
	public List<Map<String, Object>> getChartScore(Map info);
}
