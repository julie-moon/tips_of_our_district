package org.lf.gt.dao;

import java.util.List;

import org.lf.gt.vo.Bookmark;
import org.lf.gt.vo.PageVO;

public interface BookmarksDAO {
	
	public List<Bookmark> bookmarkPlaceListMJY(PageVO pageVO);
	
	public int bookmarkPlaceCountMJY(Bookmark bookmark);
	
	public List<Bookmark> bookmarkTipListMJY(PageVO pageVO);
	
	public int bookmarkTipCountMJY(int userNo);
	
	public List<Bookmark> bookmarkBeeListMJY(int userNo);
	
	public int checkBookmark(Bookmark bookmark);
	
	public int deleteBeeMJY(Bookmark bookmark);
	
	public int insertBeeMJY(Bookmark bookmark);
	
}
