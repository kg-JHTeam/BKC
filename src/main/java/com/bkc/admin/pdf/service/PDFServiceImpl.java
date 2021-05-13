package com.bkc.admin.pdf.service;

import java.io.FileOutputStream;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bkc.delivery.service.OrderService;
import com.bkc.delivery.vo.OrderVO;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class PDFServiceImpl implements PDFService {

	@Inject
	OrderService orderservice;

	PDFService PDFservice;

	@Override
	public int createPdf(String newpdf) {
		int result = 0; // int result를 0으로 초기화 진행.		
		try {
			Document document = new Document(); // pdf문서를 처리하는 객체
			String pdf_user_dir = System.getProperty("user.name"); //user의 이름을 가져옴.(자기자신)
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream("C:/Users/" + pdf_user_dir + "/Downloads/" + newpdf + ".pdf"));
					//"C:/Users/" + pdf_user_dir + "/Downloads/" + newpdf + ".pdf"
					//위치 C에 user에 + 자기자신이름 + donwload위치 + newpdf(입력한파일명) + 확장자 .pdf
			document.open(); // 웹페이지에 접근하는 객체를 연다
			BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,
					BaseFont.EMBEDDED);
			// pdf 한글폰트 처리
			Font font = new Font(baseFont, 10);
			PdfPTable table = new PdfPTable(6); // 4개의 셀을 가진 테이블 객체를 생성 (pdf파일에 나타날 테이블)
			Chunk chunk = new Chunk("BKC 주문현황", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph); // 문단을 만들어서 가운데 정렬
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE); // 줄바꿈

			PdfPCell cell1 = new PdfPCell(new Phrase("주문번호", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)

			PdfPCell cell2 = new PdfPCell(new Phrase("주문시간", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell3 = new PdfPCell(new Phrase("매장명", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell4 = new PdfPCell(new Phrase("아이디", font));
			cell4.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell5 = new PdfPCell(new Phrase("결제타입", font));
			cell5.setHorizontalAlignment(Element.ALIGN_CENTER);

			PdfPCell cell6 = new PdfPCell(new Phrase("총가격", font));

			table.addCell(cell1); // 그리고 테이블에 위에서 생성시킨 셀을 넣는다.
			table.addCell(cell2);
			table.addCell(cell3);
			table.addCell(cell4);
			table.addCell(cell5);
			table.addCell(cell6);

			List<OrderVO> items = orderservice.getAllOrderList(); // 서비스로부터 id값을 매개값으로 주어서 목록을 가져온다.

			for (int i = 0; i < items.size(); i++) {
				OrderVO ordervo = items.get(i); //

				PdfPCell cellProductNum = new PdfPCell(new Phrase("" + ordervo.getOrder_serial(), font));
				// 반복문을 사용해서 상품정보를 하나씩 출력해서 셀에 넣고 테이블에 저장한다.
				PdfPCell cellOrderTime = new PdfPCell(new Phrase("" + ordervo.getOrder_date(), font));
				// Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 앞에 공백("")주어서 String타입으로 변경한다.
				PdfPCell cellStoreName = new PdfPCell(new Phrase("" + ordervo.getStore_name(), font));

				PdfPCell cellUserID = new PdfPCell(new Phrase("" + ordervo.getUserid(), font));

				PdfPCell cellPaymentType = new PdfPCell(new Phrase("" + ordervo.getPayment_type(), font));

				PdfPCell cellTotalPrice = new PdfPCell(new Phrase("" + ordervo.getTotal_price(), font));

				table.addCell(cellProductNum); // 셀의 데이터를 테이블에 저장한다. (장바구니안에 들어있는 갯수만큼 테이블이 만들어진다)
				table.addCell(cellOrderTime);
				table.addCell(cellStoreName);
				table.addCell(cellUserID);
				table.addCell(cellPaymentType);
				table.addCell(cellTotalPrice);

			}
			
			document.add(table); // 웹접근 객체에 table를 저장한다.
			document.close(); // 저장이 끝났으면 document객체를 닫는다.
			
			result = 1;	//pdf에 값입력 성공 result = 1;
		} catch (Exception e) {
			e.printStackTrace();
			result = 0; //pdf에 값입력 실패 result = 0;
		}
		return result; //result를 리턴.
	}

}
