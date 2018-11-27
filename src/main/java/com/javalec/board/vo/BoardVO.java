package com.javalec.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
//	"SEQ" NUMBER(10,0) NOT NULL ENABLE, 일련번호
//	"TITLE" VARCHAR2(20 BYTE), 제목
//	"WRITER" VARCHAR2(20 BYTE), 작성자
//	"CONTENT" VARCHAR2(500 BYTE), 내용
//	"REG_DATE" TIMESTAMP (6), 등록일
//	"CNT" NUMBER(10,0), 조회수
//	"ID" VARCHAR2(20 BYTE), 작성자ID
	
	//필드
	private int seq;
	private String title;
	private String writer;
	private String content;
	private String reg_date;
	private int cnt;
	private String id;
	
	private String fileURL;
	
	//파일 업로드용 필드
	private MultipartFile uploadFile = null;
	
	//생성자
	public BoardVO() {
		this(0, null, null, null, null, 0, null);
	}
	
	public BoardVO(String title, String writer, String content, int cnt, String id) {
		this(0, title, writer, content, null, cnt, id);
	}
	
	public BoardVO(int seq, String title, String writer, String content, String reg_date, int cnt, String id) {
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.reg_date = reg_date;
		this.cnt = cnt;
		this.id = id;
	}

	// getter & setter 메소드
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	public String getFileURL() {
		return fileURL;
	}

	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}

	// toString 메소드
	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", reg_date=" + reg_date + ", cnt=" + cnt + ", id=" + id + "]";
	}
	
	
	
}
