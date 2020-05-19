package com.rice.B001.attenddao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class B001AttendDAOImpl implements B001AttendDAO {
	private static final Logger logger = LoggerFactory.getLogger(B001AttendDAOImpl.class);

	@Autowired
	private SqlSession sqlsession;

	// 접근 가능한 IP 대역 가져오기
	@Override
	public Map<String, String> getIpAddress() {
		return sqlsession.selectOne("mapper.attend.getIpAddress");
	}
	// 수업 목록 가져오기
	@Override
	public List<Map<String, Object>> getClassList(Map info) {
		return sqlsession.selectList("mapper.attend.getClassList", info);
	} 
	// 입력한 수업번호/이메일/비밀번호가 맞는지 check //// 맞으면 1, 아니면 0
	@Override
	public int checkEmailPwd(Map info) {
		return sqlsession.selectOne("mapper.attend.checkEmailPwd", info);
	}
	// 입력한 시간이 수업 시간이 맞는지 check
	@Override
	public int checkClassTime(Map info) {
		return sqlsession.selectOne("mapper.attend.checkClassTime", info);
	}
	// insert 하기 위한 value 가져오기
	@Override
	public Map<String, Object> getinsertVal(Map info) {
		return sqlsession.selectOne("mapper.attend.getinsertVal", info);
	}
	// insert 출석
	@Override
	public void insertAttendance(Map info) {
		sqlsession.insert("mapper.attend.insertAttendance", info);
	}
	// 결석 처리를 위한 모든 수강신청ID 가져오기
	@Override
	public List<Map<String, Object>> getEnrId(Map info) {
		return sqlsession.selectList("mapper.attend.getEnrId", info);
	}
	// 결석 insert 처리
	@Override
	public void insertAbsent(Map info) {
		sqlsession.insert("mapper.attend.insertAbsent", info);	
	}
	// 출석 데이터 가져오기
	@Override
	public Map<String, Object> getAttendData(Map info) {
		return sqlsession.selectOne("mapper.attend.getAttendData", info);
	}
	// 한 과목 출석 list 가져오기
	@Override
	public List<Map<String, Object>> getAttendList(Map info) {
		return sqlsession.selectList("mapper.attend.getAttendList", info);
	}
	
}
