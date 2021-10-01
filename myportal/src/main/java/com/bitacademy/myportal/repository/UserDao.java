package com.bitacademy.myportal.repository;

public interface UserDao {
	public int insert(UserVo vo);	//	가입 insert
	public UserVo selectUser(String email);	//	중복 이메일 체크 SELECT
	public UserVo selectUser(String email, String password);
		// Login용 SELECT
	public int update(UserVo vo);	//	정보 수정 update
//	public UserVo updateUser(String name);	//	세션 업데이트
}
