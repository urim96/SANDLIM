package com.one.san.moc;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.one.san.util.Pagination;

public interface OdService {

	// 주문 취소(결제 취소 후 실행됨) 주문상태 "주문취소" 로 변경
	public void revokeOd(String mid);
	
	//관리자 주문 취소(결제 취소 후 실행됨) 주문상태 "주문취소" 로 변경
	public void revokeOd2(String mid, String state, int point, String id, int usePoint);

	// 주문 상태 변경
	public void updateOd(OdVO vo);

	// 해당 주문건
	public OdVO selectOd(OdVO vo);

	// 주문 검색
	public List<OdVO> odsearch(OdVO vo);

	// 전체 주문내역 리스트
	public List<OdVO> getProductListPaging(Pagination pg);

	// 오늘 주문내역 리스트
	public List<OdVO> todayPaging(Pagination pg);

	// 전체 주문내역 갯수
	public int countProductList(Pagination pg);

	// 오늘 주문내역 갯수
	public int todaycount(Pagination pg);

	// 오늘 주문 내역 검색
	public List<OdVO> toodsearch(OdVO vo);

	// 주문시 od테이블 insert
	public int putOder(OdVO vo);

	// 전자영수증에서 사용할 데이터 가져오기
	public OdVO receipt(OdVO vo);

	// 나의 주문 전체 내역
	public List<OdVO> odMyAllList(OdVO vo, Pagination pg);
	
	// 나의 주문내역 갯수
	public int myCount(OdVO vo);

	// 나의 주문리스트 날짜 검색
	public List<OdVO> odAllListDate(OdVO vo);

	// 나의 주문진행 내역
	public List<OdVO> odMyList(OdVO vo);

	// 포인트 적립
	public void pointUp(OdVO vo);
	
	//회원이 결제 취소 시 사용한 포인트가 있으면 다시 + 
	public void pointReset(String o_id, int o_usepoint);
	
	//리뷰작성 0 -> 1 상태 변경 
	public void reviewUpdate(OdVO od);

	// 전체 배달 주문내역 리스트
	public List<OdVO> deliveryList(Pagination pg);
	
	// 오늘 배달 주문내역 리스트
	public List<OdVO> todayDelivery(Pagination pg);
	
	// 전체 배달 주문내역 갯수
	public int deliveryCount(Pagination pg);
	
	// 오늘 배달 주문내역 갯수
	public int todayDeliveryCt(Pagination pg);
	
	//전체 배달 내역 검색
	public List<OdVO> deliodsearch(OdVO vo);
	
	//오늘 배달 내역 검색
	public List<OdVO> deltosearch(OdVO vo);
	
	////////////통계
	// 통계용 주간 통계 리스트
	public List<OdVO> getWeeklyStatisticsList();
	
	// 통계용 당월 통계 리스트
	public List<OdVO> getMonthlyStatisticsList();
	
	// 통계용 기간 선택 통계 리스트
	public List<OdVO> getSelTotalStatisticsList(OdVO vo);
	
	// 특정 월간 통계 리스트
	public List<OdVO> getSelMonStatisticsList(OdVO vo);

	// 관리자 메뉴 판매중/품절 상품 갯수
	public Map<String, BigDecimal> selectMdSaleStatistics();
	
	// 관리자 오늘 주문상태
	public Map<String, BigDecimal> selectMdTodayStatistics();
	
	// 관리자 그래프용, 월간 일매출현황
	public List<OdVO> selectGraphMonStatistics();
	
	// 관리자 그래프용, 주간 일매출현황
	public List<OdVO> selectGraphWeekStatistics();
	
}
