package com.team.Project.service;

import java.util.List;

import com.team.Project.domain.BoardVO;
import com.team.Project.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);
	
	public BoardVO get(int nId);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int nId);
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}
