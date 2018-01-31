package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.TagContent;

public class TagContentDAOImpl implements TagContentDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<TagContent> selectPlaceTagListMJY(int no) {
		return session.selectList("tagcontent.placeTagListMJY", no);
	}
	
}
