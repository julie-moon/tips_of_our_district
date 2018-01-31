package org.lf.gt.service;

import org.lf.gt.dao.SearchDAO;

public class SearchServiceImpl implements SearchService{
	
	private SearchDAO searchDAO;
	
	public void setSearchDAO(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}

}
