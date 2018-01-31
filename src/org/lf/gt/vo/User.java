package org.lf.gt.vo;

import java.sql.Timestamp;

public class User {
	
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
	/* 성별 */
	public static final String MALE = "M";
	public static final String FEMALE = "F";
	/* 활동 지역 */
	public static final String HOME = "H";
	public static final String COMPANY = "C";
	public static final String SCHOOL = "S";
	/* 활동 기간 */
	public static final String UNDER1 = "A";
	public static final String BETWEEN1_2 = "B";
	public static final String BETWEEN3_5 = "C";
	public static final String OVER5 = "D";
	/* 호칭 */
	public static final String REPLY = "R";
	public static final String TIME = "A";
	public static final String REVIEW = "V";
	public static final String TIP = "W";
	public static final String RECOMMANDATION = "L";
	public static final String PLACE = "P";
	
	private int no, birth, location, lvl, tPoint, point, actTime;
	private String profile, id, pwd, nick, email, sex, area, period, hof; 
	private Timestamp regdate;
	
	public User() {
		
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

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int gettPoint() {
		return tPoint;
	}

	public void settPoint(int tPoint) {
		this.tPoint = tPoint;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getActTime() {
		return actTime;
	}

	public void setActTime(int actTime) {
		this.actTime = actTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getHof() {
		return hof;
	}

	public void setHof(String hof) {
		this.hof = hof;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
