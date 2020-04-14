package com.rice.D002.bookservice;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.D002.bookdao.D002BookDAO;

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
}
