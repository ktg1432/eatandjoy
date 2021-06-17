package com.team.Project.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.Project.domain.CriteriaProducts;
import com.team.Project.domain.PageDTOProducts;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductCategoryVO;
import com.team.Project.domain.ProductVO;
import com.team.Project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("product_list/*")
@AllArgsConstructor
public class ProductListController {
	
private ProductService service;
	
	@GetMapping("/all")
	public void productAll(CriteriaProducts cri, Model model) {
	log.info("list" + cri);
	model.addAttribute("list", service.getListProducts(cri));
	
	int total = service.getTotalProducts(cri);
	
	log.info("total :" + total);
	
	model.addAttribute("pageMaker", new PageDTOProducts(cri, total));
	
	}
	
	@GetMapping("/price_desc")
	public void productAllPriceDesc(CriteriaProducts cri, Model model) {
	log.info("list" + cri);
	model.addAttribute("list", service.getListProductsDesc(cri));
	
	int total = service.getTotalProducts(cri);
	
	log.info("total :" + total);
	
	model.addAttribute("pageMaker", new PageDTOProducts(cri, total));
	
	}
	
	@GetMapping("/price_asc")
	public void productAllPriceAsc(CriteriaProducts cri, Model model) {
	log.info("list" + cri);
	model.addAttribute("list", service.getListProductsAsc(cri));
	
	int total = service.getTotalProducts(cri);
	
	log.info("total :" + total);
	
	model.addAttribute("pageMaker", new PageDTOProducts(cri, total));
	
	}
	
	@GetMapping("/view")
	public void view(@RequestParam("pId") int pId,
			@ModelAttribute("cri") CriteriaProducts cri, Model model) {
		log.info("get products view");
		service.updateHit(pId);
		model.addAttribute("product", service.get(pId));
		model.addAttribute("img", service.findImgCover(pId));
		
		
	}
	
	
	

}
