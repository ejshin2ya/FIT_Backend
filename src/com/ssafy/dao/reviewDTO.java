package com.ssafy.dao;

import java.util.Date;

public class reviewDTO {
	private int no;
	private String videoId;
	private Date date;
	private String userName;
	private String text;
	private boolean show;
	
	
	
	public reviewDTO(String videoId, String userName, String text) {
		this.no = 0;
		this.videoId = videoId;
		this.date = new Date();
		this.userName = userName;
		this.text = text;
		this.show = true;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean isShow() {
		return show;
	}
	public void setShow(boolean show) {
		this.show = show;
	}
}
