package com.rice.D002.bookservice;

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
	
}
