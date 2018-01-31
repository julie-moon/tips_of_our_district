package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.Pcategory;

public class PcategoryDAOImpl implements PcategoryDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Pcategory> categoryList(int category) {
		return session.selectList("pcategory.placeCategoryMJY", category);
	}
	
}
