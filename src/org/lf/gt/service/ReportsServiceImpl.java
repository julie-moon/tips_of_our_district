package org.lf.gt.service;

import org.lf.gt.dao.ReportsDAO;

public class ReportsServiceImpl implements ReportsService{
	
	private ReportsDAO reportsDAO;
	
	public void setReportsDAO(ReportsDAO reportsDAO) {
		this.reportsDAO = reportsDAO;
	}

}
