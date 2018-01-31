package org.lf.gt.dao;

import java.util.List;

import org.lf.gt.vo.ReviewPhoto;

public interface ReviewPhotoDAO {

	/*public int countPhotoNumMJY(ReviewPhoto reviewPhoto);*/
	
	public List<ReviewPhoto> reviewPicsListMJY(int reviewNo);
	
	public int insertPhoto(ReviewPhoto reviewPhoto);
	
}
