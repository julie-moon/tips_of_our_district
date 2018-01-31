package org.lf.gt.service;

import java.util.HashMap;
import java.util.Map;

import org.lf.gt.dao.UsersDAO;
import org.lf.gt.vo.User;

public class UsersServiceImpl implements UsersService{
	
	private UsersDAO usersDAO;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	// 마이페이지 정보
	@Override
	public Map<String, Object> myPageInfo(int no) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 마이페이지 윗부분 유저 정보
		map.put("userInfo", usersDAO.userInfoInMyPageMJY(no));
		
		return map;
		
	}
	
	// 로그인 검사
	@Override
	public User login(User user) {
		return usersDAO.selectLogin(user);
	}
	
	// 회원가입 유저 정보 입력
	@Override
	public int register(User user) {
		return usersDAO.insert(user);
	}
	
	// id 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public boolean checkId(String id) {
		boolean result = false;
		int count = usersDAO.selectcheckId(id);
		
		if(count==0) {
			return true;
		} 
		return result;
	}
	
	// nick 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public boolean checkNick(String nickname) {
		boolean result = false;
		int count = usersDAO.selectCheckNick(nickname);
		
		if(count==0) {
			return true;
		} 
		return result;
	}
	
	// email 중복체크 (ajax처리 하는 유효성 검사)
	@Override
	public boolean checkEmail(String email) {
		boolean result = false;
		int count = usersDAO.selectCheckEmail(email);
		
		if(count==0) {
			return true;
		} 
		return result;
	}

}
