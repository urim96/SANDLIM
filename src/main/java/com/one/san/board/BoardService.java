package com.one.san.board;

import java.util.List;

import com.one.san.moc.MdVO;
import com.one.san.util.Pagination;

public interface BoardService {

	// CRUD 기능의 메소드 구현
	// NOTICE 등록 (관리자)
	int insertBoard(BoardVO vo);

	// NOTICE 수정 (관리자)
	void updateBoard(BoardVO vo);

	// NOTICE 삭제 (관리자)
	void deleteBoard(BoardVO vo);

	// NOTICE 목록 (관리자)
	List<BoardVO> adminGetBoardList(BoardVO vo);

	// NOTICE 상세 (관리자)
	BoardVO adminGetBoard(BoardVO vo);
	
	// NOTICE 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (관리자)
	public int boardTotalCnt2(Pagination pg);
	
	// NOTICE 페이징 처리된 데이터를 가져오는 로직 (관리자)
	public List<BoardVO> selectList2(Pagination pg);

	// NOTICE 상세 (사용자)
	BoardVO getBoard(BoardVO vo);
	
	// NOTICE 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (사용자)
	public int boardTotalCnt3(Pagination pg);
	
	// NOTICE 페이징 처리된 데이터를 가져오는 로직 (사용자)
	public List<BoardVO> selectList3(Pagination pg);


	// REVIEW 목록 (관리자)
	List<BoardVO> adminGetReview(BoardVO vo);
	
	// REVIEW 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (관리자)
	public int boardTotalCnt4(Pagination pg);
	
	// REVIEW 페이징 처리된 데이터를 가져오는 로직 (관리자)
	public List<BoardVO> selectList4(Pagination pg);

	// REVIEW 상세 (관리자)
	BoardVO adminGetReviewDetail(BoardVO vo);

	// REVIEW 수정 (관리자)
	void adminUpdateReview(BoardVO vo);
	
	// REVIEW 목록 (사용자)
	List<BoardVO> getReview(BoardVO vo);
	
	// REVIEW 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (사용자)
	public int boardTotalCnt5(Pagination pg);
	
	// REVIEW 페이징 처리된 데이터를 가져오는 로직 (사용자)
	public List<BoardVO> selectList5(Pagination pg);
	
	// REVIEW 목록-마이페이지에서 리뷰 이동 (사용자)
	List<BoardVO> getMyReview(BoardVO vo);

	// REVIEW 상세 (사용자)
	BoardVO getReviewDetail(BoardVO vo);

	// REVIEW 등록 (사용자)
	int insertReview(BoardVO vo);

	// REVIEW 삭제 (사용자)
	void deleteReview(BoardVO vo);

	// NOTICE, REVIEW 조회수
	void getCount(BoardVO vo);
	


	// FAQ 등록 (관리자)
	int insertFaq(BoardVO vo);

	// FAQ 목록 (사용자)
	List<BoardVO> getFaqList(BoardVO vo);
	
	//키워드 별 메뉴 조회
	public List<BoardVO> selectkind(BoardVO vo);
	
	// FAQ 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (사용자)
	public int faqTotalCnt(Pagination pg);

	// FAQ 페이징 처리된 데이터를 가져오는 로직 (사용자)
	public List<BoardVO> selectFaqList(Pagination pg);

	// FAQ 목록 (관리자)
	List<BoardVO> adminFaqList(BoardVO vo);

	// FAQ 페이징을 위해 전체 데이터의 갯수를 가져오는 로직 (관리자)
	public int boardTotalCnt(Pagination pg);

	// FAQ 페이징 처리된 데이터를 가져오는 로직 (관리자)
	public List<BoardVO> selectList(Pagination pg);

	// FAQ 상세 (관리자)
	BoardVO adminFaqDetail(BoardVO vo);

	// FAQ 수정 (관리자)
	void updateFaq(BoardVO vo);

	// FAQ 삭제 (관리자)
	int deleteFaq(BoardVO vo);
}
