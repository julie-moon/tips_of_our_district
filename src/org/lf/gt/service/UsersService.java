package org.lf.gt.service;

import java.util.Map;

import org.lf.gt.vo.User;

public interface UsersService {

	// 마이페이지 정보
	public Map<String, Object> myPageInfo(int no);
	
	// 로그인 검사
	public User login(User user);
	
	// 회원가입 유저 정보 입력
	public int register(User user);
	
	// id 중복체크 (ajax처리 하는 유효성 검사)
	public boolean checkId(String id);
	
	// nick 중복체크 (ajax처리 하는 유효성 검사)
	public boolean checkNick(String nickname);
	
	// email 중복체크 (ajax처리 하는 유효성 검사)
	public boolean checkEmail(String email);
	
}
