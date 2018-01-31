package org.lf.gt.dao;

import org.lf.gt.vo.User;

public interface UsersDAO {

	// pDetail 꿀플 등록한 유저 정보
	public User selectUserMJY(int userNo);
	
	// 마이페이지 윗부분 유저 정보 
	public User userInfoInMyPageMJY(int no);
	
	// 로그인 검사
	public User selectLogin(User user);
	
	// 회원가입 유저 정보 입력
	public int insert(User user);
	
	// id 중복체크 (ajax처리 하는 유효성 검사)
	public int selectcheckId(String id);
	
	// nick 중복체크 (ajax처리 하는 유효성 검사)
	public int selectCheckNick(String nickname);
	
	// email 중복체크 (ajax처리 하는 유효성 검사)
	public int selectCheckEmail(String email);
	
}
