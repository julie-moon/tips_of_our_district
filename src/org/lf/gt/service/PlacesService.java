package org.lf.gt.service;

import java.util.Map;

import org.lf.gt.vo.Place;
import org.lf.gt.vo.Review;

public interface PlacesService {

	// pDetail 꿀플 상세정보
	public Map<String, Object> placeInfo(int no, int page, String type);
	
	public Map<String, Object> evaluatedPlaceInfo(int userNo, int page);
	
}
