package com.team.Project.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.ProductVO;
import com.team.Project.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class ProductServiceTest {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Test
	public void getListWithPagingProducts() {
		CriteriaProducts cri = new CriteriaProducts();
		List<ProductVO> products = service.getListProducts(cri);
		
		products.forEach(product -> log.info("get list :" + product));
	}
}
