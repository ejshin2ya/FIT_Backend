package com.ssafy.dao;

import java.util.Date;

public class videoDTO {
	private String id;
	private String title;
	private String part;
	private String channelName;
	private String url;
	private Date date;
	private int viewPoint;
	
	public videoDTO(String id, String title, String part, String channelName, String url, Date date) {
		this.id = id;
		this.title = title;
		this.part = part;
		this.channelName = channelName;
		this.url = url;
		this.date = new Date();
		this.viewPoint = 0;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public int getViewPoint() {
		return viewPoint;
	}

	public void setViewPoint(int viewPoint) {
		this.viewPoint = viewPoint;
	}
	
	
}
