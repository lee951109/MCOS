package com.mcos.evaluation.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mcos.community.common.Search;
import com.mcos.evaluation.domain.EvaluationVO;

@Repository
public class EvaluationDAOImpl implements EvaluationDAO {

	private static String namespace = "com.mcos.EvaluationMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void saveEvaluation(EvaluationVO vo) throws Exception {				//글 쓰기
		session.insert(namespace + ".saveEvaluation", vo);

	}

	@Override
	public EvaluationVO readEvaluation(int evalid) throws Exception {			//글 상세보기
		return session.selectOne(namespace + ".readEvaluation", evalid);

	}

	@Override
	public void deleteEvaluation(int evalid) throws Exception {					//글 삭제
		session.delete(namespace + ".deleteEvaluation", evalid);

	}

	@Override
	public List<EvaluationVO> listAll(Search search) throws Exception {	//글 목록
		return session.selectList(namespace + ".listAll", search);
	}

	@Override
	public int evalListCnt(Search search) throws Exception {
		return session.selectOne(namespace + ".evalListCnt", search);			//총 게시글 개수 확인
	}



}
