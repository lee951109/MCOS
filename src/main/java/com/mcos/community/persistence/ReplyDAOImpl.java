package com.mcos.community.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mcos.community.domain.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static String namespace = "com.mcos.reply.replyMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public void registReply(ReplyVO replyVO) throws Exception {
		session.insert(namespace +".registReply", replyVO);
		
	}
	
	@Override
	public List<ReplyVO> replyList(int comid) throws Exception {
		return session.selectList(namespace + ".replyList", comid);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) throws Exception {
		session.delete(namespace + ".deleteReply", replyVO);
	}

	@Override
	public String idCheck(int replyid) throws Exception {
		return session.selectOne(namespace + ".replyUserIdCheck", replyid);
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		session.update(namespace + ".modifyReply", replyVO);
		
	}
	
	
	

}
