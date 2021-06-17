package com.team.Project.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class CartVO {
	
	private String uId;
	
	private int cartId;
	
	private int productId;
	
	private int amount;
}
