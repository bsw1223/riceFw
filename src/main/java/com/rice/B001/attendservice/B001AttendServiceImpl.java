package com.rice.B001.attendservice;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.B001.attenddao.B001AttendDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class B001AttendServiceImpl implements B001AttendService {
	private static final Logger logger = LoggerFactory.getLogger(B001AttendServiceImpl.class);
	
	@Autowired
	private B001AttendDAO b001AttendDAO;
	
	// 접근 가능한 IP 대역 가져오기
	@Override
	public Map<String, String> getIpAddress() {
		return b001AttendDAO.getIpAddress();
	}
	// 수업 목록 가져오기
	@Override
	public List<Map<String, Object>> getClassList(Map info) {
		return b001AttendDAO.getClassList(info);
	}
	// 입력한 수업번호/이메일/비밀번호가 맞는지 check //// 맞으면 1, 아니면 0
	@Override
	public int checkEmailPwd(Map info) {
		return b001AttendDAO.checkEmailPwd(info);
	}
	// 입력한 시간이 수업 시간이 맞는지 check
	@Override
	public int checkClassTime(Map info) {
		return b001AttendDAO.checkClassTime(info);
	}
	// insert 하기 위한 value 가져오기
	@Override
	public Map<String, Object> getinsertVal(Map info) {
		return b001AttendDAO.getinsertVal(info);
	}
	// insert 출석
	@Override
	public void insertAttendance(Map info) {
		b001AttendDAO.insertAttendance(info);		
	}
	// 결석 처리를 위한 모든 수강신청ID 가져오기
	@Override
	public List<Map<String, Object>> getEnrId(Map info) {
		return b001AttendDAO.getEnrId(info);
	}
	// 결석 insert 처리
	@Override
	public void insertAbsent(Map info) {
		b001AttendDAO.insertAbsent(info);		
	}
	
}
