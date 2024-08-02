package com.avibha.bizcomposer.lead.dto;

public class LeadBoardDto {

	private String searchType;
	private String searchTxt;
	private String orderDate1;
    private String orderDate2;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	public String getOrderDate1() {
		return orderDate1;
	}
	public void setOrderDate1(String orderDate1) {
		this.orderDate1 = orderDate1;
	}
	public String getOrderDate2() {
		return orderDate2;
	}
	public void setOrderDate2(String orderDate2) {
		this.orderDate2 = orderDate2;
	}
}
