package com.rice.A001.memservice;

import com.rice.A001.memvo.A001MemVO;

public interface A001MemService {
	// 회원가입
	public void signup(A001MemVO vo) throws Exception;
	// memId 중복체크
	public int idCheck(String memId) throws Exception;
	// 로그인
	public A001MemVO login(A001MemVO vo) throws Exception;
	// SNS memId 중복체크
	public int snsIdCheck(String snsId) throws Exception;
	// SNS NAVER 회원가입
	public void snsSignup(A001MemVO vo) throws Exception;
	// SNS KAKAO 회원가입
	public void snsKakaoSignup(A001MemVO vo) throws Exception;
	// SNS 로그인
	public A001MemVO snsLogin(A001MemVO vo) throws Exception;
	// 회원정보 가져오기
	public A001MemVO memInfo(String memNum) throws Exception;
	// 회원정보 수정
	public Integer updateInfo(A001MemVO vo) throws Exception;
	// 비밀번호 수정
	public Integer updatePwd(A001MemVO vo) throws Exception;
	// 강사로 권한 변경
	public void updateAuth(A001MemVO vo) throws Exception;
	// 아이디 찾기
	public String findId(A001MemVO vo) throws Exception;
	// 비밀번호 재설정을 위한 회원번호 검색
	public String findPwd(A001MemVO vo) throws Exception;
}