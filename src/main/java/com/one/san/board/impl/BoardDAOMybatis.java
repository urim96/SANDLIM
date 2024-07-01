package com.one.san.board.impl;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.san.board.BoardVO;
import com.one.san.moc.MdVO;
import com.one.san.util.Pagination;

// DAO클래스를 만들고 객체화를 시키려면 Repository
@Repository
public class BoardDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// NOTICE 등록 (관리자)
	public int insertBoard(BoardVO vo) {
		return mybatis.insert("boardDAO.insertBoard", vo);
	}

	// NOTICE 수정 (관리자)
	public void updateBoard(BoardVO vo) {
		mybatis.update("boardDAO.updateBoard", vo);
	}

	// NOTICE 삭제 (관리자)
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("boardDAO.deleteBoard", vo);
	}

	// NOTICE 목록 (관리자)
	public List<BoardVO> adminGetBoardList(BoardVO vo) {
		return mybatis.selectList("boardDAO.adminGetBoardList", vo);
	}

	// NOTICE 상세 (관리자)
	public BoardVO adminGetBoard(BoardVO vo) {
		return mybatis.selectOne("boardDAO.adminGetBoard", vo);
	}

	// NOTICE 목록 (사용자)
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		return mybatis.selectList("boardDAO.getBoardList", vo);
//	}
	
	// NOTICE 페이지네이션 (사용자)
	public int boardTotalCnt3(Pagination pg) {
		return mybatis.selectOne("boardDAO.boardTotalCnt3", pg);
	}
	
	// NOTICE 페이지네이션 (사용자)
	public List<BoardVO> selectList3(Pagination pg) {
		return mybatis.selectList("boardDAO.selectList3", pg);
	}
	
	// NOTICE 상세 (사용자)
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	// REVIEW 수정 (관리자) - 비공개 처리
	public void adminUpdateReview(BoardVO vo) {
		mybatis.update("boardDAO.adminUpdateReview", vo);
	}

	// REVIEW 목록 (관리자)
	public List<BoardVO> adminGetReview(BoardVO vo) {
		return mybatis.selectList("boardDAO.adminGetReview", vo);
	}

	// REVIEW 상세 (관리자)
	public BoardVO adminGetReviewDetail(BoardVO vo) {
		return mybatis.selectOne("boardDAO.adminGetReviewDetail", vo);
	}

	// REVIEW 목록 (사용자)
//	public List<BoardVO> getReview(BoardVO vo) {
//		return mybatis.selectList("boardDAO.getReview", vo);
//	}
	// REVIEW 페이지네이션 (관리자)
	public int boardTotalCnt4(Pagination pg) {
		return mybatis.selectOne("boardDAO.boardTotalCnt4", pg);
	}
	// REVIEW 페이지네이션 (관리자)
	public List<BoardVO> selectList4(Pagination pg) {
		return mybatis.selectList("boardDAO.selectList4", pg);
	}
	
	// REVIEW 목록 (사용자)
	public List<BoardVO> getReview(BoardVO vo) {
		return mybatis.selectList("boardDAO.getReview", vo);
	}
	
	// REVIEW 페이지네이션 (관리자)
	public int boardTotalCnt5(Pagination pg) {
		return mybatis.selectOne("boardDAO.boardTotalCnt5", pg);
	}
	// REVIEW 페이지네이션 (관리자)
	public List<BoardVO> selectList5(Pagination pg) {
		return mybatis.selectList("boardDAO.selectList5", pg);
	}

	// REVIEW 상세 (사용자)
	public BoardVO getReviewDetail(BoardVO vo) {
		return mybatis.selectOne("boardDAO.getReviewDetail", vo);
	}

	// REVIEW 등록 (사용자)
	public int insertReview(BoardVO vo) {
		return mybatis.insert("boardDAO.insertReview", vo);
	}
	
   // REVIEW 마이페이지-내가 쓴 리뷰 목록 (사용자)	
   public List<BoardVO> getMyReview(BoardVO vo) {
      return mybatis.selectList("boardDAO.getMyReview", vo);
   }

   // REVIEW 삭제 (사용자)
   public void deleteReview(BoardVO vo) {
      mybatis.update("boardDAO.deleteReview", vo);
   }

	// NOTICE, REVIEW 조회수
	public void getCount(BoardVO vo) {
		mybatis.update("boardDAO.getCount", vo);
	}

	// NOTICE 페이지네이션 (관리자)
	public int boardTotalCnt2(Pagination pg) {
		return mybatis.selectOne("boardDAO.boardTotalCnt2", pg);
	}
	// NOTICE 페이지네이션 (관리자)
	public List<BoardVO> selectList2(Pagination pg) {
		return mybatis.selectList("boardDAO.selectList2", pg);
	}

	// faq글 목록 조회 (사용자)
	public List<BoardVO> getFaqList(BoardVO vo) {
		return mybatis.selectList("boardDAO.getFaqList", vo);
	}
	// faq글 목록 선별 조회 (사용자)
	public List<BoardVO> selectkind(BoardVO vo) {
		return mybatis.selectList("boardDAO.selectkind", vo);
	}
	
	// Faq 페이지네이션 (사용자)
	public int faqTotalCnt(Pagination pg) {
		return mybatis.selectOne("boardDAO.faqTotalCnt", pg);
	}
	// Faq 페이지네이션 (사용자)
	public List<BoardVO> selectFaqList(Pagination pg) {
		return mybatis.selectList("boardDAO.selectFaqList", pg);
	}

	// faq글 목록 조회 (어드민)
	public List<BoardVO> adminFaqList(BoardVO vo) {
		return mybatis.selectList("boardDAO.adminFaqList", vo);
	}

	// faq 상세 조회(어드민)
	public BoardVO adminFaqDetail(BoardVO vo) {
		return mybatis.selectOne("boardDAO.adminFaqDetail", vo);
	}

	// Faq 등록
	public int insertFaq(BoardVO vo) {
		return mybatis.insert("boardDAO.insertFaq", vo);
	}

	// Faq 수정
	public void updateFaq(BoardVO vo) {
		mybatis.update("boardDAO.updateFaq", vo);
	}

	// Faq 삭제
//	public void deleteFaq(BoardVO vo) {
//		mybatis.delete("boardDAO.deleteFaq", vo);
//	}
	public int deleteFaq(BoardVO vo) {
		return mybatis.delete("boardDAO.deleteFaq", vo);
	}

	// Faq 페이지네이션 (관리자)
	public int boardTotalCnt(Pagination pg) {
		return mybatis.selectOne("boardDAO.boardTotalCnt", pg);
	}
	// Faq 페이지네이션 (관리자)
	public List<BoardVO> selectList(Pagination pg) {
		return mybatis.selectList("boardDAO.selectList", pg);
	}
}
