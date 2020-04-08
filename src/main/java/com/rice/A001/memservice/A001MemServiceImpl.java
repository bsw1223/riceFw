package com.rice.A001.memservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rice.A001.memdao.A001MemDAO;
import com.rice.A001.memvo.A001MemVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class A001MemServiceImpl implements A001MemService {
	private static final Logger logger = LoggerFactory.getLogger(A001MemServiceImpl.class);
	@Autowired
	private A001MemDAO a001MemDAO;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void signup(A001MemVO vo) throws Exception {
		a001MemDAO.signup(vo);
		a001MemDAO.signupauthmember(vo);
	} // ȸ������

	@Override
	public int idCheck(String memId) throws Exception {
		return a001MemDAO.idCheck(memId);
	} // memId �ߺ�üũ

	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return a001MemDAO.login(vo);
	} // �α���

	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return a001MemDAO.snsIdCheck(snsId);
	} // SNS memId �ߺ�üũ

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void snsSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsSignup(vo);
		a001MemDAO.signupauthmember(vo);
	} // SNS NAVER ȸ������

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsKakaoSignup(vo);
		a001MemDAO.signupauthmember(vo);
	} // SNS KAKAO ȸ������

	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return a001MemDAO.snsLogin(vo);
	} // SNS �α���

	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return a001MemDAO.memInfo(memNum);
	} // ȸ������ ��������

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return a001MemDAO.updateInfo(vo);
	} // ȸ������ ����

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return a001MemDAO.updatePwd(vo);
	} // ��й�ȣ ����

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateAuth(A001MemVO vo) throws Exception {
		a001MemDAO.updateMemAuth(vo);
		a001MemDAO.updateMatchAuth(vo);
	} // ����� ���� ����

	@Override
	public String findId(A001MemVO vo) throws Exception {
		return a001MemDAO.findId(vo);
	} // ���̵� ã��

	@Override
	public String findPwd(A001MemVO vo) throws Exception {
		return a001MemDAO.findNumforPwd(vo);	// ȸ����ȣ �˻�
	}

	

}
