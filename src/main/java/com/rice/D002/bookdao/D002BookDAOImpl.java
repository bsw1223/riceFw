package com.rice.D002.bookdao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.D002.bookvo.D002BookVO;

@Repository
public class D002BookDAOImpl implements D002BookDAO {
	private static final Logger logger = LoggerFactory.getLogger(D002BookDAOImpl.class);
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<Map<String, Object>> getClassList() {
		return sqlsession.selectList("mapper.book.getClassList");
	}

	@Override
	public List<Map<String, Object>> getBookingList() {
		return sqlsession.selectList("mapper.book.getBookingList");
	}

	@Override
	public String getBookingMem(String bookNum) {
		return sqlsession.selectOne("mapper.book.getBookingMem", bookNum);
	}

	@Override
	public Map<String, Object> getBookingInfo(String bookNum) {
		return sqlsession.selectOne("mapper.book.getBookingInfo", bookNum);
	}

	@Override
	public Map<String, Object> getClassInfo(String classId) {
		return sqlsession.selectOne("mapper.book.getClassInfo", classId);
	}

	@Override
	public void insertBooking(D002BookVO d002BookVO) {
		sqlsession.insert("mapper.book.insertBooking", d002BookVO);
	}

	@Override
	public void deleteBooking(D002BookVO d002BookVO) {
		sqlsession.update("mapper.book.deleteBooking", d002BookVO);
	}

	@Override
	public void updateBooking(D002BookVO d002BookVO) {
		sqlsession.update("mapper.book.updateBooking", d002BookVO);
	}

	@Override
	public List<Map<String, Object>> getMybookList(Map info) {
		return sqlsession.selectList("mapper.book.getMybookList", info);
	}
}
