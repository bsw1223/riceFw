package com.rice.C001.boarddto;

import java.util.Arrays;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {



	private int page;
	private int amount;
	private String[] typeArr;
	private String boCode;
	private String commURL;

	private String boURL;
	private String type;
	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int page, int amount) {
		this.amount = amount;
		this.page = page;
	}
	
	public String getBoCode() {
		return boCode;
	}

	public void setBoCode(String boCode) {
		this.boCode = boCode;
	}

	public String getBoURL() {
		return boURL;
	}

	public void setBoURL(String boURL) {
		this.boURL = boURL;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", amount=" + amount + ", typeArr=" + Arrays.toString(typeArr) + ", boCode="
				+ boCode + ", commURL=" + commURL + ", boURL=" + boURL + ", type=" + type + ", keyword=" + keyword
				+ "]";
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[]{}: type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("page", page)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		
		return builder.toUriString();
	}
	
	public String getCommURL() {
		return commURL;
	}

	public void setCommURL(String commURL) {
		this.commURL = commURL;
	}
}
