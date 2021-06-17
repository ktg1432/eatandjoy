package com.team.Project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int rId;
	private int pId;
	
	private String rWriter;
	private String rTitle;
	private String rContent;
	private Date rRegDate;
	private Date rUpdateDate;
	private int rHit;
}
