package org.lf.gt.service;

import org.lf.gt.dao.RecommandationDAO;

public class RecommandationServiceImpl implements RecommandationService{

	private RecommandationDAO recommandationDAO;
	
	public void setRecommandationDAO(RecommandationDAO recommandationDAO) {
		this.recommandationDAO = recommandationDAO;
	}
	
}
