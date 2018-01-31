package org.lf.gt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.lf.gt.dao.ReviewPhotoDAO;
import org.lf.gt.dao.ReviewsDAO;
import org.lf.gt.util.PaginateUtil;
import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Review;
import org.lf.gt.vo.ReviewPhoto;

public class ReviewsServiceImpl implements ReviewsService{

	private ReviewsDAO reviewsDAO;
	private ReviewPhotoDAO reviewPhotoDAO;
	
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}
	
	public void setReviewPhotoDAO(ReviewPhotoDAO reviewPhotoDAO) {
		this.reviewPhotoDAO = reviewPhotoDAO;
	}
	
	@Override
	public void writeReviewsMJY(int placeNo, int userNo, List<String> pics, String content) {
		
		Review review = new Review();
		
		review.setUserNo(userNo);
		review.setContent(content);
		review.setPlaceNo(placeNo);
		
		reviewsDAO.insertReviews(review);
		
		for (String pic : pics) {
			
			ReviewPhoto reviewPhoto = new ReviewPhoto();
			reviewPhoto.setPic(pic);
			reviewPhoto.setPlaceNo(placeNo);
			reviewPhoto.setReviewNo(review.getNo());
			
			reviewPhotoDAO.insertPhoto(reviewPhoto);
			
		} // for() end
		
	} // writeReviewsMJY() end
	
	
	
	@Override
	public Map<String, Object> getReviewDetail(int reviewNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<>();
		
		map.put("reviewDetail", reviewsDAO.reviewPicsPopupMJY(reviewNo));
		map.put("photoList", reviewPhotoDAO.reviewPicsListMJY(reviewNo));
		
		return map;
		
	}

	@Override
	public Map<String, Object> reviewInfo(int userNo, int page) {

		Map<String, Object> map = new HashMap<>();
		
		int pageNo = page;
		int numPage = 10; // 한 페이지에 보여질 게시물 수
		int numBlock = 5; // 한 페이지에 보여질 페이징 블록 수
		int total = reviewsDAO.reviewListCountInMyPageMJY(userNo); 
		String url = "/ajax/review/"+userNo+"/page/";
		
		PageVO pageVO = new PageVO(userNo, pageNo, numPage);
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("reviewList", reviewsDAO.reviewListInMyPageMJY(pageVO));
		map.put("paginate", paginate);
		
		return map;
		
	} // reviewInfo() end

}
