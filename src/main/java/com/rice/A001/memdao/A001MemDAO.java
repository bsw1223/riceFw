package com.rice.A001.memdao;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemDAO {	
	// ȸ������
	public void signup(A001MemVO vo) throws Exception;
	// ȸ�����Ѻο�
	public void signupauthmember(A001MemVO vo) throws Exception;
	// ���̵� �ߺ�üũ
	public int idCheck(String memId) throws Exception;
	// �α���
	public A001MemVO login(A001MemVO vo) throws Exception;
	// SNS ID �ߺ�üũ
	public int snsIdCheck(String snsId) throws Exception;
	// SNS NAVER ȸ������
	public void snsSignup(A001MemVO vo) throws Exception;
	// SNS KAKAO ȸ������
	public void snsKakaoSignup(A001MemVO vo) throws Exception;
	// SNS �α���
	public A001MemVO snsLogin(A001MemVO vo) throws Exception;
	// ȸ������ ��������
	public A001MemVO memInfo(String memNum) throws Exception;
	// ȸ������ �����ϱ�
	public Integer updateInfo(A001MemVO vo) throws Exception;
	// ��й�ȣ �����ϱ�
	public Integer updatePwd(A001MemVO vo) throws Exception;
	// ȸ�� ���� �����ϱ�
	public Integer updateAuth(A001MemVO vo) throws Exception;
}
