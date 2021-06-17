package com.team.Project.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.ReplyPageDTO;
import com.team.Project.domain.ReplyVO;
import com.team.Project.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/replies/")
@RestController
@Log4j2
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	//댓글 등록
	@PostMapping(value = "/new", 
			consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		log.info("ReplyVO : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1? new ResponseEntity<>("success", HttpStatus.OK)
							   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	//댓글 리스트
	@GetMapping(value = "/pages/{pId}/{page}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("pId") int pId){
		
		log.info("getList...................");
		Criteria cri = new Criteria(page,10);
		
		log.info("get Reply List pId : " +  pId);
		
		log.info("criteria : " + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, pId), HttpStatus.OK);
	}
	
	//댓글 조회
	@GetMapping(value = "/{rId}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(
			@PathVariable("rId") int rId){
		
		log.info("get : " + rId);
		
		return new ResponseEntity<>(service.get(rId), HttpStatus.OK);
	}
	
	//댓글 삭제
	@DeleteMapping(value = "/{rId}",
					produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> remove(
			@PathVariable("rId") int rId){
		
		log.info("remove : " + rId);
		
		return service.remove(rId) == 1? new ResponseEntity<>("success", HttpStatus.OK) 
									   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rId}", 
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("rId") int rId){
		
		vo.setRId(rId);
		
		log.info("rId : " + rId);
		
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1? new ResponseEntity<>("success", HttpStatus.OK) 
				   					  : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
