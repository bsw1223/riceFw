package com.rice.H001.homedao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.H001.homevo.H001SchVO;


@Repository
public class H001SchDAOImpl implements H001SchDAO {

	@Autowired
	private SqlSession sqlsession;
	
	
	@Override
	public List<Map<String, Object>> selectSchList(String memNum) {
		
		 List<Map<String, Object>> menuList= sqlsession.selectList("mapper.Sch.selectSchList",memNum);
		 
		 return menuList;
	}

	
	//스케쥴 수정
	@Override
	public void ModifySchInfo(H001SchVO h001SchVO) {

		sqlsession.update("mapper.Sch.modifySchInfo",h001SchVO);
		
	}

	//기존 스케쥴 클릭 시 desc불러오기
	@Override
	public Map<String, Object> selectDesc(H001SchVO h001SchVO) {
		Map<String, Object> map = sqlsession.selectOne("mapper.Sch.selectDesc",h001SchVO);
		return map;
	}

	//새 달력 클릭 시 시퀀스 넘버 가져오기
	@Override
	public Map<String, Object> selectSchSeqNo() {
		Map<String, Object> map = sqlsession.selectOne("mapper.Sch.schSeq");
		return map;
	}

	//날짜 클릭 후 내용 저장
	@Override
	public void insertSchInfo(H001SchVO h001SchVO) {
		sqlsession.insert("mapper.Sch.insertSchInfo",h001SchVO);
		
	}

	//delete SchInfo
	@Override
	public void deleteSchInfo(H001SchVO h001SchVO) {
		sqlsession.delete("mapper.Sch.deleteSchInfo",h001SchVO);		
	}

}
