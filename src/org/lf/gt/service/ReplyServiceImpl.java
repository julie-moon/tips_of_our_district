package org.lf.gt.service;

import java.util.HashMap;
import java.util.Map;

import org.lf.gt.dao.ReplyDAO;
import org.lf.gt.util.PaginateUtil;
import org.lf.gt.vo.PageVO;

public class ReplyServiceImpl implements ReplyService{
	
	private ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public Map<String, Object> replyInfo(int userNo, int page, String category) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 댓글 목록 
		int rPageNo = page;
		int rNumPage = 10; // 한 페이지에 보여질 게시물 수
		int rNumBlock = 5; // 한 페이지에 보여질 페이징 블록 수
		int rTotal = replyDAO.replyListCountInMyPageMJY(userNo);
		String rUrl = "/ajax/reply/"+userNo+"/page/";
		
		PageVO rPageVO = new PageVO(userNo, category, rPageNo, rNumPage);
		String rPaginate = PaginateUtil.getPaginate(rPageNo, rTotal, rNumPage, rNumPage, rUrl);
		
		map.put("replyList", replyDAO.replyListInMyPageMJY(rPageVO));
		map.put("rPaginate", rPaginate);
		
		return map;
		
	} // replyInfo() end

}
