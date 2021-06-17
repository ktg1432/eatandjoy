package com.team.Project.mapper;

import java.util.List;

import com.team.Project.domain.ProductVO2;
import com.team.Project.domain.CartVO;
import com.team.Project.domain.Criteria;

public interface ProductMapper2 {

	List<ProductVO2> listProduct();

	List<CartVO> listCart(String uId);

	ProductVO2 detailProduct(int productId);

	void updateProduct(ProductVO2 vo);

	void deleteProduct(int productId);


}
