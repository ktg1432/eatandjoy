package com.team.Project.service;

import java.util.List;

import com.team.Project.domain.ProductVO2;


public interface ProductService2 {
	
	List<ProductVO2> listProduct();

	ProductVO2 detailProduct(int productId);

	void updateProduct(ProductVO2 vo);

	void deleteProduct(int productId);


}
