package com.rice.C001.boarddto;

public class PageUtil {
	
	private PageDTO dto;
	private int total, start, end;
	private boolean prev, next;
	
	public PageUtil(PageDTO dto, int total) {
		this.dto= dto;
		this.total =total;
		
		
		int pageNum= dto.getPage();
		
		int tempEnd = (int)(Math.ceil(pageNum/ 10.0) * 10);
		//int tempEnd = (int)(Math.ceil(pageNum/ 10.0) * 10);
		//this.start = tempEnd - 9 < 0 ? 1 : tempEnd - 9;
		this.start =  tempEnd - 9 < 0 ? 1 : tempEnd - 9;
		this.prev = this.start != 1;
		int realEnd = (int)(total/10.0);
		//int realEnd = (int)(total/(dto.getAmount()*1.0));
		
		this.next = realEnd > tempEnd;
		
		if(realEnd > tempEnd) {
			this.end = tempEnd;
		}else {
			this.end = realEnd + 1;
		}		
		
	}

	public PageDTO getDto() {
		return dto;
	}

	public int getTotal() {
		return total;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	
}
