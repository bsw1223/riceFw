package com.rice.C002.chatdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.C002.chatvo.C002ChatroomVO;

@Repository
public class C002ChatDAOImpl implements C002ChatDAO {
	private static final Logger logger = LoggerFactory.getLogger(C002ChatDAOImpl.class);
	
	@Autowired
	private SqlSession sqlsession;

	// 채팅방 목록 가져오기
	@Override
	public List<C002ChatroomVO> getChatroomList(Map info) {
		return sqlsession.selectList("mapper.chat.getChatroomList", info);
	}	
	// 학생일 경우
	// 내가 신청한 수업 ID 목록 가져오기 
	@Override
	public List<String> getMyClassList(Map info) {
		return sqlsession.selectList("mapper.chat.getMyClassList", info);
	}
	// 친구 목록 불러오기 // 같은 수업을 듣는 학생 
	@Override
	public List<Map<String, Object>> getclassFriendList(Map info) {
		return sqlsession.selectList("mapper.chat.getclassFriendList", info);
	}
	// 내가 듣는 수업의 강사 목록 가져오기
	@Override
	public List<Map<String, Object>> getTeaList(Map info) {
		return sqlsession.selectList("mapper.chat.getTeaList", info);
	}	
	// 강사일 경우
	// 담당한 수업 목록 가져오기
	@Override
	public List<String> getTeaClassList(Map info) {
		return sqlsession.selectList("mapper.chat.getTeaClassList", info);
	}
	// 본인 수업을 듣는 학생 리스트 가져오기
	@Override
	public List<Map<String, Object>> getclassStuList(Map info) {
		return sqlsession.selectList("mapper.chat.getclassStuList", info);
	}
	// 채팅방에 추가할 멤버 정보 가져오기 
	@Override
	public List<Map<String, Object>> getmemInfo(Map info) {
		return sqlsession.selectList("mapper.chat.getmemInfo", info);
	}
	// 생성할 채팅방 번호 만들어 가져오기 / 시퀀스 사용
	@Override
	public String getchatroomId() {
		return sqlsession.selectOne("mapper.chat.getchatroomId");
	}
	// 채팅방 만들기
	@Override
	public void insertChatroom(Map info) {
		sqlsession.insert("mapper.chat.insertChatroom", info);		
	}
	// 채팅방 멤버 등록하기
	@Override
	public void insertMemberChat(Map info) {
		sqlsession.insert("mapper.chat.insertMemberChat", info);		
	}
	// 방장 번호 알아오기
	@Override
	public String getmakeMember(Map info) {
		return sqlsession.selectOne("mapper.chat.getmakeMember", info);
	}
	// 방이름, 방번호, 참여멤버 이름 가져오기
	@Override
	public List<Map<String, Object>> getChatroomInfo(Map info) {
		return sqlsession.selectList("mapper.chat.getChatroomInfo", info);
	}
	
	// 접속 할 나의 모든 채팅방 리스트 가져오기
	@Override
	public List<String> getmychatIdList(String info) {
		return sqlsession.selectList("mapper.chat.getmychatIdList", info);
	}
	// 채팅메시지 저장하기
	@Override
	public void insertMsg(Map info) {
		sqlsession.insert("mapper.chat.insertMsg", info);
	}
	// 접속 채팅방 이전 메시지 get
	@Override
	public List<Map<String, Object>> getpastMsg(Map info) {
		return sqlsession.selectList("mapper.chat.getpastMsg", info);
	}
	// 채팅방 이름 수정
	@Override
	public void updateChatroomName(Map info) {
		sqlsession.update("mapper.chat.updateChatroomName", info);
	}
	// 채팅방 나가기
	@Override
	public void deleteMemberChat(Map info) {
		sqlsession.delete("mapper.chat.deleteMemberChat", info);
	}
	
	
}
