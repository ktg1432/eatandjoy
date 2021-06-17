package com.team.Project.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.Project.domain.MemberDao;
import com.team.Project.domain.MemberVO;
import com.team.Project.mapper.ProductMapper2;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Inject
    SqlSession sqlSession;

    // 01. 상품목록
   
    public List<ProductVO2> listProduct() {
        return sqlSession.selectList("com.team.Project.mapper.ProductMapper2.listProduct");
    }
    // 02. 상품상세
   
    public ProductVO2 detailProduct(int productId) {
        return sqlSession.selectOne("com.team.Project.mapper.ProductMapper2.detailProduct", productId);
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
	
	