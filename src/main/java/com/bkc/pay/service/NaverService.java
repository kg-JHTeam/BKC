package com.bkc.pay.service;

import org.springframework.stereotype.Service;

import com.google.gson.annotations.SerializedName;

@Service
public class NaverService {
	@SerializedName("name")
	private String name;

	@SerializedName("id")
	private String id;

	@SerializedName("tel")
	private String tel;

	public String getName() {
		return name;
	}

	public String getId() {
		return id;
	}

	public String getTel() {
		return tel;
	}

}
