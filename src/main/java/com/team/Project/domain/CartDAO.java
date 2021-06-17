package com.team.Project.domain;

import java.util.List;

public interface CartDAO {

	void insert(CartVO vo);

	List<CartDTO> listCart(String uId);

	void delete(int cartId);

	void modifyCart(CartVO vo);

	int sumMoney(String uId);

	int countCart(int productId, String uId);

	void updateCart(CartVO vo);


}
