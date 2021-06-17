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
public class CartDTO {
	
	private int cartId;
	private String uId;
	private int productId;
	private String uName;
	private String productName;
	private int amount;
	private int productPrice;
	private int money;
	/*private int sumMoney;
	private int countCart;
	private int fee;*/
}
