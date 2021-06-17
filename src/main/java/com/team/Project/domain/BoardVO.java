package com.team.Project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int nId;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private Date nRegDate;
	private Date nUpdateDate;
}
