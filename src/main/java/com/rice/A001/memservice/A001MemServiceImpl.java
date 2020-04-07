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
		String memNum = a001MemDAO.findNumforPwd(vo);	// 회원번호 검색
		if(memNum != null) {
			vo.setMemNum(memNum);							// 비밀번호 update를 위한 회원번호
			vo.setMemPwd(getRamdomPassword(10));			// random하게 만든 새 비밀번호
			a001MemDAO.updatePwd(vo);
		}
		return vo.getMemPwd();	// 업데이트한 pwd return 
	}

	public static String getRamdomPassword(int len) { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' 
				}; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer();  
		for (int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); 
		} 
		logger.info(sb.toString());
		return sb.toString(); 
	}

}
