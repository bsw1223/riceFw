package com.rice.A001.memdao;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemDAO {	
	// 회원가입
	public void signup(A001MemVO vo) throws Exception;
	// 회원권한부여
	public void signupauthmember(A001MemVO vo) throws Exception;
	// 아이디 중복체크
	public int idCheck(String memId) throws Exception;
	// 로그인
	public A001MemVO login(A001MemVO vo) throws Exception;
	// SNS ID 중복체크
	public int snsIdCheck(String snsId) throws Exception;
	// SNS NAVER 회원가입
	public void snsSignup(A001MemVO vo) throws Exception;
	// SNS KAKAO 회원가입
	public void snsKakaoSignup(A001MemVO vo) throws Exception;
	// SNS 로그인
	public A001MemVO snsLogin(A001MemVO vo) throws Exception;
	// 회원정보 가져오기
	public A001MemVO memInfo(String memNum) throws Exception;
	// 회원정보 수정하기
	public Integer updateInfo(A001MemVO vo) throws Exception;
	// 비밀번호 수정하기
	public Integer updatePwd(A001MemVO vo) throws Exception;
	// 회원 권한 변경하기 member table
	public Integer updateMemAuth(A001MemVO vo) throws Exception;
	// 회원 권한 변경하기 Auth member table
	public Integer updateMatchAuth(A001MemVO vo) throws Exception;
	// 아이디 찾기
	public String findId(A001MemVO vo) throws Exception;
	// 비밀번호 재설정을 위한 회원 검색
	public String findNumforPwd(A001MemVO vo) throws Exception;
}