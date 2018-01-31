package org.lf.gt.dao;

import org.apache.ibatis.session.SqlSession;

public class SearchDAOImpl implements SearchDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
}
