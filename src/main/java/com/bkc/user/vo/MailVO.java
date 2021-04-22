package com.bkc.user.vo;

import java.util.Date;

public class MailVO {
	private String mailId;
	private String mailPw;
	private String userName;
	private String mailUrl;
	private int mailPort;
	private Date delYn;

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public String getMailPw() {
		return mailPw;
	}

	public void setMailPw(String mailPw) {
		this.mailPw = mailPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMailUrl() {
		return mailUrl;
	}

	public void setMailUrl(String mailUrl) {
		this.mailUrl = mailUrl;
	}

	public int getMailPort() {
		return mailPort;
	}

	public void setMailPort(int mailPort) {
		this.mailPort = mailPort;
	}

	public Date getDelYn() {
		return delYn;
	}

	public void setDelYn(Date delYn) { this.delYn = delYn; }

}
