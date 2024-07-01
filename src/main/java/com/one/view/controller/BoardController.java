package com.one.view.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.one.san.board.BoardService;
import com.one.san.board.BoardVO;
import com.one.san.moc.OdService;
import com.one.san.moc.OdVO;
import com.one.san.util.Pagination;

// @Component
@Controller
@SessionAttributes({ "board", "faq" })
public class BoardController {

	// 스프링 컨테이너
	@Autowired
	private BoardService boardService;

	@Autowired
	private OdService odService;

	String realPath = "c:/swork/sandlim/src/main/webapp/resources/bimg/";

//   request에 attribute 세션보다 메모리 처리가 빠르다.
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		// 키가 내용, 값이 "CONTENT"
		conditionMap.put("카테고리", "B_CAT");
		conditionMap.put("내용", "B_CONTENT");
		conditionMap.put("제목", "B_TITLE");
		return conditionMap;
	}

	// 파일 다운로드
	@GetMapping(value = "/download.do")
	public void fileDownLoad(@RequestParam(value = "filename", required = false) String filename,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (!(filename == null || filename.equals(""))) {
			// 요청 파일정보 불러오기
//         realPath = request.getSession().getServletContext().getRealPath("/img/");
			File file = new File(realPath + filename);

			String fn = new String(file.getName().getBytes(), "iso_8859_1");

			// 파일 다운로드 설정문
			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
			response.setContentLength(bytes.length);

			response.getOutputStream().write(bytes);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

	// ABOUT
	@RequestMapping("/getAbout.do")
	public String getAboutPage() {
		return "board/getAbout";
	}

	// NOTICE 목록 (사용자)
	@RequestMapping("/getBoardList.do")
	public String getBoardList(
			@RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, BoardVO vo, Model model,
			ModelAndView mav) {
		// 페이징을 위한 객체 생성
		Pagination pg = new Pagination();
		// 검색 카테고리
		pg.setSearchType(searchType);
		// 검색어
		pg.setKeyword(keyword);
		// 현재페이지
		pg.setCurrPageNo(currPageNo);
		// 보여줄 페이지 범위
		pg.setRange(range);

		// 검색된 데이터의 총 갯수
		int totalCnt = boardService.boardTotalCnt3(pg);
		// 페이징 처리 시작
		pg.pageInfo(currPageNo, range, totalCnt);

//      if (vo.getB_title() == null)
//      vo.setB_title("");
		model.addAttribute("pagination3", pg);
		model.addAttribute("notice", boardService.selectList3(pg));

		return "board/getBoardList";
	}

	// NOTICE 상세 (사용자)
    @RequestMapping("/getBoard.do")
    public String getBoard(@RequestParam("b_num") int bNum, BoardVO vo, Model model) {
	    vo.setB_num(bNum);
	    vo = boardService.getBoard(vo);
	    boardService.getCount(vo);
	    
	    model.addAttribute("board", boardService.getBoard(vo));
	    return "board/getBoard";
    }

	@RequestMapping(value = { "/getFaq.do" }, method = RequestMethod.GET)
	   public String terms() {
	      return "board/getFaq";
	   }

	   // FAQ 목록 보기(사용자)
	   @RequestMapping("/getBoardFaq.do")
	   public ResponseEntity<Map<String, Object>> getFaqPost(
	           @RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
	           @RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
	           @RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
	           @RequestParam(value = "range", required = false, defaultValue = "1") int range,
	           BoardVO vo, Model model) {

	       // 페이징을 위한 객체 생성
	       Pagination pg = new Pagination();
	       pg.setSearchType(searchType);
	       // 현재페이지
	       pg.setCurrPageNo(currPageNo);
	       // 보여줄 페이지 범위
	       pg.setRange(range);

	       // 검색된 데이터의 총 갯수
	       int totalCnt = boardService.faqTotalCnt(pg);

	       // 페이징 처리 시작
	       pg.pageInfo(currPageNo, range, totalCnt);

	       model.addAttribute("pagination", pg);
	       List<BoardVO> faqList = boardService.selectFaqList(pg);

	       Map<String, Object> response = new HashMap<>();
	       response.put("pagination", pg);
	       response.put("faqList", faqList);

	       return new ResponseEntity<>(response, HttpStatus.OK);
	   }
	// REVIEW 목록 (사용자-페이지네이션)
	@RequestMapping("/getReview.do")
	public String getReview(@RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, BoardVO vo, Model model,
			ModelAndView mav) {
		// 페이징을 위한 객체 생성
		Pagination pg = new Pagination();
		// 검색 카테고리
		pg.setSearchType(searchType);
		// 검색어
		pg.setKeyword(keyword);
		// 현재페이지
		pg.setCurrPageNo(currPageNo);
		// 보여줄 페이지 범위
		pg.setRange(range);

		// 검색된 데이터의 총 갯수
		int totalCnt = boardService.boardTotalCnt5(pg);
		// 페이징 처리 시작
		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination5", pg);
		model.addAttribute("review", boardService.selectList5(pg));

		return "board/getReview";
	}

	// REVIEW 상세 (사용자)
	@RequestMapping("/getReviewDetail.do")
	public String getReviewDetail(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getReviewDetail(vo));
		return "board/getReviewDetail";
	}

//	// REVIEW 등록 이동 (사용자)
//	@RequestMapping("/getinsertReview.do")
//	public ModelAndView getinsertReview(
//			@RequestParam(value = "o_name", required = false) String o_name,
//			@RequestParam(value = "o_no", required = false) String o_no, HttpSession session, ModelAndView model) {
//				OdVO od = new OdVO();
//				od.setO_name(o_name);
//				od.setO_no(o_no);
//				
//				model.addObject("od" , od);
//				model.setViewName("board/insertReview");
//				return model;
//	}

//	리뷰 등록시 한 줄 데이터 받아오기  
	@RequestMapping("/getinsertReview.san")
	public ResponseEntity<OdVO> getinsertReview(@RequestParam("o_no") String o_no) {
		OdVO od = new OdVO();
		od.setO_no(o_no);
		od = odService.selectOd(od);
		if (od != null) {
			return new ResponseEntity<>(od, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	// REVIEW 등록 (사용자)
	@PostMapping(value = "/insertReview.do")
	public String insertReview(BoardVO vo, HttpServletRequest request1, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {

		String o_no = request1.getParameter("o_no");
		OdVO od = new OdVO();
		od.setO_no(o_no);

		MultipartFile uploadFile = vo.getUploadB_file();

		String relativePath = "/resources/rimg/";
		String realPath = request.getServletContext().getRealPath(relativePath);

		File f = new File(realPath);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileName = uploadFile.getOriginalFilename();
		if (!uploadFile.isEmpty()) {
			vo.setB_file(fileName);
			uploadFile.transferTo(new File(realPath + fileName));
		}
		int insert = boardService.insertReview(vo);
		if (insert > 0) {
			odService.reviewUpdate(od);
		}
		return "redirect:getReview.do";
	}
	
	// REVIEW 목록 (사용자 작성한 리뷰)
	@RequestMapping("/getMyReview.do")
	public ModelAndView getMyReview(BoardVO vo, ModelAndView mav, HttpSession session) {

		String b_nick = (String) session.getAttribute("userNick");
		vo.setB_nick(b_nick);

		mav.addObject("boardList", boardService.getMyReview(vo));
		mav.setViewName("board/getMyReview");
		return mav;
	}

	

//   =================================================================
//   관리자 페이지 관련
//   =================================================================

	// 관리자페이지
	@RequestMapping("/adminWork.do")
	public String adminWork() {
		return "admin/adminWork";
	}

	// NOTICE 등록 (관리자)
	@PostMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO vo, MultipartHttpServletRequest request)
			throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadB_file();

		String relativePath = "/resources/bimg/";
		String realPath = request.getServletContext().getRealPath(relativePath);

		File f = new File(realPath);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileName = uploadFile.getOriginalFilename();
		if (!uploadFile.isEmpty()) {
			vo.setB_file(fileName);
			uploadFile.transferTo(new File(realPath + fileName));
		}

		boardService.insertBoard(vo);
		return "redirect:adminGetBoardList.do";
	}

	// NOTICE 수정 (관리자)
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, MultipartHttpServletRequest request,
			HttpSession session) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadB_file();

		String relativePath = "/resources/bimg/";
		String realPath = request.getServletContext().getRealPath(relativePath);

		File f = new File(realPath);

		if (!f.exists()) {
			f.mkdirs();
		}

		String fileName = uploadFile.getOriginalFilename();
		if (!uploadFile.isEmpty()) {
			// 새로운 파일이 업로드된 경우
			// 기존 파일 삭제
			String oldFilePath = realPath + vo.getB_file();
			File oldFile = new File(oldFilePath);
			if (oldFile.exists()) {
				oldFile.delete(); // 기존 파일 삭제
			}

			// 새 파일 업로드
			vo.setB_file(fileName);
			uploadFile.transferTo(new File(realPath + fileName));
		}

		if (vo.getB_nick().equals(session.getAttribute("userNick").toString())) {
			boardService.updateBoard(vo);
			return "redirect:adminGetBoardList.do";
		} else {
			return "adminGetBoard.do?error=1";
		}
	}

	// NOTICE 삭제 (관리자)
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:adminGetBoardList.do";
	}

	// NOTICE 목록 > NOTICE 등록 (관리자)
	@RequestMapping("/getInsertBoard.do")
	public String getInsertBoard() {
		return "admin/insertBoard";
	}

	// NOTICE 목록 (관리자)
	@RequestMapping("/adminGetBoardList.do")
	public String adminGetBoardList(
			@RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, BoardVO vo, Model model,
			ModelAndView mav) {
		// 페이징을 위한 객체 생성
		Pagination pg = new Pagination();
		// 검색 카테고리
		pg.setSearchType(searchType);
		// 검색어
		pg.setKeyword(keyword);
		// 현재페이지
		pg.setCurrPageNo(currPageNo);
		// 보여줄 페이지 범위
		pg.setRange(range);

		// 검색된 데이터의 총 갯수
		int totalCnt = boardService.boardTotalCnt2(pg);
		// 페이징 처리 시작
		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination1", pg);
		model.addAttribute("notice", boardService.selectList2(pg));

		return "admin/adminGetBoardList";
	}

	// NOTICE 상세 (관리자)
	@RequestMapping("/adminGetBoard.do")
	public String adminGetBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.adminGetBoard(vo));
		return "admin/adminGetBoard";
	}

	// REVIEW 목록 (관리자)
	@RequestMapping("/adminGetReview.do")
	public String adminGetReview(
			@RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, BoardVO vo, Model model,
			ModelAndView mav) {
		// 페이징을 위한 객체 생성
		Pagination pg = new Pagination();
		// 검색 카테고리
		pg.setSearchType(searchType);
		// 검색어
		pg.setKeyword(keyword);
		// 현재페이지
		pg.setCurrPageNo(currPageNo);
		// 보여줄 페이지 범위
		pg.setRange(range);

		// 검색된 데이터의 총 갯수
		int totalCnt = boardService.boardTotalCnt4(pg);
		// 페이징 처리 시작
		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination4", pg);
		model.addAttribute("review", boardService.selectList4(pg));

		return "admin/adminGetReview";
	}

	// REVIEW 상세 (관리자)
	@RequestMapping("/adminGetReviewDetail.do")
	public String adminGetReviewDetail(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.adminGetReviewDetail(vo));
		return "admin/adminGetReviewDetail";
	}

	// REVIEW 수정 (관리자) 비공개처리 로직
	@RequestMapping("/adminUpdateReview.do")
	public String adminUpdateReview(@ModelAttribute("board") BoardVO vo, HttpSession session) {
		boardService.adminUpdateReview(vo);
		return "redirect:adminGetReview.do";
	}

	// REVIEW 삭제 (사용자)
	@RequestMapping("/deleteReview.do")
	public String deleteReview(BoardVO vo) {
		boardService.deleteReview(vo);
		return "redirect:getReview.do";
	}

	// 관리자 faq 페이지
	@RequestMapping("/adminGetFaq.do")
	public String adminGetFaq(
			@RequestParam(value = "searchType", defaultValue = "", required = false) String searchType,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "currPageNo", required = false, defaultValue = "1") int currPageNo,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range, BoardVO vo, Model model,
			ModelAndView mav) {

		// 페이징을 위한 객체 생성
		Pagination pg = new Pagination();
		// 검색 카테고리
		pg.setSearchType(searchType);
		// 검색어
		pg.setKeyword(keyword);
		// 현재페이지
		pg.setCurrPageNo(currPageNo);
		// 보여줄 페이지 범위
		pg.setRange(range);

		// 검색된 데이터의 총 갯수
		int totalCnt = boardService.boardTotalCnt(pg);
		// 페이징 처리 시작
		pg.pageInfo(currPageNo, range, totalCnt);

		model.addAttribute("pagination", pg);
		model.addAttribute("faq", boardService.selectList(pg));
		return "admin/adminGetFaq";

	}

	// 검색초기화?
	@RequestMapping(value = "/resetFaq.do")
	public String resetFaq() {
		return "admin/adminGetFaq"; // 초기화된 뷰의 경로를 반환
	}

	// 관리자 faq 글 상세 조회
	@RequestMapping("/adminFaqDetail.do")
	public String adminFaqList(BoardVO vo, Model model) {
		model.addAttribute("faq", boardService.adminFaqDetail(vo));
		return "admin/adminFaqDetail";
	}

	// faq 등록하기
	@RequestMapping(value = "/insertFaq.do")
	public String adminInsertFaq(BoardVO vo) throws IllegalStateException, IOException {
		boardService.insertFaq(vo);
		return "redirect:adminGetFaq.do";
	}

	// faq 등록 양식 페이지 (새글쓰기 클릭)
	@RequestMapping(value = "/adminInsertFaq.do")
	public String handleRequest(BoardVO vo) {
		return "admin/adminInsertFaq";
	}

	// faq 글 수정
	@RequestMapping("/updateFaq.do")
	public String updateFaq(@ModelAttribute("faq") BoardVO vo, Model model) {
		boardService.updateFaq(vo);
		return "redirect:adminGetFaq.do";
	}

	// faq 글 삭제
	@RequestMapping("/deleteFaq.do")
	public String deleteFaq(BoardVO vo) {
		boardService.deleteFaq(vo);
		return "redirect:adminGetFaq.do";
	}

	// faq 키워드 별로 출력(사용자)
	@RequestMapping("/kind.do")
	@ResponseBody
	public Object selectkind(BoardVO vo) {
		List<BoardVO> kindList = boardService.selectkind(vo);
		Map<String, Object> kList = new HashMap<String, Object>();
		int length = kindList.size();
		kList.put("kindList", kindList);
		kList.put("length", length);
		return kList;
	}

}