package org.lf.gt.service;

import org.lf.gt.dao.ReviewPhotoDAO;

public class ReviewPhotoServiceImpl implements ReviewPhotoService{
	
	private ReviewPhotoDAO reviewPhotoDAO;
	
	public void setReviewPhotoDAO(ReviewPhotoDAO reviewPhotoDAO) {
		this.reviewPhotoDAO = reviewPhotoDAO;
	}

}
