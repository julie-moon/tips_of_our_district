package org.lf.gt.vo;

public class PageVO {
	
	private int no, start, end;
	private String type="", name, category;
	
	public PageVO() {
		
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public PageVO(int page, int numPage) {
		end = page * numPage;
		start = end - numPage + 1;
	}
	
	public PageVO(int no, int page, int numPage) {
		this(page, numPage); // 생성자 오버로딩
		this.no = no;
	}
	
	public PageVO(int no, int page, int numPage, String type) {
		this(no, page, numPage);
		/* type이 new일 때, reviews.xml ORDER BY ${type}에 regdate를, 아닐 때 honey를 넣어줌 */
		this.type = type.equals("new")?"regdate":"honey";
	}
	
	public PageVO(String name, int no, int page, int numPage) {
		this(no, page, numPage);
		this.name = name;
	}
	
	public PageVO(int no, String category, int page, int numPage) {
		this(no, page, numPage);
		this.category = category;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
