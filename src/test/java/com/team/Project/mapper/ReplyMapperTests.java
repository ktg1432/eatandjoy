package com.team.Project.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.ReplyVO;
import com.team.Project.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	
	private int[] pIdArr = {1, 3, 4, 5, 6};
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 100).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			vo.setPId(pIdArr[0]);
			vo.setRTitle("제목" + i);
			vo.setRContent("댓글 테스트" + i);
			vo.setRWriter("댓글작성자" + i);
			mapper.insertSelectKey(vo);
		});
	}
	
	@Test
	public void testRead() {
		int targetRId = 1;
		ReplyVO vo = mapper.read(targetRId);
		
		log.info(vo);
	}
	
	/*@Test
	public void testDelete() {
		int targetrId = 84;
		mapper.delete(targetrId);
	}*/
	
	/*@Test
	public void testUpdate() {
		int targetRId = 1;
		ReplyVO vo = mapper.read(targetRId);
		vo.setRContent("수정된 댓들입니다");
		int count = mapper.update(vo);
		log.info("update count : " + count);
	}*/
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, pIdArr[0]);
		
		replies.forEach(reply -> log.info("get list :" + reply));
	}
	
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(2,10);
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 1);
		
		replies.forEach(reply -> log.info("get list :" + reply));
	}
	
}
