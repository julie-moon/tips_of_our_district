package org.lf.gt.dao;

import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.Bookmark;
import org.lf.gt.vo.PageVO;

public class BookmarksDAOImpl implements BookmarksDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Bookmark> bookmarkPlaceListMJY(PageVO pageVO) {
		return session.selectList("bookmarks.bookmarkPlaceListMJY", pageVO);
	}

	@Override
	public int bookmarkPlaceCountMJY(Bookmark bookmark) {
		return session.selectOne("bookmarks.bookmarkPlaceCountMJY", bookmark);
	}

	@Override
	public List<Bookmark> bookmarkTipListMJY(PageVO pageVO) {
		return session.selectList("bookmarks.bookmarkTipListMJY", pageVO);
	}

	@Override
	public int bookmarkTipCountMJY(int userNo) {
		return session.selectOne("bookmarks.bookmarkTipCountMJY", userNo);
	}

	@Override
	public List<Bookmark> bookmarkBeeListMJY(int userNo) {
		return session.selectList("bookmarks.bookmarkBeeListMJY", userNo);
	}

	@Override
	public int checkBookmark(Bookmark bookmark) {
		return session.selectOne("bookmarks.checkBookmark", bookmark);
	}
	
}
