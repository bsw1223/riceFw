package com.rice.C001.boarddao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class C001EvalDAOImpl implements C001EvalDAO{
	private static final Logger logger = LoggerFactory.getLogger(C001EvalDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;

	// 평가 생성을 위한 get sequence val 
	@Override
	public String getEvalId() {
		return sqlsession.selectOne("mapper.eval.getEvalId");
	}
	// 수업의 학생 리스트 가져오기
	@Override
	public List<String> getMemList(Map info) {
		return sqlsession.selectList("mapper.eval.getMemList",info);
	}
	// 새로운 평가 생성
	@Override
	public void insertEval(Map info) {
		sqlsession.insert("mapper.eval.insertEval", info);
	}
	// 새로 등록된 평가에 학생 연결하기
	@Override
	public void insertEvalScore(Map info) {
		sqlsession.insert("mapper.eval.insertEvalScore", info);
	}
	// 평가 목록 get
	@Override
	public List<Map<String, Object>> getEvalList(Map info) {
		return sqlsession.selectList("mapper.eval.getEvalList", info);
	}
	// 평가 입력 학생 점수 불러오기 
	@Override
	public List<Map<String, Object>> getEvalScore(Map info) {
		return sqlsession.selectList("mapper.eval.getEvalScore", info);
	}
	// 평가 점수 update 
	@Override
	public void updateScore(Map info) {
		sqlsession.update("mapper.eval.updateScore", info);
	}

	//////////////////학생//////////////////////
	// 성적 리스트 가져오기 
	@Override
	public List<Map<String, Object>> getStuScoreList(Map info) {
		return sqlsession.selectList("mapper.eval.getStuScoreList", info);
	}
	// 평균 성적 get
	@Override
	public List<Map<String, Object>> getAvgScore(Map info) {
		return sqlsession.selectList("mapper.eval.getAvgScore", info);
	}
	// 내 성적 chart get
	@Override
	public List<Map<String, Object>> getChartScore(Map info) {
		return sqlsession.selectList("mapper.eval.getChartScore", info);
	}
}
