package com.team.Project.mapper;

import java.util.List;

import com.team.Project.domain.BoardVO;
import com.team.Project.domain.Criteria;

public interface BoardMapper {
	
	/*@Select("select * from tbl_notice where nId > 0")*/
	public List <BoardVO> getList();
	
	public List <BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(int nId);
	
	public int delete(int nId);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
}
