package com.mcos.community.service;

import java.util.List;

import com.mcos.community.domain.ReplyVO;

public interface ReplyService {
	
	//댓글 작성
	public void registReply(ReplyVO replyVO) throws Exception;
	
	//댓글 리스트
	public List<ReplyVO> replyList(int comid) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO replyVO) throws Exception;
	
	//아이디 체크
	public String idCheck(int replyid) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO replyVO) throws Exception;
	
	

}
