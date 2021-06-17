package com.team.Project.service;

import java.util.List;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.ReplyPageDTO;
import com.team.Project.domain.ReplyVO;

public interface ReplyService {
	
public int register(ReplyVO vo);
	
	public ReplyVO get(int rId);
	
	public int modify(ReplyVO vo);
	
	public int remove(int rId);
	
	public List<ReplyVO> getList(Criteria cri, int pId);
	
	public ReplyPageDTO getListPage(Criteria cri, int pId);
	
	public int getTotal(Criteria cri);
}
