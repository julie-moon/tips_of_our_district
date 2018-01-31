package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Reply;

public class ReplyDAOImpl implements ReplyDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Reply> replyListInMyPageMJY(PageVO pageVO) {
		return session.selectList("reply.replyListInMyPageMJY", pageVO);
	}

	@Override
	public int replyListCountInMyPageMJY(int userNo) {
		return session.selectOne("reply.replyListCountInMyPageMJY", userNo);
	}
	
}
