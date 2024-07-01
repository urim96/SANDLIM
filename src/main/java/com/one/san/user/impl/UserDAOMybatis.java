package com.one.san.user.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.san.user.UserVO;
import com.one.san.util.Pagination;

@Repository
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public UserVO getUserPoint(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserPoint", vo);
	}

	public int updatePoint(UserVO vo) {
		return mybatis.update("UserDAO.updatePoint", vo);
	}

	public int insertUser(UserVO vo) {
		return mybatis.insert("UserDAO.insertUser", vo);
	}

	public int updateUser(UserVO vo) {
		return mybatis.update("UserDAO.updateUser", vo);
	}

	public int deleteUser(UserVO vo) {
		return mybatis.update("UserDAO.deleteUser", vo);
	}

	public UserVO cartSelectUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.cartSelectUser", vo);
	}

	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUser", vo);
	}

	public UserVO selectOne(String selId) {
		return mybatis.selectOne("UserDAO.selectOne", selId);
	}

	public List<UserVO> selectList(Pagination pg) {
		return mybatis.selectList("UserDAO.selectList", pg);
	}

	public String findUser(Map<String, Object> user) {
		return mybatis.selectOne("UserDAO.findUser", user);
	}

	public UserVO selectPhno(String phno) {
		return mybatis.selectOne("UserDAO.selectPhno", phno);

	}

	public UserVO selectEmail(String email) {
		return mybatis.selectOne("UserDAO.selectEmail", email);

	}

	public UserVO selectPhno2(Map<String, Object> user) {
		return mybatis.selectOne("UserDAO.selectPhno2", user);

	}

	public UserVO selectEmail2(Map<String, Object> user) {
		return mybatis.selectOne("UserDAO.selectEmail2", user);

	}

	public int userTotalCnt(Pagination pg) {
		return mybatis.selectOne("UserDAO.userTotalCnt", pg);
	}

	public String findUserPw(String id) {
		return mybatis.selectOne("UserDAO.findUserPw", id);
	}

	public UserVO selectPw(String user) {
		return mybatis.selectOne("UserDAO.selectPw", user);
	}
	
	public Map<String, Long> selectSignUpStatistics() {
        return mybatis.selectOne("UserDAO.selectSignUpStatistics");
    }
	
	public int updateUserStatus() {
		return mybatis.update("UserDAO.updateUserStatus");
	} 
	
	public Map<String, BigDecimal> selectAgeStatistics() {
        return mybatis.selectOne("UserDAO.selectAgeStatistics");
    }
}
