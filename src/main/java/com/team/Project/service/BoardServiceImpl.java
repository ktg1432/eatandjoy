package com.team.Project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.Project.domain.BoardVO;
import com.team.Project.domain.Criteria;
import com.team.Project.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register...." + board);
		
		mapper.insertSelectKey(board);

	}

	@Override
	public BoardVO get(int nId) {
		log.info("get......." + nId);
		return mapper.read(nId);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify....." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int nId) {
		log.info("delete....." + nId);
		return mapper.delete(nId) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("getList.........with criteria/" + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
