package org.lf.gt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Place;

public class PlacesDAOImpl implements PlacesDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 플레이스 상세 정보 페이지 상단 부분
	@Override
	public Place selectPlaceMJY(int no) {
		return session.selectOne("places.selectPlaceMJY", no);
	} // selectPlaceMJY() end

	@Override
	public int countRegisteredPlacesMJY(int userNo) {
		return session.selectOne("places.countRegisteredPlacesByUserMJY", userNo);
	}

	@Override
	public List<Place> evaluatedPlaceListMJY(PageVO pageVO) {
		return session.selectList("places.evaluatedPlaceListMJY", pageVO);
	}

	@Override
	public int evaluatedPlaceCountNumMJY(int userNo) {
		return session.selectOne("places.evaluatedPlaceCountNumMJY", userNo);
	}

}
