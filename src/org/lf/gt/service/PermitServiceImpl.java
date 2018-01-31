package org.lf.gt.service;

import org.lf.gt.dao.PermitDAO;

public class PermitServiceImpl implements PermitService{

	private PermitDAO permitDAO;
	
	public void setPermitDAO(PermitDAO permitDAO) {
		this.permitDAO = permitDAO;
	}
	
}
