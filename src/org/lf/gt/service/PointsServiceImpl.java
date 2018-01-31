package org.lf.gt.service;

import org.lf.gt.dao.PointsDAO;

public class PointsServiceImpl implements PointsService{

	private PointsDAO pointsDAO;
	
	public void setPointsDAO(PointsDAO pointsDAO) {
		this.pointsDAO = pointsDAO;
	}
	
}
