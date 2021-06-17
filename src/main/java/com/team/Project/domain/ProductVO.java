package com.team.Project.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private int pId;
	private String pName;
	private String pDesc;
	private int pPrice;
	private Date pRegDate;
	private Date pUpdateDate;
	private int pCateCode;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private List<ProductAttachVO> attachList;

	
}
