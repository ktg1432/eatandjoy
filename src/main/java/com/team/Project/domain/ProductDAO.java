package com.team.Project.domain;

import java.util.List;

public interface ProductDAO {

	public List<ProductVO2> listProduct();
	
	public ProductVO2 detailProduct(int productId);
	
	public void updateProduct(ProductVO2 vo);
	
	public void deleteProduct(int productId);


}
