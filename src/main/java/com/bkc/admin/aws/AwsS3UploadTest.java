package com.bkc.admin.aws;

import java.io.File;

public class AwsS3UploadTest {
	public static void main(String[] args) {
		//AwsS3 aws = AwsS3.getInstance();
		
		File file = new File("C:\\img\\log.png");
		String key = "img/mainlogo.png";
		
		//aws.upload(file, key);
	}
}
