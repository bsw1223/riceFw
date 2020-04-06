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
	}	// ȸ������ MEMBER TABLE
	@Override
	public void signupauthmember(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.signupauthmember", vo);
	}	// ȸ������ AUTHMEMBER TABLE
	
	@Override
	public int idCheck(String memId) throws Exception {
		return sqlsession.selectOne("mapper.member.idCheck", memId);
	}	// ���̵� �ߺ�üũ

	@Override
	public A001MemVO login(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.login", vo);
	}	// �α���
	
	@Override
	public int snsIdCheck(String snsId) throws Exception {
		return sqlsession.selectOne("mapper.member.snsIdCheck", snsId);
	}	// SNS ID �ߺ�üũ

	@Override
	public void snsSignup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.snsSignup", vo);
	}	// SNS NAVER ȸ������
	
	@Override
	public void snsKakaoSignup(A001MemVO vo) throws Exception {
		sqlsession.insert("mapper.member.snsKakaoSignup", vo);
	}	// SNS KAKAO ȸ������
	
	@Override
	public A001MemVO snsLogin(A001MemVO vo) throws Exception {
		return sqlsession.selectOne("mapper.member.snsLogin", vo);
	}	// SNS �α���
	
	@Override
	public A001MemVO memInfo(String memNum) throws Exception {
		return sqlsession.selectOne("mapper.member.memInfo", memNum);
	}	// ȸ������ ��������

	@Override
	public Integer updateInfo(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updateInfo", vo);
	}	// ȸ������ �����ϱ�

	@Override
	public Integer updatePwd(A001MemVO vo) throws Exception {
		return sqlsession.update("mapper.member.updatePwd", vo);
	}	// ��й�ȣ �����ϱ�

	@Override
	public Integer updateAuth(A001MemVO vo) throws Exception {
		if(sqlsession.insert("mapper.member.updateMemAuth", vo) != 0) {
			return sqlsession.insert("mapper.member.updateMatchAuth", vo);
		}
		return null;
	}	// ����� ���� �����ϱ� //////////////////////////// transaction ó�� �ʿ�
	
}
