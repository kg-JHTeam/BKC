package com.bkc.admin.aws;

import java.io.File;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsS3 {
	   // Amazon-s3-sdk
	   private AmazonS3 s3Client;
	   final private String accessKey = "-"; // 액세스키
	   final private String secretkey = "-"; // 스크릿 엑세스 키

	   private Regions clientRegion = Regions.AP_NORTHEAST_2; // 한국
	   private String bucket = "-"; // 버킷 명

	   private AwsS3() {
	      createS3Client();
	   }

	   // singleton 으로 구현
	   static private AwsS3 instance = null;

	   public static AwsS3 getInstance() {
	      if (instance == null) {
	         return new AwsS3();
	      } else {
	         return instance;
	      }
	   }

	   // aws S3 client 생성
	   private void createS3Client() {
	      AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretkey);
	      this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
	            .withRegion(clientRegion).build();
	   }

	   // upload 메서드 | 단일 파일 업로드
	   public void upload(File file, String key) {
	      uploadToS3(new PutObjectRequest(this.bucket, key, file));
	   }

	   // upload 메서드 | MultipartFile을 사용할 경우
	   public void upload(File file, String key, String contentType, long contentLength) {
	      ObjectMetadata objectMetadata = new ObjectMetadata();
	      objectMetadata.setContentType(contentType);
	   }

	   // PutObjectRequest는 Aws s3 버킷에 업로드할 객체 메타 데이터와 파일 데이터로 이루어져 있다.
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


	   // 복사 메서드
	   public void copy(String orgkey, String copyKey) {
	      try {
	         // copy 객체 생성
	         CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgkey, this.bucket, copyKey);

	         // copy
	         this.s3Client.copyObject(copyObjectRequest);

	         System.out.printf(String.format("Finish copying [%s] to [%s]"), orgkey, copyKey);
	      } catch (AmazonServiceException e) {
	         e.printStackTrace();
	      } catch (SdkClientException e) {
	         e.printStackTrace();
	      }
	   }

	   // 삭제 메서드
	   public void delete(String key) {
	      try {
	         // Delete 객체 생성
	         DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);

	         // Delete
	         this.s3Client.deleteObject(deleteObjectRequest);

	         System.out.printf(String.format("[%s] delete key"), key);
	      } catch (AmazonServiceException e) {
	         e.printStackTrace();
	      } catch (SdkClientException e) {
	         e.printStackTrace();
	      }
	   }
}