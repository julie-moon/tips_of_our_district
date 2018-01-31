package org.lf.gt.service;

import org.lf.gt.dao.TagsDAO;

public class TagsServiceImpl implements TagsService{
	
	private TagsDAO tagsDAO;
	
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

}
