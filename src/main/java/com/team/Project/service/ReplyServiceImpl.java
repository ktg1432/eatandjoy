package com.team.Project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.ReplyPageDTO;
import com.team.Project.domain.ReplyVO;
import com.team.Project.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register.........." + vo);
		return mapper.insertSelectKey(vo);

	}

	@Override
	public ReplyVO get(int rId) {
		
		log.info("get.........." + rId);
		
		return mapper.read(rId);
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify.........." + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(int rId) {
		
		log.info("remove........" + rId);
		
		return mapper.delete(rId);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int pId) {
		log.info("get Reply List of the product Num :" + pId);
		return mapper.getListWithPaging(cri, pId);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int pId) {
		
		return new ReplyPageDTO(
				
				mapper.getCountByPid(pId),
				mapper.getListWithPaging(cri, pId));
	}

	@Override
	public int updateHit(int rId) {
		log.info("updateHit pId Num : " + rId);
		return mapper.updateHit(rId);
	}

}
