package com.rice.A001.memservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.A001.memdao.A001MemDAO;
import com.rice.A001.memvo.A001MemVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class A001MemServiceImpl implements A001MemService {
	@Autowired
	private A001MemDAO a001MemDAO;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void signup(A001MemVO vo) throws Exception {
		a001MemDAO.signup(vo);
		a001MemDAO.signupauthmember(vo);
	}	// ȸ������
	
	@Override
	public int idCheck(String memId) throws Exception {
		return a001MemDAO.idCheck(memId);
	}	// memId �ߺ�üũ
	
	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return a001MemDAO.login(vo);
	} 	// �α���

	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return a001MemDAO.snsIdCheck(snsId);
	}	// SNS memId �ߺ�üũ

	@Override
	public void snsSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsSignup(vo);		
	}	// SNS NAVER ȸ������
	
	@Override
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsKakaoSignup(vo);
	}	// SNS KAKAO ȸ������
	
	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return a001MemDAO.snsLogin(vo);
	}	// SNS �α���

	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return a001MemDAO.memInfo(memNum);
	}	// ȸ������ ��������

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return a001MemDAO.updateInfo(vo);
	}	// ȸ������ ����

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return a001MemDAO.updatePwd(vo);
	}	// ��й�ȣ ����

	@Override
	public Integer updateAuth(A001MemVO vo) throws Exception {
		return a001MemDAO.updateAuth(vo);
	}	// ����� ���� ����

}
