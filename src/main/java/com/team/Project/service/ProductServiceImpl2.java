package com.team.Project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.Project.domain.ProductVO2;

import com.team.Project.mapper.ProductAttachMapper;
import com.team.Project.mapper.ProductMapper2;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service
public class ProductServiceImpl2 implements ProductService2 {

    @Inject
    ProductDAO productDao;

    // 01. 상품목록

    public List<ProductVO2> listProduct() {
        return productDao.listProduct();
    }
    // 02. 상품상세

    public ProductVO2 detailProduct(int productId) {
        return productDao.detailProduct(productId);
    }
    // 03. 상품수정

    public void updateProduct(ProductVO2 vo) {
        // TODO Auto-generated method stub

    }
    // 04. 상품삭제

    public void deleteProduct(int productId) {
        // TODO Auto-generated method stub

    }

  

}
