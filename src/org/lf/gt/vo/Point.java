package org.lf.gt.vo;

import java.sql.Timestamp;

public class Point {
	
	/* 포인트 타입 */
	public static final String INSERT_PLACE = "1";
	public static final String WRITE_TEXT = "2";
	public static final String REVIEW = "3";
	public static final String ATTENDANCE = "4";
	public static final String RATING = "5";
	public static final String WRITE_REPLY = "6";
	public static final String RECOMMANDATION = "7";
	public static final String DELETE_PLACE = "11";
	public static final String DELETE_TEXT = "12";
	public static final String DELETE_REVIEW = "13";
	public static final String DELETE_REPLY = "14";
	public static final String OPPOSITE = "15";
	
	private int no, value, userNo;
	private Timestamp time;
	private String type;
	
	public Point() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
