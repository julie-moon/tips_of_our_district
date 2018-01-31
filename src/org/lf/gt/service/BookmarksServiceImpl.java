package org.lf.gt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.lf.gt.dao.BookmarksDAO;
import org.lf.gt.util.PaginateUtil;
import org.lf.gt.vo.Bookmark;
import org.lf.gt.vo.PageVO;

public class BookmarksServiceImpl implements BookmarksService{

	private BookmarksDAO bookmarksDAO;
	
	public void setBookmarksDAO(BookmarksDAO bookmarksDAO) {
		this.bookmarksDAO = bookmarksDAO;
	}

	@Override
	public Map<String, Object> bookmarkInfo(int userNo, int page, String name) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 북마크 꿀플 리스트
		int gpPageNo = page;
		int gpNumPage = 10; // 한 페이지에 보여질 게시물 수
		int gpNumBlock = 5; // 한 페이지에 보여질 페이징 블록 수
		Bookmark bookmark = new Bookmark();
		bookmark.setUserNo(userNo);
		bookmark.setName("%"+name+"%");
		int gpTotal = bookmarksDAO.bookmarkPlaceCountMJY(bookmark); // 전체 게시물 수 
		System.out.println("북마크 꿀플 수 : " + gpTotal);
		String gpUrl = "/ajax/bookmark/place/"+userNo+"/page/"; // 주소 "/user/"+userNo+"/bookmark/place/page/";
		
		// System.out.println(gpUrl);
		
		PageVO gpPageVO = new PageVO("%"+name+"%", userNo, gpPageNo, gpNumPage); /* name */
		String gpPaginate = PaginateUtil.getPaginate(gpPageNo, gpTotal, gpNumPage, gpNumBlock, gpUrl);
		// List<Bookmark> list = bookmarksDAO.bookmarkPlaceListMJY(gpPageVO);
		// System.out.println("bookmarkInfo:"+list);
		map.put("bookmarkPlaceList", bookmarksDAO.bookmarkPlaceListMJY(gpPageVO));
		map.put("gpPaginate", gpPaginate);
		
		// 북마크 꿀팁 리스트
		int gtPageNo = page;
		int gtNumPage = 10;
		int gtNumBlock = 5;
		int gtTotal = bookmarksDAO.bookmarkTipCountMJY(userNo);
		String gtUrl = "/ajax/bookmark/tip/"+userNo+"/page/";
		
		PageVO gtPageVO = new PageVO("%"+name+"%", userNo, gtPageNo, gtNumPage); /*,type*/
		String gtPaginate = PaginateUtil.getPaginate(gtPageNo, gtTotal, gtNumPage, gtNumBlock, gtUrl);
		
		map.put("bookmarkTipList", bookmarksDAO.bookmarkTipListMJY(gtPageVO));
		map.put("gtPaginate", gtPaginate);
		
		return map;
		
	} // bookmarkInfo() end 

	@Override
	public List<Bookmark> bookmarkBeeList(int userNo) {
		// 북마크 꿀벌 리스트
		return bookmarksDAO.bookmarkBeeListMJY(userNo);
	} // bookmarkBeeList() end 
	
}
