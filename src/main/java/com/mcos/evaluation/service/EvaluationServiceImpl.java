package com.mcos.evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcos.community.common.Search;
import com.mcos.evaluation.domain.EvaluationVO;
import com.mcos.evaluation.persistence.EvaluationDAO;

@Service
public class EvaluationServiceImpl implements evaluationService {

	@Autowired
	private EvaluationDAO dao;
	
	@Override
	public void register(EvaluationVO evalVO) throws Exception {
		dao.saveEvaluation(evalVO);

	}

	@Override
	public EvaluationVO read(int evalid) throws Exception {
		return dao.readEvaluation(evalid);
	}

	@Override
	public void remove(int evalid) throws Exception {
		dao.deleteEvaluation(evalid);

	}

	@Override
	public List<EvaluationVO> listAll(Search search) throws Exception {
		return dao.listAll(search);
	}

	@Override
	public int evalListCnt(Search search) throws Exception {
		return dao.evalListCnt(search);
	}


}
