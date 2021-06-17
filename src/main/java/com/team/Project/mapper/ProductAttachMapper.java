package com.team.Project.mapper;

import java.util.List;

import com.team.Project.domain.ProductAttachVO;

public interface ProductAttachMapper {
	
	public void insert(ProductAttachVO vo);
	
	public void delete(String uuid);
	
	public List<ProductAttachVO> findByPId(int pId);
	
	public ProductAttachVO findImgCover(int pId);
	
	public void deleteAll(int pId);
	
	public List<ProductAttachVO> getOldFiles();
}
