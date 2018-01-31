package org.lf.gt.dao;

import org.apache.ibatis.session.SqlSession;

public class PointsDAOImpl implements PointsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
}
