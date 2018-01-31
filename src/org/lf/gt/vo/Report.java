package org.lf.gt.vo;

public class Report {
	/* 신고 타입 */
	public static final String TIP = "T";
	public static final String REPLY = "R";
	public static final String REVIEW = "V";
	
	private int no, content, userNo;
	private String reason, type;
	
	public Report() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getContent() {
		return content;
	}

	public void setContent(int content) {
		this.content = content;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
