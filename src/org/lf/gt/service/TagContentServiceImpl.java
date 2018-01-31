package org.lf.gt.service;

import java.util.List;

import org.lf.gt.dao.TagContentDAO;
import org.lf.gt.vo.TagContent;

public class TagContentServiceImpl implements TagContentService{
	
	private TagContentDAO tagContentDAO;
	
	public void setTagContentDAO(TagContentDAO tagContentDAO) {
		this.tagContentDAO = tagContentDAO;
	}

	@Override
	public List<TagContent> placeTagListMJY(int no) {
		return tagContentDAO.selectPlaceTagListMJY(no);
	}

}
