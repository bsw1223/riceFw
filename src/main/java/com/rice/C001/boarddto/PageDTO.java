package com.rice.C001.boarddto;



public class PageDTO {
	
	private int page;
	private int amount;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public PageDTO() {
		page = 1 ;
		amount = 10 ;
	}
}
