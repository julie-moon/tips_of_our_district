package org.lf.gt.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Place {
	/* 지역 */
	public static final int GANGNAM = 1;
	public static final int GANGDONG = 2;
	public static final int GANGBUK = 3;
	public static final int GANGSEO = 4;
	public static final int GWANAK = 5;
	public static final int GWANGJIN = 6;
	public static final int GURO = 7;
	public static final int GEUMCHEON = 8;
	public static final int NOWON = 9;
	public static final int DOBONG = 10;
	public static final int DONGDAEMUN = 11;
	public static final int DONGJAK = 12;
	public static final int MAPO = 13;
	public static final int SEODAEMUN = 14;
	public static final int SEOCHO = 15;
	public static final int SEONGDONG = 16;
	public static final int SEONGBUK = 17;
	public static final int SONGPA = 18;
	public static final int YANGCHEON = 19;
	public static final int YEONGDEUNGPO = 20;
	public static final int YONGSAN = 21;
	public static final int EUNPYEONG = 22;
	public static final int JONGNO = 23;
	public static final int JUNG = 24;
	public static final int JUNGNANG = 25;
	/* 플레이스 가격대 */
	public static final String FREE = "1";
	public static final String UNDER1 = "2";
	public static final String BETWEEN1_3 = "3";
	public static final String BETWEEN3_5 = "4";
	public static final String BETWEEN5_7 = "5";
	public static final String BETWEEN7_10 = "6";
	public static final String OVER10 = "7";
	/* 주차 타입 */
	public static final String PARKING_FREE = "F";
	public static final String CHARGE = "C";
	public static final String IMPOSSIBLE = "I";
	
	private int no, location, category, rating, userNo, pNo;
	private String name, addr, lat, lng, bhour, holiday, photo, exp, web, price, parking, rReason, phone1, phone2, phone3, phone, cName;
	private Timestamp regdate;
	
	public Place() {
		
	}

	public String getRealLocation() {
		switch(location) {
			case GANGNAM : return "강남구";
			case GANGDONG : return "강동구";
			case GANGBUK : return "강북구";
			case GANGSEO: return "강서구";
			case GWANAK : return "관악구";
			case GWANGJIN : return "광진구";
			case GURO : return "구로구";
			case GEUMCHEON : return "금천구";
			case NOWON : return "노원구";
			case DOBONG : return "도봉구";
			case DONGDAEMUN : return "동대문구";
			case DONGJAK : return "동작구";
			case MAPO : return "마포구";
			case SEODAEMUN : return "서대문구";
			case SEOCHO : return "서초구";
			case SEONGDONG : return "성동구";
			case SEONGBUK : return "성북구";
			case SONGPA : return "송파구";
			case YANGCHEON : return "양천구";
			case YEONGDEUNGPO : return "영등포구";
			case YONGSAN : return "용산구";
			case EUNPYEONG : return "은평구";
			case JONGNO : return "종로구";
			case JUNG : return "중구";
			case JUNGNANG : return "중랑구";
			default : return "";
		} // switch() end
	} // getRealLocation() end
	
	@JsonIgnore
	public String getRealPrice() {
		// String realPrice = "무료";
		switch(price) {
			case UNDER1 : return "만원 이하";
			case BETWEEN1_3 : return "1 ~ 3만원";
			case BETWEEN3_5 : return "3 ~ 5만원";
			case BETWEEN5_7 : return "5 ~ 7만원";
			case BETWEEN7_10 : return "7 ~ 10만원";
			case OVER10 : return "10만원 이상";
			default : return "무료";
		} // switch() end
		// return realPrice;
	} // getRealPrice() end
	
	@JsonIgnore
	public String getRealParking() {
		switch(parking) {
			case PARKING_FREE : return "무료"; 
			case CHARGE : return "유료";
			default : return "불가능";
		} // switch() end
	} // getRealParking() end
	
	public String getRealPhone() {
		if(phone1 == null && phone2 == null && phone3 == null) {
			phone = null;
		} else if(phone1 == null) {
			phone = phone2+"-"+phone3;
		} else {
			phone = phone1+"-"+phone2+"-"+phone3;
		} // if ~ else end
		return phone;
	} // getRealPhone() end
	
	public String getRealCategory() {
		
		String categoryName = cName;
		
		if(categoryName.startsWith(" > ")) {
			categoryName = categoryName.substring(3, categoryName.length());
		} // if end
		
		// System.out.println(categoryName);
		return categoryName;
		
	} // getRealCategory() end
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getBhour() {
		return bhour;
	}

	public void setBhour(String bhour) {
		this.bhour = bhour;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getrReason() {
		return rReason;
	}

	public void setrReason(String rReason) {
		this.rReason = rReason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}
	
}
