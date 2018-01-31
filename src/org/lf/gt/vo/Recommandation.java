package org.lf.gt.vo;

public class Recommandation {
	
	/* 꿀 / 독 */
	public static final String GGUL = "G";
	public static final String DOK = "D";
	/* 추천 타입 */
	public static final String TIP = "T";
	public static final String REPLY = "R";
	public static final String REVIEW = "V";
	
	private int no, content, userNo;
	private String type, likes;
	
	public Recommandation() {
		
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}
	
}
