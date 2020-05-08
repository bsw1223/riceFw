package com.rice.B001.attendservice;

import java.util.List;
import java.util.Map;

public interface B001AttendService {
	// 접근 가능한 IP 대역 가져오기
	public Map<String, String> getIpAddress();
	// 수업 목록 가져오기
	public List<Map<String, Object>> getClassList(Map info);
	// 입력한 수업번호/이메일/비밀번호가 맞는지 check //// 맞으면 1, 아니면 0
	public int checkEmailPwd(Map info);
	// 입력한 시간이 수업 시간이 맞는지 check
	public int checkClassTime(Map info);
	// insert 하기 위한 value 가져오기
	public Map<String, Object> getinsertVal(Map info);
	// insert 출석
	public void insertAttendance(Map info);
	
	// 결석 처리를 위한 모든 수강신청ID 가져오기
	public List<Map<String, Object>> getEnrId(Map info);
	// 결석 insert 처리
	public void insertAbsent(Map info);
		
	// 출석 데이터 가져오기
	public Map<String, Object> getAttendData(Map info);
	// 한 과목 출석 list 가져오기
	public List<Map<String, Object>> getAttendList(Map info);
}
