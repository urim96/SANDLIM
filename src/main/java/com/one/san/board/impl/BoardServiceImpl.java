package com.one.san.board.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.san.board.BoardService;
import com.one.san.board.BoardVO;
import com.one.san.moc.MdVO;
import com.one.san.util.Pagination;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAOMybatis boardDAO;

	// NOTICE 등록 (관리자)
	@Override
	public int insertBoard(BoardVO vo) {
		return boardDAO.insertBoard(vo);
	}

	// NOTICE 수정 (관리자)
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	// NOTICE 삭제 (관리자)
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	// NOTICE 목록 (관리자)
	@Override
	public List<BoardVO> adminGetBoardList(BoardVO vo) {
		return boardDAO.adminGetBoardList(vo);
	}

	// NOTICE 상세 (관리자)
	@Override
	public BoardVO adminGetBoard(BoardVO vo) {
		return boardDAO.adminGetBoard(vo);
	}

	// NOTICE 목록 (사용자)
//	@Override
//	public List<BoardVO> getBoardList(BoardVO vo) {
//		return boardDAO.getBoardList(vo);
//	}	
	
	// NOTICE (사용자) 페이지네이션
	@Override
	public int boardTotalCnt3(Pagination pg) {
		return boardDAO.boardTotalCnt3(pg);
	}

	// NOTICE 상세 (사용자) 페이지네이션
	@Override
	public List<BoardVO> selectList3(Pagination pg) {
		return boardDAO.selectList3(pg);
	}


	// NOTICE 상세 (사용자)
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	// REVIEW 수정 (관리자) - 비공개 처리
	@Override
	public void adminUpdateReview(BoardVO vo) {
		boardDAO.adminUpdateReview(vo);

	}

	// REVIEW 목록 (관리자)
	@Override
	public List<BoardVO> adminGetReview(BoardVO vo) {
		return boardDAO.adminGetReview(vo);
	}

	// REVIEW 상세 (관리자)
	@Override
	public BoardVO adminGetReviewDetail(BoardVO vo) {
		return boardDAO.adminGetReviewDetail(vo);
	}
	
	//REVIEW 마이페이지에서 리뷰 이동(사용자-내가 쓴 리뷰)
   @Override
   public List<BoardVO> getMyReview(BoardVO vo) {
      return boardDAO.getMyReview(vo);
   }

   // REVIEW 삭제 (사용자)
   @Override
   public void deleteReview(BoardVO vo) {
      boardDAO.deleteReview(vo);

   }
	// REVIEW 목록 (사용자)
	@Override
	public List<BoardVO> getReview(BoardVO vo) {
		return boardDAO.getReview(vo);
	}
	
	// REVIEW 목록 전체개수 (사용자) 페이지네이션
	@Override
	public int boardTotalCnt5(Pagination pg) {
		return boardDAO.boardTotalCnt5(pg);
	}

	// REVIEW 목록 (사용자) 페이지네이션
	@Override
	public List<BoardVO> selectList5(Pagination pg) {
		return boardDAO.selectList5(pg);
	}

	// REVIEW 상세 (사용자)
	@Override
	public BoardVO getReviewDetail(BoardVO vo) {
		return boardDAO.getReviewDetail(vo);
	}

	// REVIEW 등록 (사용자)
	@Override
	public int insertReview(BoardVO vo) {
		return boardDAO.insertReview(vo);
	}
	
	// REVIEW (관리자) 페이지네이션
	@Override
	public int boardTotalCnt4(Pagination pg) {
		return boardDAO.boardTotalCnt4(pg);
	}

	// REVIEW 상세 (관리자) 페이지네이션
	@Override
	public List<BoardVO> selectList4(Pagination pg) {
		return boardDAO.selectList4(pg);
	}

	// NOTICE, REVIEW 조회수
	@Override
	public void getCount(BoardVO vo) {
		boardDAO.getCount(vo);

	}

	// NOTICE (관리자) 페이지네이션
	@Override
	public int boardTotalCnt2(Pagination pg) {
		return boardDAO.boardTotalCnt2(pg);
	}

	// NOTICE 상세 (관리자) 페이지네이션
	@Override
	public List<BoardVO> selectList2(Pagination pg) {
		return boardDAO.selectList2(pg);
	}


	// FAQ 목록 (사용자)
	@Override
	public List<BoardVO> getFaqList(BoardVO vo) {
		return boardDAO.getFaqList(vo);
	}
	// 키워드 메뉴
	@Override
	public List<BoardVO> selectkind(BoardVO vo) {
		return boardDAO.selectkind(vo);
	}
	
	// FAQ (관리자) 페이지네이션
	@Override
	public int faqTotalCnt(Pagination pg) {
		return boardDAO.faqTotalCnt(pg);
	}

	// FAQ 상세 (관리자) 페이지네이션
	@Override
	public List<BoardVO> selectFaqList(Pagination pg) {
		return boardDAO.selectFaqList(pg);
	}

	// FAQ 목록 (관리자)
	@Override
	public List<BoardVO> adminFaqList(BoardVO vo) {
		return boardDAO.adminFaqList(vo);
	}

	// FAQ (관리자) 페이지네이션
	@Override
	public int boardTotalCnt(Pagination pg) {
		return boardDAO.boardTotalCnt(pg);
	}

	// FAQ 상세 (관리자) 페이지네이션
	@Override
	public List<BoardVO> selectList(Pagination pg) {
		return boardDAO.selectList(pg);
	}

	// faq리스트 상세글 가져오기(어드민)
	@Override
	public BoardVO adminFaqDetail(BoardVO vo) {
		return boardDAO.adminFaqDetail(vo);
	}

	// faq리스트 글 삭제하기(어드민)
	@Override
	public int deleteFaq(BoardVO vo) {
		return boardDAO.deleteFaq(vo);
	}

	// faq리스트 글 업데이트하기(어드민)
	@Override
	public void updateFaq(BoardVO vo) {
		boardDAO.updateFaq(vo);
	}

	// FAQ 등록 (관리자)
	@Override
	public int insertFaq(BoardVO vo) {
		return boardDAO.insertFaq(vo);
	}

}