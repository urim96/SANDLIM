package com.one.san.user;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.one.san.util.Pagination;

public interface UserService {

	//md에서 사용
	public UserVO getUserPoint(UserVO vo) ;
	public int updatePoint(UserVO vo) ;

	public int insertUser(UserVO vo);
	public int updateUser(UserVO vo);
	public int updateUserData(UserVO vo);
	public int deleteUser(UserVO vo);
	
	public UserVO getLogin(UserVO vo);
	public UserVO getUser(UserVO vo);
	public UserVO selectOne(String selId);
	public List<UserVO> selectList(Pagination pg);
	public int userTotalCnt(Pagination pg);
	
	public String sendVerificationEmail(String email);
	public String sendVerificationEmailSign(String email);
	public boolean verifyEmailCode(String inputCode, String emailCode);
	public String findIdOutput(String name, String email);
	
	public UserVO selectPhno(String email);
	public UserVO selectPhno(String id, String email);
	
	public UserVO selectEmail(String phno);
	public UserVO selectEmail(String id, String phno);
	
	public String sendsms(String phno);
	
	public UserVO cartSelectUser(UserVO vo);
	
	public UserVO chkSocialLogin(UserVO vo);
	
	public boolean selectPw(String id, String pw);
	public Map<String, Long> selectSignUpStatistics();
	public void updateUserStatus();
	public Map<String, BigDecimal> selectAgeStatistics();
	
}
