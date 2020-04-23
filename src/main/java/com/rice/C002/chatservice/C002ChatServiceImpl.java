package com.rice.C002.chatservice;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.C002.chatdao.C002ChatDAO;
import com.rice.C002.chatvo.C002ChatroomVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class C002ChatServiceImpl implements C002ChatService {
	private static final Logger logger = LoggerFactory.getLogger(C002ChatServiceImpl.class);
	
	@Autowired
	private C002ChatDAO c002ChatDAO;

	// 채팅방 목록 가져오기
	@Override
	public List<C002ChatroomVO> getChatroomList(Map info) {
		return c002ChatDAO.getChatroomList(info);
	}
	// 학생일 경우 
	// 내가 신청한 수업 ID 목록 가져오기 
	@Override
	public List<String> getMyClassList(Map info) {
		return c002ChatDAO.getMyClassList(info);
	}
	// 친구 목록 불러오기 // 같은 수업을 듣는 학생 
	@Override
	public List<Map<String, Object>> getclassFriendList(Map info) {
		return c002ChatDAO.getclassFriendList(info);
	}
	// 내가 듣는 수업의 강사 목록 가져오기
	@Override
	public List<Map<String, Object>> getTeaList(Map info) {
		return c002ChatDAO.getTeaList(info);
	}
	// 강사일 경우
	// 담당한 수업 목록 가져오기
	@Override
	public List<String> getTeaClassList(Map info) {
		return c002ChatDAO.getTeaClassList(info);
	}
	// 본인 수업을 듣는 학생 리스트 가져오기
	@Override
	public List<Map<String, Object>> getclassStuList(Map info) {
		return c002ChatDAO.getclassStuList(info);
	}
	// 채팅방에 추가할 멤버 정보 가져오기 
	@Override
	public List<Map<String, Object>> getmemInfo(Map info) {
		return c002ChatDAO.getmemInfo(info);
	}
	// 생성할 채팅방 번호 만들어 가져오기 / 시퀀스 사용
	@Override
	public String getchatroomId() {
		return c002ChatDAO.getchatroomId();
	}
	// 채팅방 만들기, 채팅방 만들고, MEMBERCHAT 에 멤버 등록까지 하기
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertChatroom(Map info) {
		c002ChatDAO.insertChatroom(info);
		c002ChatDAO.insertMemberChat(info);
	}
	
	
}
