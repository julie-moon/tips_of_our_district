package org.lf.gt.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Bookmark {
	
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
	/* 북마크 타입 */
	public static final String PLACE = "P";
	public static final String TIP = "T";
	public static final String USER = "U";
	/* 팁 카테고리 */
	public static final String FREE = "F";
	public static final String EVENT = "E";
	public static final String TRAFFIC = "T";
	public static final String LIVING = "L";
	public static final String BABY = "B";
	
	private int no, userNo, content, rating, category, location, hit, lvl, honey, venom, pNo, tNo, uNo;
	private String type, name, addr, cName, title, pic, profile, nick, photo, tCategory;
	private Timestamp regdate;
	
	public Bookmark() {
		
	}
	// @JsonIgnore
	public String getRealCategory() {
		String categoryName = cName;
		if(cName == null) {
			return "";
		} else {
			if(categoryName.startsWith(" > ")) {
				categoryName = categoryName.substring(3, categoryName.length());
			} // if end
			return categoryName;
		} // if ~ else
		// System.out.println(categoryName);		
	} // getRealCategory() end
	
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
	public String getTipCategory() {
		switch(tCategory) {
			case EVENT : return "행사";
			case TRAFFIC : return "교통";
			case LIVING : return "주거시설";
			case BABY : return "육아";
			default : return "자유게시판";
		} // switch() end
	} // getTipCategory() end
	
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

	public int getContent() {
		return content;
	}

	public void setContent(int content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int gettNo() {
		return tNo;
	}
	
	public void settNo(int tNo) {
		this.tNo = tNo;
	}
	
	public int getuNo() {
		return uNo;
	}
	
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	public String gettCategory() {
		return tCategory;
	}
	
	public void settCategory(String tCategory) {
		this.tCategory = tCategory;
	}
	
}
