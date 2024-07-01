package com.one.san.moc.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.san.moc.OdVO;
import com.one.san.user.UserVO;
import com.one.san.util.Pagination;

@Repository
public class OdDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 바로 취소
	public void revokeOd(String mid) {
		mybatis.update("OdDAO.revokeOd", mid);
	}

	// 관리자가 취소
	public void revokeOd2(String mid, String state, int point, String id, int usePoint) {
		if (usePoint >= 1) {
			UserVO uv = new UserVO();
			uv.setU_id(id);
			uv.setU_point(usePoint);
			mybatis.update("OdDAO.plusPoint", uv);
		}
		if (state.equals("완료")) {
			UserVO vo = new UserVO();
			vo.setU_id(id);
			vo.setU_point(point);
			mybatis.update("OdDAO.revokeOdState", vo);
		}
		mybatis.update("OdDAO.revokeOd", mid);
	}

	// 주문 상태 변경
	public void updateOd(OdVO vo) {
		mybatis.update("OdDAO.updateOd", vo);
	}

	// 전체 주문 내역
	public List<OdVO> odAllList(OdVO vo) {
		return mybatis.selectList("OdDAO.odAllList", vo);
	}

	// 해당 주문 내역
	public OdVO selectOd(OdVO vo) {
		return mybatis.selectOne("OdDAO.selectOd", vo);
	}

	// 전체 주문내역 검색
	public List<OdVO> odsearch(OdVO vo) {
		return mybatis.selectList("OdDAO.odsearch", vo);
	}

	// 오늘 주문내역 검색
	public List<OdVO> toodsearch(OdVO vo) {
		return mybatis.selectList("OdDAO.toodsearch", vo);
	}

	// 전체 주문내역
	public List<OdVO> getProductListPaging(Pagination pg) {
		return mybatis.selectList("OdDAO.getProductListPaging", pg);
	}
	
	// 주문내역 갯수
	public int countProductList(Pagination pg) {
		return mybatis.selectOne("OdDAO.countProductList", pg);
	}

	// 오늘 주문내역 갯수
	public int todaycount(Pagination pg) {
		return mybatis.selectOne("OdDAO.todaycount", pg);
	}

	// 오늘 주문내역
	public List<OdVO> todayPaging(Pagination pg) {
		return mybatis.selectList("OdDAO.todayPaging", pg);
	}
	
	// 나의 주문내역 갯수
	public int myCount(OdVO vo) {
		return mybatis.selectOne("OdDAO.myCount", vo);
	}

	// 주문시 od테이블 insert
	public int putOder(OdVO vo) {
		return mybatis.insert("OdDAO.putOder", vo);
	}

	// 전자영수증에서 사용할 데이터 가져오기
	public OdVO receipt(OdVO vo) {
		return mybatis.selectOne("OdDAO.receipt", vo);
	}

	// 나의 주문전체 내역
	public List<OdVO> odMyAllList(OdVO vo, Pagination pg) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("vo", vo);
		paramMap.put("pg", pg);
		return mybatis.selectList("OdDAO.odMyAllList", paramMap);
	}

	// 나의 주문 전체내역 날짜검색
	public List<OdVO> odAllListDate(OdVO vo) {
		return mybatis.selectList("OdDAO.odAllListDate", vo);
	}

	// 나의 주문진행중 내역
	public List<OdVO> odMyList(OdVO vo) {
		return mybatis.selectList("OdDAO.odMyList", vo);
	}

	// 포인트 업데이트
	public void pointUp(OdVO vo) {
		UserVO user = new UserVO();
		user.setU_id(vo.getO_id());
		user.setU_point(vo.getO_savepoint());
		mybatis.update("UserDAO.pointUp", user);
	}

	// 회원이 주문 취소 시 사용한 포인트가 있으면 다시 +
	public void pointReset(String o_id, int o_usepoint) {
		UserVO user = new UserVO();
		user.setU_id(o_id);
		user.setU_point(o_usepoint);
		mybatis.update("UserDAO.pointUp", user);
	}
	//리뷰 작성 여부 변경
	public void reviewUpdate(OdVO od) {
		mybatis.update("OdDAO.reviewUpdate", od);
	}
	
	// 전체 배달 주문내역
	public List<OdVO> deliveryList(Pagination pg) {
		return mybatis.selectList("OdDAO.deliveryList", pg);
	}
	
	// 배달 주문내역 갯수
	public int deliveryCount(Pagination pg) {
		return mybatis.selectOne("OdDAO.deliveryCount", pg);
	}
	
	// 오늘 배달 주문내역
	public List<OdVO> todayDelivery(Pagination pg) {
		return mybatis.selectList("OdDAO.todayDelivery", pg);
	}
	
	// 오늘 배달 주문내역 갯수
	public int todayDeliveryCt(Pagination pg) {
		return mybatis.selectOne("OdDAO.todayDeliveryCt", pg);
	}
	
	// 전체 배달 주문내역 검색
	public List<OdVO> deliodsearch(OdVO vo) {
		return mybatis.selectList("OdDAO.deliodsearch", vo);
	}
	
	// 오늘 배달 주문내역 검색
	public List<OdVO> deltosearch(OdVO vo) {
		return mybatis.selectList("OdDAO.deltosearch", vo);
	}

	/////////////////////////통계
	// 주간통계
	public List<OdVO> getWeeklyStatisticsList() {
		return mybatis.selectList("OdDAO.weeklyStatistics");
	}
	// 당월통계
	public List<OdVO> getMonthlyStatisticsList() {
		return mybatis.selectList("OdDAO.monthTotalStatistics");
	}
	// 기간지정통계
	public List<OdVO> getSelTotalStatisticsList(OdVO vo) {
		return mybatis.selectList("OdDAO.selectTotalStatistics", vo);
	}
	// 특정 월간 통계
	public List<OdVO> getSelMonStatisticsList(OdVO vo) {
		return mybatis.selectList("OdDAO.selectMonStatistics", vo);
	}

	public Map<String, BigDecimal> selectMdSaleStatistics() {
        return mybatis.selectOne("OdDAO.selectMdSaleStatistics");
    }
	
	public Map<String, BigDecimal> selectMdTodayStatistics() {
        return mybatis.selectOne("OdDAO.selectMdTodayStatistics");
    }
	
	public List<OdVO> selectGraphMonStatistics() {
        return mybatis.selectList("OdDAO.selectGraphMonStatistics");
    }
	
	public List<OdVO> selectGraphWeekStatistics() {
        return mybatis.selectList("OdDAO.selectGraphWeekStatistics");
    }
}
