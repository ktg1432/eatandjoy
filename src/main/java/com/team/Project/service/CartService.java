package com.team.Project.service;

import java.util.List;

import com.team.Project.domain.CartDTO;
import com.team.Project.domain.CartVO;

public interface CartService {

	void insertCart(CartVO vo);

	List<CartDTO> listCart(String uId);

	void delete(int cartId);

	void modifyCart(CartVO vo);

	int sumMoney(String uId);

	int countCart(int productId, String uId);

	void updateCart(CartVO vo);



	


}
