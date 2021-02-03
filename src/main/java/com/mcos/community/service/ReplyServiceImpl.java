package com.mcos.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcos.community.domain.ReplyVO;
import com.mcos.community.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;


	@Override
	public void registReply(ReplyVO replyVO) throws Exception {
		dao.registReply(replyVO);
		
	}
	
	@Override
	public List<ReplyVO> replyList(int comid) throws Exception {
		return dao.replyList(comid);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		dao.deleteReply(replyVO);
		
	}

	@Override
	public String idCheck(int replyid) throws Exception {
		return dao.idCheck(replyid);
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		dao.modifyReply(replyVO);
		
	}


}
