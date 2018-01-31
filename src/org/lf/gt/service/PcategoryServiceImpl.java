package org.lf.gt.service;

import org.lf.gt.dao.PcategoryDAO;

public class PcategoryServiceImpl implements PcategoryService{
	
	private PcategoryDAO pCategoryDAO;
	
	public void setpCategoryDAO(PcategoryDAO pCategoryDAO) {
		this.pCategoryDAO = pCategoryDAO;
	}

}
