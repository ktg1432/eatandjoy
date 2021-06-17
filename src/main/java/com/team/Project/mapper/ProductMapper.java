package com.team.Project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.Project.domain.ProductVO;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.CriteriaMain;
import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.ProductCategoryVO;

public interface ProductMapper {
	
	
	public List <ProductVO> getList();
	
	public List <ProductVO> getListWithPaging(Criteria cri);
	
	public List <ProductVO> getListMainBest(CriteriaMain cri);
	
	public List <ProductVO> getListMainNew(CriteriaMain cri);
	
	public List <ProductVO> getListWithPagingProducts(CriteriaProducts cri);

	public List <ProductVO> getListWithPagingProductsBest(@Param("pCateCode") String pCateCode, 
														  @Param("skipCount") int skipCount,
														  @Param("amount") int amount);
	
	public List <ProductVO> getListWithPagingProductsNew(@Param("pCateCode") String pCateCode, 
														 @Param("skipCount") int skipCount,
														 @Param("amount") int amount);
	
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);
	
	public ProductVO read(int pId);
	
	public int delete(int pId);
	
	public int update(ProductVO product);
	
	public int updateHit(int pId);
	
	public int getTotalCount(Criteria cri);
	
	public int getTotalCountProducts(CriteriaProducts cri);
	
	public int getTotalCountCategory(@Param("pCateCode") String pCateCode, @Param("cri") CriteriaProducts cri);
	
	public List<ProductCategoryVO> category();
}
