package com.rice.F004.F004service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.F004.F004dao.F004StatisDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class F004StatisServiceImpl implements F004StatisService {
	private static final Logger logger = LoggerFactory.getLogger(F004StatisServiceImpl.class);
	
	@Autowired
	private F004StatisDAO f004StatisDAO;

	@Override
	public List<Map<String, Object>> getTchSalesList(Map info) {
		return f004StatisDAO.getTchSalesList(info);
	}

	@Override
	public List<Map<String, Object>> getmonthSales(Map info) {
		return f004StatisDAO.getmonthSales(info);
	}
}
