package org.lf.gt.service;

import java.util.List;
import java.util.Map;

import org.lf.gt.vo.Bookmark;
import org.lf.gt.vo.PageVO;

public interface BookmarksService {
	
	public Map<String, Object> bookmarkInfo(int userNo, int page, String name);

	public List<Bookmark> bookmarkBeeList(int userNo, int loginUserNo); 
	
	public boolean executeBeeBookmark(int loginUserNo, int userNo);
	
}
