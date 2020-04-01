package com.rice.A001.memservice;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemService {
	// TEST
	public List<A001MemVO> selectMem(String id);
	
	// 회원가입
	public void signup(A001MemVO vo) throws Exception;
	// memId 중복체크
	public int idCheck(String memId) throws Exception;
	// 로그인
	public A001MemVO login(A001MemVO vo) throws Exception;
}
