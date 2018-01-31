package org.lf.gt.vo;

import java.sql.Timestamp;

public class Tip {
	
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
	
	/* 팁 카테고리 */
	public static final String FREE = "F";
	public static final String EVENT = "E";
	public static final String TRAFFIC = "T";
	public static final String LIVING = "L";
	public static final String BABY = "B";
	
	private int no, location, hit, userNo, lvl, honey, venom;
	private String title, content, pic, category, profile, nick;
	private Timestamp regdate;
	
	public Tip() {
		
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
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int getHoney() {
		return honey;
	}

	public void setHoney(int honey) {
		this.honey = honey;
	}

	public int getVenom() {
		return venom;
	}

	public void setVenom(int venom) {
		this.venom = venom;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
}
