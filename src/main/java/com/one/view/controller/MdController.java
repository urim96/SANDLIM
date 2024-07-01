package com.one.view.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.one.san.moc.CartService;
import com.one.san.moc.CartVO;
import com.one.san.moc.MdService;
import com.one.san.moc.MdVO;
import com.one.san.moc.OdService;
import com.one.san.moc.OdVO;
import com.one.san.util.Pagination;

@Controller
@SessionAttributes("staod")
public class MdController {

	@Autowired
	private MdService mdService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OdService odService;

	
	//	관리자 전체메뉴 출력
	@RequestMapping("/adminMd.san")
	public ModelAndView adminMd(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range,
			MdVO vo, ModelAndView model) {
		
		Pagination pg = new Pagination();
		pg.setSizePerPage(5);
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);
		
		int totalCnt = mdService.countProductList(pg);
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		model.addObject("pagination", pg);
		model.addObject("mdList", mdService.adminmdList(pg));
		model.setViewName("admin/adminMd");
		return model;
	}

	//	유저용 전체메뉴 출력
	@RequestMapping("/selectList.san")
	public ModelAndView selectList(MdVO vo, ModelAndView model) {
//		if (vo.getSearchKeyword() == null) {
//			vo.setSearchKeyword("");
//		}
		model.addObject("mdList", mdService.selectList(vo));
		model.setViewName("md/selectMdList");
		return model;
	}

	// 키워드 별로 출력 
	@RequestMapping("/kind.san")
	@ResponseBody
	public Map<String, Object> selectkind(MdVO vo) {
		List<MdVO> kindList = mdService.selectkind(vo);
		Map<String, Object> kList = new HashMap<String, Object>();
		int length = kindList.size();
		kList.put("kindList", kindList);
		kList.put("length", length);
		return kList;
	}

	// 품절 메뉴 출력
	@RequestMapping("/sold.san")
	@ResponseBody
	public Map<String, Object> soldList(MdVO vo) {
		List<MdVO> soldList = mdService.soldList(vo);
		Map<String, Object> sList = new HashMap<String, Object>();
		sList.put("soldList", soldList);
		return sList;
	}
	
	// 베스트 메뉴 출력
	@RequestMapping("/bestmenu.san")
	@ResponseBody
	public Map<String, Object> bestmenu(MdVO vo) {
		List<MdVO> bestList = mdService.bestList(vo);
		Map<String, Object> bList = new HashMap<String, Object>();
		bList.put("bestList", bestList);
		return bList;
	}

	// 메뉴 검색기능
	@RequestMapping("/search.san")
	@ResponseBody
	public Map<String, Object> search(MdVO vo) {
		List<MdVO> searchList = mdService.searchList(vo);
		Map<String, Object> sList = new HashMap<String, Object>();
		sList.put("searchList", searchList);
		return sList;
	}
	
	// 관리자 메뉴 검색 페이징 
	@RequestMapping("/adminSearch.san")
	@ResponseBody
	public Map<String, Object> adminSearch(
			@RequestParam(value = "searchCondition", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword, MdVO vo) {

		List<MdVO> searchList = mdService.adminSearch(vo);
		Map<String, Object> sList = new HashMap<String, Object>();
		int length = searchList.size();
		sList.put("searchList", searchList);
		sList.put("length", length);
		return sList;
	}

	//	관리자: 메뉴 추가(인풋) 페이지로 이동
	@RequestMapping("/insert.san")
	public String insert(MdVO vo, Model model) {
		MdVO no = mdService.mdNo(vo);
			
		model.addAttribute("mdno", no.getM_no());
		return "/admin/insertMd";
	}
	
	//메뉴 추가
	@PostMapping(value = "/insertmd.san")
	public String insertMd(MdVO vo, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadfile();

		String relativePath = "/resources/img/";
		String realPath = request.getServletContext().getRealPath(relativePath);

		File f = new File(realPath);

		if (!f.exists()) {
			f.mkdirs();
		}
		String fileName = uploadFile.getOriginalFilename();

		if (!uploadFile.isEmpty()) {
			vo.setM_img(fileName);
			uploadFile.transferTo(new File(realPath + fileName));
		}
		mdService.insertMd(vo);
		return "redirect:adminMd.san";
	}

	// 관리자 : 메뉴 수정 클릭 시 한 줄 데이터 받아오는 
	@GetMapping("/upgetMd.san")
	public ResponseEntity<MdVO> upgetMd(@RequestParam("m_no") int mNo) {
		MdVO md = mdService.upgetMd(mNo);
		if (md != null) {
			return new ResponseEntity<>(md, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	// 관리자 : 메뉴 수정
	@RequestMapping("/updateMd.san")
	public String updateMd(MdVO vo, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		if (!(vo.getUploadfile() == null)) {
			MultipartFile uploadFile = vo.getUploadfile();

			String relativePath = "/resources/img/";
			String realPath = request.getServletContext().getRealPath(relativePath);

			File f = new File(realPath);

			if (!f.exists()) {
				f.mkdirs();
			}
			String fileName = uploadFile.getOriginalFilename();

			if (!uploadFile.isEmpty()) {
				vo.setM_img(fileName);
				uploadFile.transferTo(new File(realPath + fileName));
			}
		}
		mdService.updateMd(vo);
		return "redirect:adminMd.san";
	}

	// 관리자 : 메뉴 삭제 -> 판매종료로 업데이트 처리
	@RequestMapping("/deleteMd.san")
	public String deleteMd(MdVO vo) {
		mdService.deleteMd(vo);
		return "redirect:adminMd.san";
	}

	// 포인트 적립 
	@RequestMapping("/pointUp.san")
	@ResponseBody
	public Map<String, Object> pointUp(OdVO vo) {
		odService.pointUp(vo);
		Map<String, Object> oList = new HashMap<String, Object>();
		oList.put("odList", vo);
		return oList;
	}

	// 관리자 : 메뉴 상태변경 (주문 접수 - 제조중 - 제조완료 - 픽업완료)
	@RequestMapping("/updateOd.san")
	public String updateOd(OdVO vo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		odService.updateOd(vo);
		return "redirect:" + referer;
	}

	// 메뉴 상세보기 
	@RequestMapping("/getMd.san")
	public ResponseEntity<MdVO> getMd(MdVO vo) {
		MdVO md = mdService.getMd(vo);
		if (md != null) {
			return new ResponseEntity<>(md, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	// 관리자 : 전체 픽업 주문 내역 
	@RequestMapping("/odAllList.san")
	public ModelAndView odAllList(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, OdVO vo,
			ModelAndView model) {
	
		Pagination pg = new Pagination();
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);
	
		int totalCnt = odService.countProductList(pg);
	
		pg.pageInfo(currPageNo, range, totalCnt);
	
		model.addObject("pagination", pg);
		model.addObject("odList", odService.getProductListPaging(pg));
		model.setViewName("admin/adminOd");
		return model;
	}
	
	// 관리자 오늘 픽업 주문내역 
	@RequestMapping("/odTodayList.san")
	public ModelAndView odTodayList(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, OdVO vo,
			ModelAndView model) {
	
		Pagination pg = new Pagination();
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);
	
		int totalCnt = odService.todaycount(pg);
	
		pg.pageInfo(currPageNo, range, totalCnt);
	
		model.addObject("pagination", pg);
		model.addObject("odList", odService.todayPaging(pg));
		model.setViewName("admin/adminTodayOd");
		return model;
	}
	
	// 관리자 : 전체 배달 주문 내역 
	@RequestMapping("/odDelivery.san")
	public ModelAndView odDelivery(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, OdVO vo,
			ModelAndView model) {
		
		Pagination pg = new Pagination();
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);
		
		int totalCnt = odService.deliveryCount(pg);
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		model.addObject("pagination", pg);
		model.addObject("odList", odService.deliveryList(pg));
		model.setViewName("admin/adminDeliveryOd");
		return model;
	}
	
	// 관리자 오늘 배달 주문내역 
	@RequestMapping("/odtoDelivery.san")
	public ModelAndView odtoDelivery(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, OdVO vo,
			ModelAndView model) {
		
		Pagination pg = new Pagination();
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);
		
		int totalCnt = odService.todayDeliveryCt(pg);
		
		pg.pageInfo(currPageNo, range, totalCnt);
		
		model.addObject("pagination", pg);
		model.addObject("odList", odService.todayDelivery(pg));
		model.setViewName("admin/adminTodayDeliveryOd");
		return model;
	}
	
	// 관리자 : 픽업 주문 내역 검색- 페이징
	@RequestMapping("/odSelect.san")
	@ResponseBody
	public Map<String, Object> odSelect(
			@RequestParam(value = "searchCondition", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword, OdVO vo) {
	
		List<OdVO> odsearch = odService.odsearch(vo);
		Map<String, Object> oList = new HashMap<String, Object>();
		int length = odsearch.size();
		oList.put("odsearch", odsearch);
		oList.put("length", length);
		return oList;
	}
	
	//	관리자 :  오늘 픽업 주문 내역 검색- 페이징
	@RequestMapping("/toodSelect.san")
	@ResponseBody
	public Map<String, Object> toodSelect(
			@RequestParam(value = "searchCondition", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword, OdVO vo) {
	
		List<OdVO> odsearch = odService.toodsearch(vo);
		Map<String, Object> oList = new HashMap<String, Object>();
		int length = odsearch.size();
		oList.put("odsearch", odsearch);
		oList.put("length", length);
		return oList;
	}

	// 관리자 :  전체 배달 주문 내역 검색- 페이징
	@RequestMapping("/deliodsearch.san")
	@ResponseBody
	public Map<String, Object> deliodsearch(
			@RequestParam(value = "searchCondition", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword, OdVO vo) {
	
		List<OdVO> odsearch = odService.deliodsearch(vo);
		Map<String, Object> oList = new HashMap<String, Object>();
		int length = odsearch.size();
		oList.put("odsearch", odsearch);
		oList.put("length", length);
		return oList;
	}
	
	// 관리자 :  오늘 배달 주문 내역 검색- 페이징
	@RequestMapping("/deltosearch.san")
	@ResponseBody
	public Map<String, Object> deltosearch(
		@RequestParam(value = "searchCondition", defaultValue = "", required = false) String searchType,
		@RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword, OdVO vo) {
	
	List<OdVO> odsearch = odService.deltosearch(vo);
	Map<String, Object> oList = new HashMap<String, Object>();
	int length = odsearch.size();
	oList.put("odsearch", odsearch);
	oList.put("length", length);
	return oList;
	}
	
//-----------------------------------------------------------------------------

//메뉴 영양정보
	@RequestMapping("/getContent.san")
	public ResponseEntity<MdVO> getContent(MdVO vo) {
		MdVO md = mdService.getContent(vo);
		if (md != null) {
			return new ResponseEntity<>(md, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	// 장바구니에 담기
	@RequestMapping(value = "/insertCart.san", method = RequestMethod.POST)
	public ResponseEntity<Boolean> insertCart(CartVO vo) {
		Boolean bo = false;
		int cnt = cartService.insertCart(vo);
		if (cnt > 0) {
			bo = true;
			return new ResponseEntity<>(bo, HttpStatus.OK);
		}
		return new ResponseEntity<>(bo, HttpStatus.OK);
	}

	// 장바구니 리스트 가져오기
	   @RequestMapping(value = "/getCartList.san")
	   public ModelAndView getCartList(CartVO vo, ModelAndView mv, HttpSession session, HttpServletResponse response ) throws IOException {
	      String c_id = (String) session.getAttribute("userId");
	      vo.setC_id(c_id);
	      
	      List<CartVO> cartList = cartService.getCartList(vo);
	      int length = cartList.size();
	      
	      if(length <= 0) {
	         response.setContentType("text/html; charset=utf-8");
	         response.setCharacterEncoding("utf-8");
	         PrintWriter out = response.getWriter();
	           out.println("<script>");
	           out.println("alert('장바구니가 비었습니다. 메뉴를 추가해주세요');");
	           out.println("location.href='selectList.san';"); 
	           out.println("</script>"); 
	           out.close();
	           
	         return mv;
	      }
	      else {
	      mv.addObject("cartList", cartList);
	      mv.setViewName("md/cartRoom");
	      return mv;
	      }
	   }

	// 카트에 담긴 상품이 있는지 확인
	@RequestMapping("/ListCheck.san")
	public ResponseEntity<CartVO> CartListCheck(CartVO vo) {
		CartVO cv = cartService.CartListCheck(vo);
		return new ResponseEntity<>(cv, HttpStatus.OK);
	}

	// 카트에 담긴 상품이 있으면 상품 업데이트
	@RequestMapping("/UpdateCart.san")
	public ResponseEntity<Boolean> UpdateCart(CartVO vo) {
		Boolean bo = false;
		int cnt = cartService.UpdateCart(vo);
		if (cnt > 0) {
			bo = true;
			return new ResponseEntity<>(bo, HttpStatus.OK);
		}
		return new ResponseEntity<>(bo, HttpStatus.OK);
	}

	// 장바구니 메뉴삭제
	@RequestMapping("/deleteCart.san")
	public String deleteCart(CartVO vo) {
		int cnt = cartService.deleteCart(vo);
		if (cnt > 0) {
			return "md/cartRoom";
		}
		return "md/cartRoom";
	}

	// 전자영수증 페이지 이동
	@RequestMapping("/payList.san")
	public String payList(HttpSession session) {
		CartVO ov = new CartVO();
		String c_id = (String) session.getAttribute("userId");
		ov.setC_id(c_id);
		int cnt = cartService.payDelete(ov);
		if (cnt > 0) {
			return "md/pay";
		}
		return "md/pay";
	}

	// 전자 영수증 데이터 가져옴
	@RequestMapping("/receipt.san")
	public ResponseEntity<OdVO> receipt(OdVO vo) {
		OdVO ov = odService.receipt(vo);
		if (ov != null) {
			return new ResponseEntity<>(ov, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	// 나의 전체 주문 내역
	@RequestMapping(value = "/odMyAllList.san")
	public ModelAndView odMyAllList(
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, OdVO vo, ModelAndView oma,
			HttpSession session) {
		Pagination pg = new Pagination();
		pg.setCurrPageNo(currPageNo);
		pg.setRange(range);

		String o_id = (String) session.getAttribute("userId");
		vo.setO_id(o_id);
		int totalCnt = odService.myCount(vo);

		pg.pageInfo(currPageNo, range, totalCnt);

		oma.addObject("pagination", pg);
		oma.addObject("odMyAllList", odService.odMyAllList(vo, pg));
		oma.setViewName("md/odAllList");
		return oma;
	}

	// 나의 주문 진행중 내역
	@RequestMapping(value = "/odMyList.san")
	public ModelAndView odMyList(OdVO vo, ModelAndView oma, HttpSession session) {
		String o_id = (String) session.getAttribute("userId");
		vo.setO_id(o_id);
		oma.addObject("odMyList", odService.odMyList(vo));
		oma.setViewName("md/odMyList");
		return oma;
	}

	// 나의 주문 전체 내역 날짜 검색
	@RequestMapping(value = "/odAllListDate.san")
	@ResponseBody
	public Object odAllListDate(OdVO vo, HttpSession session) {
		String o_id = (String) session.getAttribute("userId");
		vo.setO_id(o_id);

		List<OdVO> odAllList = odService.odAllListDate(vo);
		Map<String, Object> oList = new HashMap<String, Object>();
		oList.put("odAllList", odAllList);
		return oList;
	}
	
	   // 장바구니 메뉴전체 삭제
	   @RequestMapping("/cartAllDelete.san")
	   public String cartAllDelete(CartVO vo, HttpSession session, HttpServletResponse response) throws IOException {
	      String c_id = (String) session.getAttribute("userId");
	      vo.setC_id(c_id);
	      int cnt = cartService.cartAllDelete(vo);
	      if (cnt > 0) {
	          response.setContentType("text/html; charset=utf-8");
	            response.setCharacterEncoding("utf-8");
	            PrintWriter out = response.getWriter();
	              out.println("<script>");
	              out.println("alert('장바구니가 비었습니다. 메뉴를 추가해주세요');");
	              out.println("location.href='selectList.san';"); 
	              out.println("</script>"); 
	              out.close();
	      }
	      return "../selectList.san";
	   }
	
	///////////////// 통계페이지
	@RequestMapping("/adminStatistics.san")
	public String adminStatistics(Model model) {
		model.addAttribute("odStaList", odService.getWeeklyStatisticsList());
		model.addAttribute("odStaList2", odService.getMonthlyStatisticsList());
		return "admin/adminStatistics";
	}
	
	//월 통계
	@RequestMapping("/adminStatisticsOther.san")
	public String adminStatisticsOther(Model model) {
		return "admin/adminStatisticsOther";
	}
	
	//주간 통계
	@RequestMapping("/adminWeeklyStatistics.san")
	@ResponseBody
	public Map<String,List<OdVO>> adminWeeklyStatistics(Model model) {
	 
	// map자료형으로 객체 생성//스트링, 리스트vo 
	 Map<String,List<OdVO>> odStaList = new HashMap<String,List<OdVO>>();
	 odStaList.put("odAllList", odService.getWeeklyStatisticsList());
	 odStaList.put("odAllList2", odService.getMonthlyStatisticsList());
	 return odStaList;
	}
	
	// 특정기간 통계 검색 
	@RequestMapping(value = "/getDateList.san")
	@ResponseBody
	public Object adminDateStatic(OdVO vo) {
	     List<OdVO> odStaList3 = odService.getSelTotalStatisticsList(vo);
	     Map<String, Object> oList = new HashMap<String, Object>();
	     int length = odStaList3.size();
	     oList.put("length", length);
	     oList.put("odStaList3", odStaList3);
	     return oList;
	}
	
	// 특정 월 통계 검색 
	@RequestMapping(value = "/getMonList.san")
	@ResponseBody
	public Object adminMonStatic(OdVO vo) {
	  List<OdVO> odStaList4 = odService.getSelMonStatisticsList(vo);
	  Map<String, Object> oList = new HashMap<String, Object>();
	  int length = odStaList4.size();
	  oList.put("length", length);
	  oList.put("odStaList4", odStaList4);
	  return oList;
	}
	
	@RequestMapping("/getGraphWeekStatics.do")
	public ResponseEntity<List<OdVO>> selectGraphWeekStatistics() {
		List<OdVO> statistics = null;
		statistics = odService.selectGraphWeekStatistics();
		return new ResponseEntity<>(statistics, HttpStatus.OK);
	}
	
	
	@RequestMapping("/getGraphMonStatics.do")
	public ResponseEntity<List<OdVO>> getGraphMonStatics() {
		List<OdVO> statistics = null;
		statistics = odService.selectGraphMonStatistics();
		return new ResponseEntity<>(statistics, HttpStatus.OK);
	}
	
	// 관리자 통계메뉴용 오늘의 주문상태파악
	@RequestMapping("/getMdTodayStatics.do")
    public ResponseEntity<Map<String, BigDecimal>> getMdTodayStatics(){
   	    Map<String, BigDecimal> statistics = null;
   	    statistics = odService.selectMdTodayStatistics();
   	    return new ResponseEntity<>(statistics, HttpStatus.OK);
    }
	
	// 관리자 통계메뉴용 일매출건수/일매출금액/월매출건수/월매출금액
	@RequestMapping("/getMdSaleStatics.do")
    public ResponseEntity<Map<String, BigDecimal>> getMdSaleStatusStatics(){
   	    Map<String, BigDecimal> statistics = null;
   	    statistics = odService.selectMdSaleStatistics();
   	    return new ResponseEntity<>(statistics, HttpStatus.OK);
    }
	
	// 관리자 통계메뉴용 판매중/품절 
    @RequestMapping("/getMdStatics.do")
    public ResponseEntity<Map<String, Long>> getMdStatusStatics(){
   	    Map<String, Long> statistics = null;
   	    statistics = mdService.selectMdStatusStatistics();
   	    return new ResponseEntity<>(statistics, HttpStatus.OK);
    }
	
	
}

