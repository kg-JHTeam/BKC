package com.bkc.admin.aws;

import java.io.File;
import java.io.InputStream;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsS3 {
	private AmazonS3 s3Client;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "bkcbuc"; // 버킷 명

	private AwsS3() {
		createS3Client();
	}

	// singleton pattern
	static private AwsS3 instance = null;

	public static AwsS3 getInstance() {
		if (instance == null) {
			return new AwsS3();
		} else {
			return instance;
		}
	}

	private void createS3Client() {
		System.out.println("create");
		ClasspathPropertiesFileCredentialsProvider credentialsProvider
			= new ClasspathPropertiesFileCredentialsProvider("config/credentials.properties"); 
		AWSCredentials credentials = credentialsProvider.getCredentials();
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();
	}

	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}

	public void upload(InputStream is, String key, String contentType, long contentLength, String bucket) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		uploadToS3(new PutObjectRequest(bucket, key, is, objectMetadata));
	}

	// PutObjectRequest는 Aws S3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어져있다.
	private void uploadToS3(PutObjectRequest putObjectRequest) {

		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));

		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void copy(String orgKey, String copyKey) {
		try {
			// Copy 객체 생성
			CopyObjectRequest copyObjRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			
			// Copy
			this.s3Client.copyObject(copyObjRequest);

			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));

		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}

	public void delete(String key) {
		try {
			// Delete 객체 생성
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key); // bkc buc

			// Delete
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println(String.format("[%s] deletion complete", key));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
}
