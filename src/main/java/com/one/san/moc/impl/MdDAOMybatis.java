package com.one.san.moc.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.san.moc.MdVO;
import com.one.san.moc.OdVO;
import com.one.san.util.Pagination;

@Repository
public class MdDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertMd(MdVO vo) {
		return mybatis.insert("MdDAO.insertMd", vo);
	}

	public void updateMd(MdVO vo) {
		mybatis.update("MdDAO.updateMd", vo);
	}

	public void deleteMd(MdVO vo) {
		mybatis.delete("MdDAO.updateStateMd", vo);
	}

	public MdVO upgetMd(int mNo) {
		return mybatis.selectOne("MdDAO.getMd", mNo);
	}

	public MdVO mdNo(MdVO vo) {
		MdVO no = mybatis.selectOne("MdDAO.mdNo", vo);
		if(no == null) {
			no.setM_no(1);
		}else {
			no.setM_no(no.getM_no() + 1);
		}
		return no;
	}

	public List<MdVO> selectkind(MdVO vo) {
		return mybatis.selectList("MdDAO.selectkind", vo);
	}

	public List<MdVO> soldList(MdVO vo) {
		return mybatis.selectList("MdDAO.soldList", vo);
	}
	
	public List<MdVO> bestList(MdVO vo) {
		return mybatis.selectList("MdDAO.bestList", vo);
	}

	public List<MdVO> searchList(MdVO vo) {
		return mybatis.selectList("MdDAO.searchList", vo);
	}

	public List<MdVO> adminmdList(Pagination pg) {
		return mybatis.selectList("MdDAO.adminmdList", pg);
	}

	public List<MdVO> selectList(MdVO vo) {
		return mybatis.selectList("MdDAO.selectList", vo);
	}

	public MdVO getMd(MdVO vo) {
		return mybatis.selectOne("MdDAO.getMd", vo);
	}

	public MdVO getContent(MdVO vo) {
		return mybatis.selectOne("MdDAO.getContent", vo);
	}

	public int countProductList(Pagination pg) {
		return mybatis.selectOne("MdDAO.countProductList", pg);
	}

	public List<MdVO> adminSearch(MdVO vo) {
		return mybatis.selectList("MdDAO.searchList", vo);
	}
	
	public Map<String, Long> selectMdStatusStatistics() {
        return mybatis.selectOne("MdDAO.selectMdStatusStatistics");
    }

}
