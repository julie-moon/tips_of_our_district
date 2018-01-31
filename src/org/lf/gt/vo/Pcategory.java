package org.lf.gt.vo;

public class Pcategory {
	
	/* 꿀플 카테고리 */
	public static final int FACILITY = 1;
	public static final int RESTAURANT = 2;
	public static final int LANDMARK = 3;
	public static final int CONVENIENTSTORE = 11; 
	public static final int BANK = 12;
	public static final int HOSPITAL_PHARMACY = 13;
	public static final int LIVING_COMFORTS = 14;
	public static final int ENTERTAINMENT = 15;
	public static final int SHOPPING = 16;
	public static final int OTHERS = 17;
	public static final int BISTRO = 18;
	public static final int BAKERY_DESSERT = 19;
	public static final int CAFE_COFFEE = 20;
	public static final int PUB = 21;
	public static final int STREET_FOOD = 22;
	public static final int GAS_STATION = 51;
	public static final int CAR_WASH = 52;
	public static final int PARKING_LOT = 53;
	public static final int ACCOMMODATION = 54;
	public static final int LAUNDRY = 55;
	public static final int HAIR_BEAUTY = 56;
	public static final int SAUNA = 57;
	public static final int PET = 58;
	public static final int SPORT_FACILITY = 59;
	public static final int POST_OFFICE = 60;
	public static final int SHOE_MENDING = 61;
	public static final int PRINT_BINDING = 62;
	public static final int CLAW_MACHINE = 63;
	public static final int CLUB = 64;
	public static final int KARAOKE = 65;
	public static final int BILLIARD_HALL = 66;
	public static final int GOLF_COURSE = 67;
	public static final int BOWLING_ALLEY = 68;
	public static final int PC_ROOM = 69;
	public static final int SCREEN_BASEBALL = 70;
	public static final int MULTI_ROOM = 71;
	public static final int THEATER = 72;
	public static final int COMIC_BOOK_STORE = 73;
	public static final int ESCAPE_ROOM = 74;
	
	private int no, parentNo;
	private String name;
	
	public Pcategory() {
		
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
