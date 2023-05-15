package com.academy.vo;

import lombok.Data;

@Data
public class PageVO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	
	
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//시작페이지, 마지막페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil(total * 1.0) / cri.getAmount());
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전,, 다음
		this.prev = this.startPage > 1; 
		this.next = this.endPage < realEnd;
	}
}
