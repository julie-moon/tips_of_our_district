package org.lf.gt.vo;

public class Rate {
	
	/* 꿀 / 독 */
	public static final String GGUL = "G";
	public static final String DOK = "D";
	/* 평가 이유 */
	public static final String TASTE = "1";
	public static final String SERVICE = "2";
	public static final String PRICE = "3";
	public static final String FACILITY = "4";
	public static final String ACCESSIBILITY = "5";
	public static final String SATISFACITON = "6";
	
	private int no, userNo, placeNo;
	private String likes, reason;
	
	public Rate() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
