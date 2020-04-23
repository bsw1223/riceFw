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

	
}
