package com.rice.D002.bookservice;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.D002.bookdao.D002BookDAO;
import com.rice.D002.bookvo.D002BookVO;

@Service
public class D002BookServiceImpl implements D002BookService{
	private static final Logger logger = LoggerFactory.getLogger(D002BookServiceImpl.class);
	
	@Autowired
	private D002BookDAO d002BookDAO;

	@Override
	public List<Map<String, Object>> getClassList() {
		return d002BookDAO.getClassList();
	}

	@Override
	public List<Map<String, Object>> getBookingList() {
		return d002BookDAO.getBookingList();
	}

	@Override
	public String getBookingMem(String bookNum) {
		return d002BookDAO.getBookingMem(bookNum);
	}

	@Override
	public Map<String, Object> getBookingInfo(String bookNum) {
		return d002BookDAO.getBookingInfo(bookNum);
	}

	@Override
	public Map<String, Object> getClassInfo(String classId) {
		return d002BookDAO.getClassInfo(classId);
	}

	@Override
	public void insertBooking(D002BookVO d002BookVO) {
		d002BookDAO.insertBooking(d002BookVO);
	}

	@Override
	public void deleteBooking(D002BookVO d002BookVO) {
		d002BookDAO.deleteBooking(d002BookVO);
	}

	@Override
	public void updateBooking(D002BookVO d002BookVO) {
		d002BookDAO.updateBooking(d002BookVO);
	}

	@Override
	public List<Map<String, Object>> getMybookList(Map info) {
		return d002BookDAO.getMybookList(info);
	}
}
