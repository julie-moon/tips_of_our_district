package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Review;

public class ReviewsDAOImpl implements ReviewsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Review> reviewListMJY(PageVO pageVO) {
		return session.selectList("reviews.reviewListMJY", pageVO);
	}
	
	@Override
	public List<Review> bestReviewListMJY(int no) {
		return session.selectList("reviews.bestReviewListMJY", no);
	}

	@Override
	public int reviewCntNumMJY(int placeNo) {
		return session.selectOne("reviews.reviewCountNumMJY", placeNo);
	}

	@Override
	public Review reviewPicsPopupMJY(int reviewNo) {
		return session.selectOne("reviews.reviewPicsPopupMJY", reviewNo);
	}

	@Override
	public int insertReviews(Review review) {
		return session.insert("reviews.wrireReviewsMJY", review);
	}

	@Override
	public List<Review> reviewListInMyPageMJY(PageVO pageVO) {
		return session.selectList("reviews.reviewListInMyPageMJY", pageVO);
	}

	@Override
	public int reviewListCountInMyPageMJY(int userNo) {
		return session.selectOne("reviews.reviewListCountInMyPageMJY", userNo);
	}

}
