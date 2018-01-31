package org.lf.gt.dao;

import java.util.List;

import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Review;

public interface ReviewsDAO {

	public List<Review> reviewListMJY(PageVO pageVO);
	
	public List<Review> bestReviewListMJY(int no);
	
	public int reviewCntNumMJY(int placeNo);
	
	public Review reviewPicsPopupMJY(int reviewNo);
	
	public int insertReviews(Review review);
	
	public List<Review> reviewListInMyPageMJY(PageVO pageVO);
	
	public int reviewListCountInMyPageMJY(int userNo);
	
}
