package com.team.Project.domain;

import lombok.Data;

@Data
public class ProductCategoryVO {

	
	private String pCateCode;
	
	private String pCateName;
	
	private String parentCode;
	
	private int level;
}
