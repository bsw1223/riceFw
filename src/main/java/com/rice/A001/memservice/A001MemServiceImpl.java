package com.rice.A001.memservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rice.A001.memdao.A001MemDAO;
import com.rice.A001.memvo.A001MemVO;

@Service
public class A001MemServiceImpl implements A001MemService {

	@Autowired
	private A001MemDAO a001MemDAO;
	
	@Override
	public List<A001MemVO> selectMem(String id) {
		List memlist=null;
		memlist = a001MemDAO.getList(id);
		
		return memlist;
	}

}
