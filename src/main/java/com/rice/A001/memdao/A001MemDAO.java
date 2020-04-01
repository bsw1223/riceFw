package com.rice.A001.memdao;

import java.util.List;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemDAO {
	// TEST
	public List<A001MemVO> getList(String id);
	
	// ȸ������
	public void signup(A001MemVO vo) throws Exception;
	
	// ���̵� �ߺ�üũ
	public int idCheck(String memId) throws Exception;
	
	// �α���
	public A001MemVO login(A001MemVO vo) throws Exception;
	
}
