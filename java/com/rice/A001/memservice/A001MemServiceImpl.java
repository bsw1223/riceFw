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
	} // 회원가입

	@Override
	public int idCheck(String memId) throws Exception {
		return a001MemDAO.idCheck(memId);
	} // memId 중복체크

	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return a001MemDAO.login(vo);
	} // 로그인

	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return a001MemDAO.snsIdCheck(snsId);
	} // SNS memId 중복체크

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void snsSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsSignup(vo);
		a001MemDAO.signupauthmember(vo);
	} // SNS NAVER 회원가입

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsKakaoSignup(vo);
		a001MemDAO.signupauthmember(vo);
	} // SNS KAKAO 회원가입

	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return a001MemDAO.snsLogin(vo);
	} // SNS 로그인

	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return a001MemDAO.memInfo(memNum);
	} // 회원정보 가져오기

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return a001MemDAO.updateInfo(vo);
	} // 회원정보 수정

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return a001MemDAO.updatePwd(vo);
	} // 비밀번호 수정

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateAuth(A001MemVO vo) throws Exception {
		a001MemDAO.updateMemAuth(vo);
		a001MemDAO.updateMatchAuth(vo);
	} // 강사로 권한 변경

	@Override
	public String findId(A001MemVO vo) throws Exception {
		return a001MemDAO.findId(vo);
	} // 아이디 찾기

	@Override
	public String findPwd(A001MemVO vo) throws Exception {
		return a001MemDAO.findNumforPwd(vo);	// 회원번호 검색
	}
}