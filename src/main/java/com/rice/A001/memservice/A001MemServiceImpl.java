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
	}	// 회원가입
	
	@Override
	public int idCheck(String memId) throws Exception {
		return a001MemDAO.idCheck(memId);
	}	// memId 중복체크
	
	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return a001MemDAO.login(vo);
	} 	// 로그인

	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return a001MemDAO.snsIdCheck(snsId);
	}	// SNS memId 중복체크

	@Override
	public void snsSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsSignup(vo);		
	}	// SNS NAVER 회원가입
	
	@Override
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		a001MemDAO.snsKakaoSignup(vo);
	}	// SNS KAKAO 회원가입
	
	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return a001MemDAO.snsLogin(vo);
	}	// SNS 로그인

	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return a001MemDAO.memInfo(memNum);
	}	// 회원정보 가져오기

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return a001MemDAO.updateInfo(vo);
	}	// 회원정보 수정

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return a001MemDAO.updatePwd(vo);
	}	// 비밀번호 수정

	@Override
	public Integer updateAuth(A001MemVO vo) throws Exception {
		return a001MemDAO.updateAuth(vo);
	}	// 강사로 권한 변경

}
