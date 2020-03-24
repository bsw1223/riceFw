package com.rice.A001.memservice;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemService {

	public List<A001MemVO> selectMem(String id);
}
