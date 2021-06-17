package com.team.Project.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(0,10);
	}
	
	public Criteria(int pageNum, int amount) {
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
		
	public String[] getTypeArr() {
		return type ==null? new String[] {}: type.split("");
	}	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
				
				return builder.toUriString();
	}
			
}
