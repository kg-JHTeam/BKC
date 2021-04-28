package com.bkc.admin.board.event.service;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.bkc.admin.aws.AwsS3;
import com.bkc.admin.board.event.dao.AdminEventDAO;
import com.bkc.event.vo.EventVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminEventDAO adEventDao;

	private AwsS3 awss3 = AwsS3.getInstance();

	// 이벤트 목록보기
	@Override
	public List<EventVO> getAdEventList(EventVO event) {
		return adEventDao.getAdEventList(event);
	}

	// 이벤트 상세보기
	@Override
	public EventVO getAdEvent(int seq) {
		return adEventDao.getAdEvent(seq);
	}

	// 이벤트 등록
	@Transactional
	@Override
	public int insertEvent(EventVO event) {
		int result = 0;

		MultipartFile[] files = event.getFiles();

		String[] paths = { "bkc_img/event/thumbnail/", "bkc_img/event/detail/" };
		String bucket = "bkcbuc";
		String pathKey = "";

		try {
			if (files != null) {

				InputStream is = null;
				String key = "";
				String contentType = "";
				long contentLength = 0;

				int count = 0;
				for (MultipartFile file : files) {

					is = file.getInputStream();
					key = file.getOriginalFilename(); 
					contentType = file.getContentType();
					contentLength = file.getSize(); 

					pathKey = paths[count] + key;
					awss3.upload(is, pathKey, contentType, contentLength, bucket);
					String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/" + pathKey;

					if (count == 0) {
						event.setImg_title(filePath);
					} else {
						event.setImage(filePath);
					}
					count++;
					System.out.println(key);
				}
			}

			// 이벤트 키 만들기
			String eventSerial = UUID.randomUUID().toString();
			eventSerial = eventSerial.replace("-", "").substring(0, 6);
			event.setEvent_serial(eventSerial);

			result = adEventDao.insertEventDetail(event);

			if (result > 0) {
				result = adEventDao.insertEvent(event);
			}
		} catch (Exception e) {
			result = -1;
			e.printStackTrace();
		}
		return result;
	}

	// 이벤트 수정
	@Override
	public int updateEvent(EventVO event) {

		int result = 0;

		MultipartFile[] files = event.getFiles();

		String[] paths = { "bkc_img/event/thumbnail/", "bkc_img/event/detail/" };
		String bucket = "bkcbuc";
		String pathKey = "";
		
		EventVO preVO = adEventDao.getAdEvent(event.getSeq());
		String deleteImg = preVO.getImage();
		String deleteImgTit = preVO.getImg_title();

		try {
			if (files != null) {

				InputStream is = null;
				String key = "";
				String contentType = "";
				long contentLength = 0;

				int count = 0;
				for (MultipartFile file : files) {

					is = file.getInputStream();
					key = file.getOriginalFilename(); 
					contentType = file.getContentType(); 
					contentLength = file.getSize(); 


					if(key !=null &&  key.replaceAll("\\p{Z}","").length() > 0) {
						pathKey = paths[count] + key;
						awss3.upload(is, pathKey, contentType, contentLength, bucket);
						String filePath = "https://bkcbuc.s3.ap-northeast-2.amazonaws.com/" + pathKey;
	
						// 배너 이미지
						if (count == 0) {
							event.setImg_title(filePath);
							awss3.delete(deleteImgTit);
						} else {
							event.setImage(filePath);
							awss3.delete(deleteImg);
						}
					}
					
					count++;
				}
			}
 
			result = adEventDao.updateEventDetail(event);
			

			if (result > 0) {
				result = adEventDao.updateEvent(event);
			}
		} catch (Exception e) {
			result = -1;
			e.printStackTrace();
		}
		return result;
	}

	// 이벤트 삭제
	@Override
	public int deleteEvent(EventVO event) {
		return adEventDao.deleteEvent(event);
	}

	// 이벤트 진행중 종료 변경
	@Override
	public int eventStatus(int seq) {
		return adEventDao.eventStatus(seq);
	}

}
