package com.team.Project.service;

import java.util.List;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductCategoryVO;
import com.team.Project.domain.ProductVO;

public interface ProductService {
	
	public void register(ProductVO product);
	
	public ProductVO get(int pId);
	
	public boolean modify(ProductVO product);
	
	public boolean remove(int pId);
	
	public List<ProductVO> getList(Criteria cri);
	
	public List<ProductVO> getListProducts(CriteriaProducts cri);
	
	public List<ProductVO> getListProductsDesc(CriteriaProducts cri);
	
	public List<ProductVO> getListProductsAsc(CriteriaProducts cri);
	
	public List<ProductAttachVO> getAttachList(int pId);
	
	public ProductAttachVO findImgCover(int pId);
	
	public int getTotal(Criteria cri);
	
	public int getTotalProducts(CriteriaProducts cri);
	
	public List<ProductCategoryVO> category();
	
	public int updateHit(int pId);
}
