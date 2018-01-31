package org.lf.gt.dao;

import org.apache.ibatis.session.SqlSession;

public class RecommandationDAOImpl implements RecommandationDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int countHoneyNumMJY(int reviewNo) {
		return session.selectOne("recommandation.countHoneyNumMJY", reviewNo);
	}

	@Override
	public int countVenomNumMJY(int reviewNo) {
		return session.selectOne("recommandation.countVenomNumMJY", reviewNo);
	}

	
}
