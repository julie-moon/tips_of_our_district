package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.ReviewPhoto;

public class ReviewPhotoDAOImpl implements ReviewPhotoDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	/*
	@Override
	public int countPhotoNumMJY(ReviewPhoto reviewPhoto) {
		return session.selectOne("reviewphoto.countPhotoNumMJY", reviewPhoto);
	}
	*/
	@Override
	public List<ReviewPhoto> reviewPicsListMJY(int reviewNo) {
		return session.selectList("reviewphoto.reviewPicsListMJY", reviewNo);
	}
	@Override
	public int insertPhoto(ReviewPhoto reviewPhoto) {
		return session.insert("reviewphoto.insertPhotoMJY", reviewPhoto);
	}

	
}
