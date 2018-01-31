package org.lf.gt.service;

import java.util.List;
import java.util.Map;

import org.lf.gt.vo.Review;
import org.lf.gt.vo.ReviewPhoto;

public interface ReviewsService {
	
	public Map<String, Object> getReviewDetail(int reviewNo);
	
	public void writeReviewsMJY(int placeNo, int userNo, List<String> pics, String reviewContent);
	
	public Map<String, Object> reviewInfo(int userNo, int page);
	
}
