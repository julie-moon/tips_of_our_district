package org.lf.gt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.lf.gt.dao.PcategoryDAO;
import org.lf.gt.dao.PlacesDAO;
import org.lf.gt.dao.RecommandationDAO;
import org.lf.gt.dao.ReviewPhotoDAO;
import org.lf.gt.dao.ReviewsDAO;
import org.lf.gt.dao.TagContentDAO;
import org.lf.gt.dao.UsersDAO;
import org.lf.gt.util.PaginateUtil;
import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Place;
import org.lf.gt.vo.Review;

public class PlacesServiceImpl implements PlacesService{
	
	private PlacesDAO placesDAO;
	private TagContentDAO contentDAO;
	private PcategoryDAO pCategoryDAO;
	private UsersDAO usersDAO;
	private ReviewsDAO reviewsDAO;
	private ReviewPhotoDAO reviewPhotoDAO;
	private RecommandationDAO recommandationDAO;
	
	public void setContentDAO(TagContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}
	
	public void setPlacesDAO(PlacesDAO placesDAO) {
		this.placesDAO = placesDAO;
	}
	
	public void setpCategoryDAO(PcategoryDAO pCategoryDAO) {
		this.pCategoryDAO = pCategoryDAO;
	}
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setReviewPhotoDAO(ReviewPhotoDAO reviewPhotoDAO) {
		this.reviewPhotoDAO = reviewPhotoDAO;
	}
	
	public void setRecommandationDAO(RecommandationDAO recommandationDAO) {
		this.recommandationDAO = recommandationDAO;
	}
	
	
	@Override
	public Map<String, Object> placeInfo(int no, int page, String type) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 해당 꿀플 정보 
		map.put("place", placesDAO.selectPlaceMJY(no));
		
		// 해당 태그 리스트
		map.put("tagList", contentDAO.selectPlaceTagListMJY(no));
		
		// 카테고리 번호 
		int category = placesDAO.selectPlaceMJY(no).getCategory();
		// System.out.println("카테고리 번호 : " + categoryNum);
		map.put("categories", pCategoryDAO.categoryList(category));
		
		// 유저 번호
		int userNo = placesDAO.selectPlaceMJY(no).getUserNo();
		// System.out.println("유저 번호 : " + userNo);
		// 꿀플 등록자 정보
		map.put("user", usersDAO.selectUserMJY(userNo));
		// 꿀플 등록자가 등록한 꿀플 개수
		map.put("count", placesDAO.countRegisteredPlacesMJY(userNo));
			
		// 리뷰 리스트
		int pageNo = page;
		int numPage = 5; // 한 페이지에 보여질 게시물 수
		int numBlock = 5; // 한 페이지에 보여질 페이징 블록 수
		int total = reviewsDAO.reviewCntNumMJY(no); // 전체 게시물 수 
		String url = "/place/"+no+"/new/page/"; // 주소
		
		PageVO pageVO = new PageVO(no, pageNo, numPage, type);
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("reviewList", reviewsDAO.reviewListMJY(pageVO));
		map.put("paginate", paginate);
		
		// 베스트 리뷰 리스트
		map.put("bestReviewList", reviewsDAO.bestReviewListMJY(no));
		
		return map;
		
	} // placeInfo() end

	@Override
	public Map<String, Object> evaluatedPlaceInfo(int userNo, int page) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 꿀단지 리스트
		int pageNo = page;
		int numPage = 10; // 한 페이지에 보여질 게시물 수
		int numBlock = 5; // 한 페이지에 보여질 페이징 블록 수
		int total = placesDAO.evaluatedPlaceCountNumMJY(userNo);
		String url = "/ajax/ePlace/"+userNo+"/page/";
		
		PageVO pageVO = new PageVO(userNo, pageNo, numPage);
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("evaluatedPlaceList", placesDAO.evaluatedPlaceListMJY(pageVO));
		map.put("paginate", paginate);
		
		return map;
		
	} // evaluatedPlaceInfo() end

}
