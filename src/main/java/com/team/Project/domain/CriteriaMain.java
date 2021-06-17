package com.team.Project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaMain {
	
	private int pageNum;
	private int amount;
	
	public CriteriaMain() {
		this(0,3);
	}
	
	public CriteriaMain(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getPageNum() {
		if(pageNum == 0) {
			this.pageNum = 1;
		} 
		
		return pageNum ;
	}
	
	public int getSkipCount() {
		return (pageNum -1) * amount;
	}
	
	
	
}
