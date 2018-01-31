package org.lf.gt.dao;

import java.util.List;

import org.lf.gt.vo.PageVO;
import org.lf.gt.vo.Reply;

public interface ReplyDAO {
	
	public List<Reply> replyListInMyPageMJY(PageVO pageVO);
	
	public int replyListCountInMyPageMJY(int userNo);
	
}
