package com.team.Project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.Project.domain.ProductVO;
import com.team.Project.mapper.ProductAttachMapper;
import com.team.Project.mapper.ProductMapper;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.CriteriaMain;
import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductCategoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(ProductVO product) {
		
		log.info("register...." + product);
		
		mapper.insertSelectKey(product);
		
		if(product.getAttachList()== null || product.getAttachList().size() <=0) {
			return;
		}
		product.getAttachList().forEach(attach ->{
			attach.setPId(product.getPId());
			attachMapper.insert(attach);
		});
	}
	

	@Override
	public ProductVO get(int pId) {
		log.info("get......." + pId);
		return mapper.read(pId);
	}

	@Override
	public boolean modify(ProductVO product) {
		log.info("modify....." + product);
		
		attachMapper.deleteAll(product.getPId());
		
		boolean modifyResult = mapper.update(product) == 1;
		
		if(modifyResult && product.getAttachList() != null && product.getAttachList().size() > 0) {
			product.getAttachList().forEach(attach -> {
					attach.setPId(product.getPId());
					attachMapper.insert(attach);
			});		
			
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(int pId) {
		log.info("delete....." + pId);
		attachMapper.deleteAll(pId);
		return mapper.delete(pId) == 1;
	}

	@Override
	public List<ProductVO> getList(Criteria cri) {
		
		log.info("getList.........with criteria/" + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getTotalByCategory(String pCateCode, CriteriaProducts cri) {
		log.info("get total count");
		return mapper.getTotalCountCategory(pCateCode, cri);
	}

	@Override
	public List<ProductAttachVO> getAttachList(int pId) {
		log.info("get Attach list by pId :" + pId);
		return attachMapper.findByPId(pId);
	}


	@Override
	public List<ProductCategoryVO> category() {
		// TODO Auto-generated method stub
		return mapper.category();
	}


	@Override
	public int getTotalProducts(CriteriaProducts cri) {
		log.info("get total count");
		return mapper.getTotalCountProducts(cri);
	}


	@Override
	public List<ProductVO> getListProducts(CriteriaProducts cri) {
		log.info("getList.........with criteria/" + cri);
		
		return mapper.getListWithPagingProducts(cri);
	}


	@Override
	public ProductAttachVO findImgCover(int pId) {
		log.info("get Attach Cover Image by pId :" + pId);
		return attachMapper.findImgCover(pId);
	}


	@Override
	public List<ProductVO> getListProductsBest(String pCateCode, int skipCount, int amount) {
		log.info("getListBest.........with criteria/" + skipCount + amount);
		return mapper.getListWithPagingProductsBest(pCateCode, skipCount, amount);
	}


	@Override
	public List<ProductVO> getListProductsNew(String pCateCode, int skipCount, int amount) {
		log.info("getListNew.........with criteria/" + skipCount + amount);
		return mapper.getListWithPagingProductsNew(pCateCode, skipCount, amount);
	}


	@Override
	public int updateHit(int pId) {
		log.info("updateHit pId Num : " + pId);
		return mapper.updateHit(pId);
	}


	@Override
	public List<ProductVO> getListMainBest(CriteriaMain cri) {
		log.info("getListMainBest.........with criteria/" + cri);
		return mapper.getListMainBest(cri);
	}


	@Override
	public List<ProductVO> getListMainNew(CriteriaMain cri) {
		log.info("getListMainNew.........with criteria/" + cri);
		return mapper.getListMainNew(cri);
	}


	

}
