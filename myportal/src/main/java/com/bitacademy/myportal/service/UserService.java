package com.bitacademy.myportal.service;

import com.bitacademy.myportal.repository.UserVo;


public interface UserService {
	public boolean join(UserVo vo);	//	회원 가입
	public UserVo getUser(String email, String password);	//	로그인 메서드
	public UserVo getUser(String email);	//	중복 로그인 체크용
	public boolean modify(UserVo vo);	//	정보 수정
//	public UserVo updateUser(String name);	//	세션 업데이트
}
