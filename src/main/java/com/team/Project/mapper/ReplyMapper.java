package com.team.Project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.Project.domain.Criteria;
import com.team.Project.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insertSelectKey(ReplyVO vo);
	
	public ReplyVO read(int rId);
	
	public int delete(int rId);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("pId") int pId);
	
	public int getCountByPid(int pId);
}
