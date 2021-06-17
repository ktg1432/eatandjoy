package com.team.Project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.PageDTO;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.domain.ProductCategoryVO;
import com.team.Project.domain.ProductVO;
import com.team.Project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.sf.json.JSONArray;

@Controller
@Log4j2
@RequestMapping("product/*")
@AllArgsConstructor
public class ProductController {
	
private ProductService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
	log.info("list" + cri);
	model.addAttribute("list", service.getList(cri));
	
	int total = service.getTotal(cri);
	
	log.info("total :" + total);
	
	model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		log.info("get products register");
		
		List<ProductCategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr) {
		log.info("register :" + product);
		
		if(product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==============================================");
		
		service.register(product);
		rttr.addFlashAttribute("result", product.getPId());
		return "redirect:/product/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("pId") int pId, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("product", service.get(pId));
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(int pId){
		log.info("getAttachList" + pId);
		
		return new ResponseEntity<>(service.getAttachList(pId), HttpStatus.OK);
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify :" + product);
		
		if(service.modify(product)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/product/list";
	}
	
	private void deleteFiles(List<ProductAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath()+ "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath()+ "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (IOException e) {
				log.error("delete file error" + e.getMessage());
		
			}// end Catch
		});// end forEach
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pId") int pId, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove :" + pId);
		
		List<ProductAttachVO> attachList = service.getAttachList(pId);
		
		if(service.remove(pId)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/product/list" + cri.getListLink();
	}
	
	
	
	

}
