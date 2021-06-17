package com.team.Project.mapper;

import java.util.List;

import com.team.Project.domain.ProductVO;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.ProductCategoryVO;

public interface ProductMapper {
	
	
	public List <ProductVO> getList();
	
	public List <ProductVO> getListWithPaging(Criteria cri);
	
	public List <ProductVO> getListWithPagingProducts(CriteriaProducts cri);

	public List <ProductVO> getListWithPagingProductsDesc(CriteriaProducts cri);
	
	public List <ProductVO> getListWithPagingProductsAsc(CriteriaProducts cri);
	
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);
	
	public ProductVO read(int pId);
	
	public int delete(int pId);
	
	public int update(ProductVO product);
	
	public int updateHit(int pId);
	
	public int getTotalCount(Criteria cri);
	
	public int getTotalCountProducts(CriteriaProducts cri);
	
	public List<ProductCategoryVO> category();
}
