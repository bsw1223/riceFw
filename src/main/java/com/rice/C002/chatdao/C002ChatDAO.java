package com.rice.C002.chatdao;

import java.util.List;
import java.util.Map;

import com.rice.C002.chatvo.C002ChatroomVO;

public interface C002ChatDAO {
	// 채팅방 목록 가져오기
	public List<C002ChatroomVO> getChatroomList(Map info);
	// 학생일 경우
	// 내가 신청한 수업 ID 목록 가져오기 
	public List<String> getMyClassList(Map info);
	// 친구 목록 불러오기 // 같은 수업을 듣는 학생 
	public List<Map<String, Object>> getclassFriendList(Map info);
	// 내가 듣는 수업의 강사 목록 가져오기
	public List<Map<String, Object>> getTeaList(Map info);
	// 강사일 경우
	// 담당한 수업 목록 가져오기
	public List<String> getTeaClassList(Map info);
	// 본인 수업을 듣는 학생 리스트 가져오기
	public List<Map<String, Object>> getclassStuList(Map info);
	
	// 채팅방에 추가할 멤버 정보 가져오기 
	public List<Map<String, Object>> getmemInfo(Map info);
	// 생성할 채팅방 번호 만들어 가져오기 / 시퀀스 사용
	public String getchatroomId();
	// 채팅방 만들기
	public void insertChatroom(Map info);
	// 채팅방 멤버 등록하기
	public void insertMemberChat(Map info);
}
