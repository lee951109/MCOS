package com.mcos.community.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcos.community.common.Search;
import com.mcos.community.domain.CommunityVO;
import com.mcos.community.domain.ReplyVO;
import com.mcos.community.service.CommunityService;
import com.mcos.community.service.ReplyService;
import com.project.maos.service.MemberService;
import com.project.maos.vo.MemberVO;

@Controller //컨트롤러임을 명시
@RequestMapping("/Community") //주소 패턴
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired //주입 명시
	CommunityService service; //Service호출을 위한 객체생성
	@Autowired //주입 명시
	ReplyService replyService; //replyService호출을 위한 객체생성
	@Autowired
	MemberService memberService; //memberService호출을 위한 객체생성
	
	
	@RequestMapping(value = "/CommunityList", method=RequestMethod.GET) //주소 호출 명시, 호출하려는 주소 와 REST 방식설정
	public String list(Model model, HttpSession session
			, @RequestParam(required = false, defaultValue = "1")int page
			, @RequestParam(required = false, defaultValue = "1")int range
			, @RequestParam(required = false, defaultValue = "title")String searchType
			, @RequestParam(required = false)String keyword
			) throws Exception { //메소드 인자값은 model 인터페이스(jsp 전달)

		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		
		//전체 게시글 개수
		int listCnt = service.listCnt(search);
		
//		Pagination 객체생성 및 페이징 정보 셋팅
//		Pagination pagination = new Pagination();
		search.pageInfo(page, range, listCnt);
		model.addAttribute("Pagination", search);
		model.addAttribute("list",service.list(search)); //jsp에 서비스 호출
		return "/Community/CommunityList";
	}
	
	@RequestMapping(value ="/CommunityRegist", method=RequestMethod.GET) //GET방식으로 페이지 호출
	public void registGET(CommunityVO comVO, Model model) throws Exception{
		
	}
	
	@RequestMapping(value ="/CommunityRegist", method=RequestMethod.POST) //POST방식으로 페이지 호출
	public String registPOST(CommunityVO comVO,ReplyVO replyVO, RedirectAttributes rttr) throws Exception{ //인자값으로 REDIRECT사용
		service.regist(comVO); //글 작성 서비스 호출
		return "redirect:/Community/CommunityList"; //작성이 완료된 후, 목록페이지로 리턴
	}
	
	
	@RequestMapping(value ="/CommunityRead", method=RequestMethod.GET) //GET방식으로 페이지 호출
	public ModelAndView read(@RequestParam("comid")int comid) throws Exception{
		//인자값은 파라미터 값으로 기본키인 글 번호를 기준으로 Model을 사용하여 불러옴
		ModelAndView mav = new ModelAndView();
		CommunityVO vo = service.read(comid);		
		mav.addObject("commVO", vo); //read 서비스 호출
		mav.setViewName("Community/CommunityRead");
//		model.addAttribute("commVO", vo);
		
//		List<ReplyVO> replyVO = replyService.replyList(comid);
//		model.addAttribute("replyVO", replyVO);
//		
		//return "/Community/CommunityRead";
		return mav;	
	}
	
	@RequestMapping(value ="/CommunityModify", method=RequestMethod.GET) //GET방식으로 페이지 호출
	public void modifyGET(int comid, Model model) throws Exception {
		CommunityVO vo = service.read(comid);
		model.addAttribute("commVO", vo); //수정을 위한 글읽기 서비스 호출
	}
	
	@RequestMapping(value ="/CommunityModify", method=RequestMethod.POST) //POST방식으로 데이터 전송
	public String modifyPOST(CommunityVO comVO, RedirectAttributes rttr) throws Exception {
		service.modify(comVO); //글수정 서비스 호출
		return "redirect:/Community/CommunityList"; //수정이 완료된 후, 목록페이지로 리턴
	}
	
	@RequestMapping(value ="/delete", method=RequestMethod.POST) //POST방식으로 데이터 전송
	public String removePOST(@RequestParam("comid") int comid, RedirectAttributes rttr)throws Exception{
		service.remove(comid); //글삭제 서비스 호출
		return "redirect:/Community/CommunityList"; //삭제가 완료된 후, 목록페이지로 리턴
	}
	
	//댓글 목록
	@ResponseBody
	@RequestMapping(value = "/CommunityRead/replyList", method=RequestMethod.GET)
	public List<ReplyVO> getReplyList(@RequestParam("comid")int comid, Model model) throws Exception{
		logger.info("get reply list");
		
		CommunityVO commVO = new CommunityVO();
		model.addAttribute("commVO", comid);
		List<ReplyVO> replyVO = replyService.replyList(comid);
		return replyVO;
	}
	
	//댓글 작성
	@ResponseBody
	@RequestMapping(value = "/CommunityRead/registReply", method=RequestMethod.POST)
	public void registReply(@ModelAttribute ReplyVO replyVO, HttpSession session, Model model) throws Exception{
		//System.out.println(replyVO);
		MemberVO memberVO = (MemberVO)session.getAttribute("userid");
		System.out.println(memberVO);
		//replyVO.setUserid(memberVO.getUserId());

		replyService.registReply(replyVO);
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/CommunityRead/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO replyVO, Principal principal) throws Exception {
	 int result = 0;
	 
	 String userId = principal.getName(); //로그인한 정보
//	 System.out.println("userId : " + userId);
	 String userInfo = replyService.idCheck(replyVO.getReplyid()); // 글쓴 사람 정보
//	 System.out.println("userInfo : " + userInfo);
	 
	 if(userId.equals(userInfo)) { // 로그인 정보랑 글쓴 정보가 같으면
	  
	  replyVO.setUserid(userId);
	  replyService.deleteReply(replyVO); //삭제...
	  	  result = 1;
	 }
	 
	 return result; 
	}
	
	//댓글 수정
	@ResponseBody
	@RequestMapping(value = "/CommunityRead/modifyReply", method=RequestMethod.POST)
	public int modifyReply(ReplyVO replyVO, Principal principal) throws Exception{
		
		int result = 0;
		
		String userId = principal.getName(); //로그인한 정보
		String userInfo = replyService.idCheck(replyVO.getReplyid()); // 글쓴 사람 정보
		
		 if(userId.equals(userInfo)) { // 로그인 정보랑 글쓴 정보가 같으면
			  
			  replyVO.setUserid(userId);
			  replyService.modifyReply(replyVO); //삭제...
			  
			  result = 1;
			 }
		return result;
	}
	
}
