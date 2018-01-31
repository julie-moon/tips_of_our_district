package org.lf.gt.dao;

import java.util.List;

import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Place;

public interface PlacesDAO {
	
	// 플레이스 상세 정보 페이지 상단 부분
	public Place selectPlaceMJY(int no);
	
	// 플레이스 
	public int countRegisteredPlacesMJY(int userNo);
	
	public List<Place> evaluatedPlaceListMJY(PageVO pageVO);
	
	public int evaluatedPlaceCountNumMJY(int userNo);
	
}
