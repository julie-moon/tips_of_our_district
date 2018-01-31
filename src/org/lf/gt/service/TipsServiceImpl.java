package org.lf.gt.service;

import org.lf.gt.dao.TipsDAO;

public class TipsServiceImpl implements TipsService{
	
	private TipsDAO tipsDAO;
	
	public void setTipsDAO(TipsDAO tipsDAO) {
		this.tipsDAO = tipsDAO;
	}

}
