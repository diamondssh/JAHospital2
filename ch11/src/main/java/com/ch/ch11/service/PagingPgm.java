package com.ch.ch11.service;

public class PagingPgm {
	private int total;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getRowPerPage() {
		return rowPerPage;
	}
	public void setRowPerPage(int rowPerPage) {
		this.rowPerPage = rowPerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	private int rowPerPage;
	private int currentPage;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int pagePerBlock = 10; 
	public PagingPgm(int total, int rowPerPage, int currentPage) {
		this.total=total; this.currentPage=currentPage; this.rowPerPage=rowPerPage;
		totalPage = (int)Math.ceil((double)total/rowPerPage);
		startPage = currentPage -(currentPage -1) % pagePerBlock;
		endPage=startPage + pagePerBlock -1;
		if(endPage > totalPage) endPage = totalPage;
		
	}

}
