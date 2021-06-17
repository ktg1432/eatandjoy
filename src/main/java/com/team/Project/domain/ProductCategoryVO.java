package com.team.Project.domain;

import lombok.Data;

@Data
public class ProductCategoryVO {

	
	private int pCateCode;
	
	private String pCateName;
	
	private int parentCode;
	
	private int level;
}
