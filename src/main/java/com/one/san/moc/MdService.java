package com.one.san.moc;

import java.util.List;
import java.util.Map;

import com.one.san.util.Pagination;

public interface MdService {

	//메뉴등록
	public int insertMd(MdVO md);
		
	//메뉴수정
	public void updateMd(MdVO vo);
	
	//메뉴삭제
	public void deleteMd(MdVO vo);
	
	//메뉴상세조회
	public MdVO getMd(MdVO vo);
	
	//메뉴수정데이터 받아오는 
	public MdVO upgetMd(int mNo);
	
	//메뉴 상품 번호 자동 입력
	public MdVO mdNo(MdVO vo);
	
	//키워드 별 메뉴 조회
	public List<MdVO> selectkind(MdVO vo);
	
	//품절 키워드
	public List<MdVO> soldList(MdVO vo);
	
	//베스트 메뉴
	public List<MdVO> bestList(MdVO vo);
	
	//검색 별
	public List<MdVO> searchList(MdVO vo);
	
	//메뉴 조회, 검색
	public List<MdVO> selectList(MdVO vo);
	
	// 상품 상세정보 가져오기
	public MdVO getContent(MdVO vo);
	
	//관리자 메뉴 조회, 검색
	public List<MdVO> adminmdList(Pagination pg);
	
	//관리자 상품 갯수 
	public int countProductList(Pagination pg);
	
	//관리자 메뉴 검색 
	public List<MdVO> adminSearch(MdVO vo);
	
	// 관리자 메뉴 판매중/품절 상품 갯수
	public Map<String, Long> selectMdStatusStatistics();
	
}
