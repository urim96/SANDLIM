package com.one.san.moc.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.one.san.moc.MdService;
import com.one.san.moc.MdVO;
import com.one.san.moc.OdVO;
import com.one.san.util.Pagination;

@Service("mdservice")
public class MdServiceImpl implements MdService {

	@Autowired
	private MdDAOMybatis mdDAO;

	// 메뉴 등록
	@Override
	public int insertMd(MdVO md) {
		return mdDAO.insertMd(md);
	}

	// 메뉴 수정
	@Override
	public void updateMd(MdVO vo) {
		mdDAO.updateMd(vo);
	}

	// 메뉴 삭제
	@Override
	public void deleteMd(MdVO vo) {
		mdDAO.deleteMd(vo);
	}

	//메뉴 한 줄 가져오기 
	@Override
	public MdVO upgetMd(int mNo) {
		return mdDAO.upgetMd(mNo);
	}
	//마지막 상품 번호 가져오기
	@Override
	public MdVO mdNo(MdVO vo) {
		return mdDAO.mdNo(vo);
	}

	// 키워드 메뉴
	@Override
	public List<MdVO> selectkind(MdVO vo) {
		return mdDAO.selectkind(vo);
	}
	
	// 베스트 메뉴
	@Override
	public List<MdVO> bestList(MdVO vo) {
		return mdDAO.bestList(vo);
	}
	
	// 품절 메뉴
	@Override
	public List<MdVO> soldList(MdVO vo) {
		return mdDAO.soldList(vo);
	}

	// 메뉴 검색
	@Override
	public List<MdVO> searchList(MdVO vo) {
		return mdDAO.searchList(vo);
	}

	// 전체 메뉴 조회
	@Override
	public List<MdVO> selectList(MdVO vo) {
		return mdDAO.selectList(vo);
	}
	
	// 관리자 전체 메뉴 조회
	@Override
	public List<MdVO> adminmdList(Pagination pg) {
		return mdDAO.adminmdList(pg);
	}

	// 메뉴 상세정보 가져오기
	@Override
	public MdVO getMd(MdVO vo) {
		return mdDAO.getMd(vo);
	}

	// 메뉴 영양정보 가져오기
	@Override
	public MdVO getContent(MdVO vo) {
		return mdDAO.getContent(vo);
	}
	//메뉴 갯수 
	@Override
	public int countProductList(Pagination pg) {
		return mdDAO.countProductList(pg);
	}
	//관리자 메뉴 검색 
	@Override
	public List<MdVO> adminSearch(MdVO vo) {
		return mdDAO.adminSearch(vo);
	}
	
	@Override
	public Map<String, Long> selectMdStatusStatistics() {
		return mdDAO.selectMdStatusStatistics();
	}

}
