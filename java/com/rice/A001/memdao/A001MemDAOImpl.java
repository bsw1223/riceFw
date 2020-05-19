package com.rice.A001.memdao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rice.A001.memvo.A001MemVO;

@Repository
public class A001MemDAOImpl implements A001MemDAO {
	private static final Logger logger = LoggerFactory.getLogger(A001MemDAOImpl.class);
	@Autowired
	private SqlSession sqlsession;

	@Override
	public void signup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.signup", vo);
	}	// 회원가입 MEMBER TABLE
	@Override
	public void signupauthmember(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.signupauthmember", vo);
	}	// 회원가입 AUTHMEMBER TABLE
	
	@Override
	public int idCheck(String memId) throws Exception {
		return sqlsession.selectOne("mapper.member.idCheck", memId);
	}	// 아이디 중복체크

	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.login", vo);
	}	// 로그인
	
	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return sqlsession.selectOne("mapper.member.snsIdCheck", snsId);
	}	// SNS ID 중복체크

	@Override
	public void snsSignup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.snsSignup", vo);
	}	// SNS NAVER 회원가입
	
	@Override
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.snsKakaoSignup", vo);
	}	// SNS KAKAO 회원가입
	
	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.snsLogin", vo);
	}	// SNS 로그인
	
	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return sqlsession.selectOne("mapper.member.memInfo", memNum);
	}	// 회원정보 가져오기

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updateInfo", vo);
	}	// 회원정보 수정하기

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updatePwd", vo);
	}	// 비밀번호 수정하기

	@Override
	public Integer updateMemAuth(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updateMemAuth", vo);
	}	// 강사로 권한 변경하기 MEMBER TABLE
	@Override
	public Integer updateMatchAuth(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updateMatchAuth", vo);
	}	// 강사로 권한 변경하기 AUTHMEMBER TABLE
	@Override
	public String findId(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.findId", vo);
	}	// 아이디 찾기
	@Override
	public String findNumforPwd(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.findNumforPwd", vo);
	}
	
}