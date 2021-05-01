package com.bkc.event.vo;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	
	private int seq;
	private String event_serial;
	private String event_title;
	private String description;
	private String img_title;
	private String image;
	private String start_date;
	private String end_date;
	private int rn;
	private boolean status;
	MultipartFile[] files;
	

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg_title() {
		return img_title;
	}

	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
	
	public int getSeq() {
		return seq;
	}
	
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public String getEvent_title() {
		return event_title;
	}
	
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getStart_date() {
		return start_date;
	}
	
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	
	public String getEnd_date() {
		return end_date;
	}
	
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	@Override
	public String toString() {
		return "EventVO [seq=" + seq + ", event_title=" + event_title + ", description=" + description + ", img_title="
				+ img_title + ", image=" + image + ", start_date=" + start_date + ", end_date=" + end_date + ", rn="
				+ rn + "]";
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getEvent_serial() {
		return event_serial;
	}

	public void setEvent_serial(String event_serial) {
		this.event_serial = event_serial;
	}

}
