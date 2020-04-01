package com.rice.A001.memdao;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemDAO {
	// TEST
	public List<A001MemVO> getList(String id);
	
	// 회원가입
	public void signup(A001MemVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(String memId) throws Exception;
	
	// 로그인
	public A001MemVO login(A001MemVO vo) throws Exception;
	
}
