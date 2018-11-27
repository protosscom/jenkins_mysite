package com.javalec.board.vo;

public class UsersVO {
	
	//필드 
//	"ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 아이디
//	"PASSWORD" VARCHAR2(20 BYTE), 비밀번호
//	"NAME" VARCHAR2(20 BYTE), 이름
//	"ROLE" VARCHAR2(10 BYTE), 권한
	
	private String id;
	private String password;
	private String name;
	private String role;
	
	//생성자
	public UsersVO() {
		this(null, null, null, null);
	}
	
	public UsersVO(String id, String password, String name, String role) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.role = role;
	}

	//getter setter 메소드
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	//toString 메소드
	@Override
	public String toString() {
		return "UsersVO [id=" + id + ", password=" + password + ", name=" + name + ", role=" + role + "]";
	}
	
	
}
