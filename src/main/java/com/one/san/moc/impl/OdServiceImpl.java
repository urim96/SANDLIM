package com.one.san.moc.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.san.moc.MdVO;
import com.one.san.moc.OdService;
import com.one.san.moc.OdVO;
import com.one.san.util.Pagination;

@Service("odservice")
public class OdServiceImpl implements OdService {

	@Autowired
	private OdDAOMybatis odDAO;

	@Override
	public void revokeOd(String mid) {
		odDAO.revokeOd(mid);
	}

	@Override
	public void revokeOd2(String mid, String state, int point, String id, int usePoint) {
		odDAO.revokeOd2(mid, state, point, id, usePoint);
	}

	@Override
	public void updateOd(OdVO vo) {
		odDAO.updateOd(vo);
	}

	@Override
	public OdVO selectOd(OdVO vo) {
		return odDAO.selectOd(vo);

	}

	@Override
	public List<OdVO> odsearch(OdVO vo) {
		return odDAO.odsearch(vo);
	}

	@Override
	public List<OdVO> toodsearch(OdVO vo) {
		return odDAO.toodsearch(vo);
	}

	@Override
	public List<OdVO> getProductListPaging(Pagination pg) {
		return odDAO.getProductListPaging(pg);
	}

	@Override
	public int countProductList(Pagination pg) {
		return odDAO.countProductList(pg);
	}
	

	@Override
	public List<OdVO> todayPaging(Pagination pg) {
		return odDAO.todayPaging(pg);
	}

	@Override
	public int todaycount(Pagination pg) {
		return odDAO.todaycount(pg);
	}
	
	@Override
	public int myCount(OdVO vo) {
		return odDAO.myCount(vo);
	}

	@Override
	public int putOder(OdVO vo) {
		return odDAO.putOder(vo);
	}

	@Override
	public OdVO receipt(OdVO vo) {
		return odDAO.receipt(vo);
	}

	@Override
	public List<OdVO> odMyList(OdVO vo) {
		return odDAO.odMyList(vo);
	}

	@Override
	public void pointUp(OdVO vo) {
		odDAO.pointUp(vo);
	}

	@Override
	public List<OdVO> odMyAllList(OdVO vo, Pagination pg) {
		return odDAO.odMyAllList(vo, pg);
	}

	@Override
	public List<OdVO> odAllListDate(OdVO vo) {
		return odDAO.odAllListDate(vo);
	}

	@Override
	public void pointReset(String o_id, int o_usepoint) {
		odDAO.pointReset(o_id, o_usepoint);
	}
	//리뷰 작성 상태 변경 
	@Override
	public void reviewUpdate(OdVO od) {
		odDAO.reviewUpdate(od);
	}
	
	@Override
	public List<OdVO> deliveryList(Pagination pg) {
		return odDAO.deliveryList(pg);
	}

	@Override
	public int deliveryCount(Pagination pg) {
		return odDAO.deliveryCount(pg);
	}
	

	@Override
	public List<OdVO> todayDelivery(Pagination pg) {
		return odDAO.todayDelivery(pg);
	}

	@Override
	public int todayDeliveryCt(Pagination pg) {
		return odDAO.todayDeliveryCt(pg);
	}
	
	@Override
	public List<OdVO> deliodsearch(OdVO vo) {
		return odDAO.deliodsearch(vo);
	}

	@Override
	public List<OdVO> deltosearch(OdVO vo) {
		return odDAO.deltosearch(vo);
	}
	
	//통계
	//주간통계
	@Override
	public List<OdVO> getWeeklyStatisticsList(){
		return odDAO.getWeeklyStatisticsList();
	}
	//당월통계
	@Override
	public List<OdVO> getMonthlyStatisticsList(){
		return odDAO.getMonthlyStatisticsList();
	}
	//기간지정통계
	@Override
	public List<OdVO> getSelTotalStatisticsList(OdVO vo){
		return odDAO.getSelTotalStatisticsList(vo);
	}
	//특정 월간 통계
	@Override
	public List<OdVO> getSelMonStatisticsList(OdVO vo){
		return odDAO.getSelMonStatisticsList(vo);
	}

	@Override
	public Map<String, BigDecimal> selectMdSaleStatistics() {
		return odDAO.selectMdSaleStatistics();
	}
	
	@Override
	public Map<String, BigDecimal> selectMdTodayStatistics() {
		return odDAO.selectMdTodayStatistics();
	}
	
	@Override
	public List<OdVO> selectGraphMonStatistics() {
		return odDAO.selectGraphMonStatistics();
	}

	@Override
	public List<OdVO> selectGraphWeekStatistics() {
		return odDAO.selectGraphWeekStatistics();
	}
}
