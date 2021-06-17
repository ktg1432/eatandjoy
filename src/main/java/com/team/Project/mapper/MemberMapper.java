package com.team.Project.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.Project.domain.MemberVO;

/**
 * mapper
 * 
 * @author 
 *
 */
public interface MemberMapper {
	
	public void insertMember(MemberVO member);

	public boolean isMember(String uId);
	
	public boolean isEnableEmail(String uEmail);
	
	public boolean isEnablePhone(String uPhon);
	
	public MemberVO getMember(String uId);
	
	public void updateMember(MemberVO member);
	
	public void setpwd(MemberVO member);
	
	public int updatepwd(MemberVO member);
	
	public void modifypwd(MemberVO member);
}