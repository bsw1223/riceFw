package com.rice.A001.memservice;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemService {
	// TEST
	public List<A001MemVO> selectMem(String id);
	
	// ȸ������
	public void signup(A001MemVO vo) throws Exception;
	// memId �ߺ�üũ
	public int idCheck(String memId) throws Exception;
	// �α���
	public A001MemVO login(A001MemVO vo) throws Exception;
}
