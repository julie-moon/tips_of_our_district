package org.lf.gt.service;

import org.lf.gt.dao.RatesDAO;

public class RatesServiceImpl implements RatesService{

	private RatesDAO ratesDAO;
	
	public void setRatesDAO(RatesDAO ratesDAO) {
		this.ratesDAO = ratesDAO;
	}
	
}
