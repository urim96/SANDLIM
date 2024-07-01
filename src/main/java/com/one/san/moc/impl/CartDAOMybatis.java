package com.one.san.moc.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.san.moc.CartVO;

@Repository
public class CartDAOMybatis {

	@Autowired
	private SqlSessionTemplate c_mybatis;

	public int insertCart(CartVO vo) {
		return c_mybatis.insert("CartDAO.insertCart", vo);
	}

	public List<CartVO> getCartList(CartVO vo) {
		return c_mybatis.selectList("CartDAO.getCartList", vo);
	}

	// 장바구니 중복 데이터 있는지 확인
	public CartVO CartListCheck(CartVO vo) {
		return c_mybatis.selectOne("CartDAO.CartListCheck", vo);
	}

	// 중복 메뉴 있을 시 업데이트
	public int UpdateCart(CartVO vo) {
		return c_mybatis.update("CartDAO.UpdateCart", vo);
	}

	// 장바구니 메뉴삭제
	public int deleteCart(CartVO vo) {
		return c_mybatis.delete("CartDAO.deleteCart", vo);
	}

	// 결제시 장바구니 삭제
	public int payDelete(CartVO vo) {
		return c_mybatis.delete("CartDAO.payDelete", vo);
	}
	  // 장바구니 메뉴 전체삭제
	   public int cartAllDelete(CartVO vo) {
	      return c_mybatis.delete("CartDAO.cartAllDelete", vo);
	   }
}
