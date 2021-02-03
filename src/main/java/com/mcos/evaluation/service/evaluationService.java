package com.mcos.evaluation.service;

import java.util.List;

import com.mcos.community.common.Search;
import com.mcos.evaluation.domain.EvaluationVO;

public interface evaluationService {
	
	public void register(EvaluationVO evalVO)throws Exception;
	
	public EvaluationVO read(int evalid)throws Exception;
	
	public void remove(int evalid)throws Exception;
	
	public List<EvaluationVO> listAll(Search search)throws Exception;
	
	public int evalListCnt(Search search)throws Exception;
}
