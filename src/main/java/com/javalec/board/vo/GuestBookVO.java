package com.javalec.board.vo;

// 방명록 VO
public class GuestBookVO {
	
//  VO 필드
//---------------------------------------
//	방명록 번호 	NO decimal(10,0) PRIMARY KEY NOT NULL,
//	이름 		NAME varchar2(20),
//	내용	 	CONTENT varchar2(550),
//	비번		PASSWORD varchar2(30),
//	작성날짜	REG_DATE timestamp
	
	private int no;
	private String name;
	private String content;
	private String password;
	private String reg_date;

//  VO 생성자
//---------------------------------------
	public GuestBookVO() {
		this(0,null,null,null,null);
	}
	
	public GuestBookVO(String name, String content, String password) {
		this(0,name,content,password,null);
	}

	public GuestBookVO(int no, String name, String content, String password, String reg_date) {
		this.no = no;
		this.name = name;
		this.content = content;
		this.password = password;
		this.reg_date = reg_date;
	}
	
//  Get & Set 메소드
//---------------------------------------
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

//  toString
//---------------------------------------
	@Override
	public String toString() {
		return "GuestBookVO [no=" + no + ", name=" + name + ", content=" + content + ", password=" + password
				+ ", reg_date=" + reg_date + "]";
	}
	
}
