package com.bkc.customerService.vo;

public class PageMaker {

	private int totalPage; // 전체 페이지 수
	private int nowPage;   // 현재 페이지
	private int oneBlockCount;  // 1블럭당 페이지를 몇개 줄지...설정
	private int onPageRows  = 10;  // 한페이지당 몇개의 데이터를 보여줄지 설정
	private int totalRows;  // 전체 데이터 개수
	private int nowBlock;  // 현재 블럭
	private int totalBlock; // 전체 블럭 수

	
	public int getBeginPage(){
		return nowPage * onPageRows + 1;
	}
	
	public int getEndPage(int startNum){
		return startNum + onPageRows-1;
	}
	
	public PageMaker(int nowPage, int totalRows){
		this.nowPage = nowPage;
		this.totalRows  = totalRows;
		this.oneBlockCount = 5;
		
	}
	
	/**
     * 페이지의 시작레코드번호
     * 현재 페이지 * 페이지당 출력할 레코드 수 ★
     * 1 Page = 0 * 10 --> 1
     * 2 Page = 1 * 10 --> 11
     * 3 Page = 2 * 20 --> 21
	 * @return
	 */
	
	
	public String getPager(){		
		totalPage  = totalPage();
		nowBlock = nowBlock();
		totalBlock = totalBlock(totalPage);
		
		int page  = 0;
		
		StringBuffer sb = new StringBuffer();
		
		if(totalRows > 0){
			   sb.append("<li class='page-item'><a class='page-link' href=\"javascript:void(0);\"  ");
			   sb.append("onclick=\"goPaging(0);\""); 
			   sb.append(">이전</a></li>");           
	           
			   // 현재 나열된 페이지가 11페이지 이상일 경우
	            // 이전 10페이지 출력
	            // 0 Block:  1~10 page 
	            // 1 Block: 11~20 page 
	            if(nowBlock > 0){
	            	page  =  ((nowBlock-1)*oneBlockCount);
	            	 //이전 10개 링크, 이전 블럭으로 이동
	            	sb.append("<li class='page-item'><a class='page-link' href=\"javascript:void(0);\"  ");
	            	sb.append("onclick=\"goPaging("+page+");\""); 
	            	sb.append(">Previous</a></li>");      
	            }	            
	            
	            // 페이지 목록 출력
	            for (int i = 0; i < oneBlockCount; i++) {	
	            	
	            	page =  ((nowBlock*oneBlockCount) + i);
	                if(page == nowPage){
	                	page = (nowBlock * oneBlockCount)+i;
	                	
	                	sb.append("<li class='page-item active'><a class='page-link' href=\"javascript:void(0);\"   ");
		               	sb.append("onclick=\"goPaging("+page+");\">"); 
	                    sb.append(""+(page  + 1)+"</a></li>");
	                    
	                }else{
	                	sb.append("<li class='page-item'><a class='page-link' href=\"javascript:void(0);\"   ");
		               	sb.append("onclick=\"goPaging("+page+", "+nowPage+");\">"); 
	                    sb.append((page + 1)+"</a></li>");
	                    nowPage=page;
	                }
	                
	                
	                //마지막 페이지이면 페이지 번호 출력을 종료
	                if ((nowBlock * oneBlockCount) + i + 1 == totalPage) break;
	            }
	            
	            
	            
	            // 다음 10개 출력
	            if ( nowBlock + 1 < totalBlock) {
	            	
	            	page = (nowBlock + 1) * oneBlockCount;
	            	
	                // 다음 블럭으로 이동 링크
	            	sb.append("<li class='page-item'><a class='page-link' href=\"javascript:void(0);\"   ");
	             	sb.append("onclick=\"goPaging("+page+");\"");  // (1+1)*10
	                sb.append(">Next "+oneBlockCount+"</a></li>");
	            }
	            
	         	sb.append("<li class='page-item'><a class='page-link'  href=\"javascript:void(0);\"   ");
	        	sb.append("onclick=\"goPaging("+(totalPage - 1)+");\"");
	        	sb.append(">다음</a>");   
		}
		
		
		return sb.toString();
	}

	
	  /**
     * 전체 페이지수 산출, 하나의 페이지는 레코드가 1개 있어도 하나의 
     * 페이지로 처리되어야 합니다. 따라서 0.1을 1로 자리올림합니다.<br>
     * 레코드 1개: 0.1 --> 1로 올림<br>
     * 레코드 11개: 1.1 --> 2로 올림<br>
     * @return
     */
    public int totalPage(){
        
        double totalCount = (double)totalRows; // 정수형을 double로 변환
        System.out.println(totalCount);
        
        // 10.1 --> 11.0, numPerPage: 페이지당 레코드 수 
        double retVal = Math.ceil( totalCount / this.onPageRows); 
       
        System.out.println("페이지당 레코드수:"+retVal);
        
        return (int)retVal;  // 소수점 짤라버림, 11   
    }
	
	 public int nowBlock(){
	        double retVal = ((double)this.nowPage) / this.oneBlockCount;
	        // 현재 블럭 = 현제 페이지/ 블러당 페이지 수
	        return (int)(retVal);            
	    }
	 
	    
	 public int totalBlock(int totalPage){
		 double _totalPage = (double)totalPage;
		 double retVal = Math.ceil(_totalPage / this.oneBlockCount);
		 System.out.println("토탈 블럭 :"+retVal);
		 return (int)(retVal);       
		}

	}
