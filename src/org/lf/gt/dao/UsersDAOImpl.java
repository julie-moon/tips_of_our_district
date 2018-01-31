package org.lf.gt.dao;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.User;

public class UsersDAOImpl implements UsersDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// pDetail 꿀플 등록한 유저 정보
	@Override
	public User selectUserMJY(int userNo) {
		return session.selectOne("users.userWhoWrotePlaceMJY", userNo);
	}
	
	// 마이페이지 윗부분 유저 정보 
	@Override
	public User userInfoInMyPageMJY(int no) {
		return session.selectOne("users.userInfoInMyPageMJY", no);
	}
	
	// 로그인 검사
	@Override
	public User selectLogin(User user) {
		return session.selectOne("users.selectLogin",user);
	}
	
	// 회원가입 유저 정보 입력
	@Override
	public int insert(User user) {
		return session.insert("users.insert",user);
	}
	
	// id 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public int selectcheckId(String id) {
		int result = session.selectOne("users.selectCheckId",id);
		return result;
	}
	
	// nick 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public int selectCheckNick(String nickname) {
		int result = session.selectOne("users.selectCheckNick",nickname);
		return result;
	}
	
	// email 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public int selectCheckEmail(String email) {
		int result = session.selectOne("users.selectCheckEmail",email);
		return result;
	}

}
