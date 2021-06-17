package com.team.Project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import net.coobird.thumbnailator.Thumbnailator;

import com.team.Project.domain.BoardVO;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.PageDTO;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductVO2;
import com.team.Project.service.BoardService;
import com.team.Project.service.ProductService2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("product/*")
@AllArgsConstructor
public class ProductController2 {

	private ProductService2 service;

	// 1. 상품 전체 목록
	@RequestMapping("/productList")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/product/productList");
		mav.addObject("list", service.listProduct());
		return mav;
	}

	// 2. 상품 상세보기
	@RequestMapping("/productdetail/{productId}")
	public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav) {
		mav.setViewName("/product/productDetail");
		mav.addObject("vo", service.detailProduct(productId));
		log.info("vo :" + service.detailProduct(productId));
		return mav;
	}

}
