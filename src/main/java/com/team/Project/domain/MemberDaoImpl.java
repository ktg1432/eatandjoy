package com.team.Project.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.team.Project.domain.MemberDao;
import com.team.Project.domain.MemberVO;


import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
public class MemberDaoImpl implements MemberDao {
	
	@Inject SqlSessionTemplate sqlSession;
	
	// 회원 가입
	@Override
	public void insertMember(MemberVO member) {

		log.info("dao insertMember");
		sqlSession.insert("com.team.Project.mapper.MemberMapper.insertMember", member);
	}
	// 아이디 중복 검사
	@Override
	public int isMember(MemberVO member) throws Exception {	
		log.info("dao isMember : " + member.getuId());
		int result = sqlSession.selectOne("com.team.Project.mapper.MemberMapper.isMember", member.getuId());
		return result;
	}
	// 이메일 중복 검사
	@Override
	public int isEnableEmail(MemberVO member) throws Exception {
		log.info("dao isEnableEmail : " + member.getuEmail());
		int result = sqlSession.selectOne("com.team.Project.mapper.MemberMapper.isEnableEmail", member.getuEmail()); 
		return result;
	}
	// 핸드폰번호 중복 검사
	@Override
	public int isEnablePhone(MemberVO member) throws Exception {
		log.info("dao isEnablePhone : " + member.getuPhon());
		int result = sqlSession.selectOne("com.team.Project.mapper.MemberMapper.isEnablePhone", member.getuPhon());
		return result;
	}
	
	@Override
	public MemberVO getMember(String uId) {

		log.info("dao getMember");
		return sqlSession.selectOne("com.team.Project.mapper.MemberMapper.getMember", uId);
	}
	
	@Override
	public void updateMember(MemberVO member) {

		log.info("dao updateMember");
		sqlSession.update("com.team.Project.mapper.MemberMapper.updateMember", member);
	}

	@Override
	public int updatepwd(MemberVO member) {
		log.info("dao updatepwd");
		return sqlSession.update("com.team.Project.mapper.MemberMapper.updatepwd",member);
	}
	
	@Override
	public void setpwd(MemberVO member) {
		log.info("dao setpwd");
		sqlSession.update("com.team.Project.mapper.MemberMapper.setpwd",member);
	}
	
	@Override
	public void changepwd(MemberVO member) {

		log.info("dao changepwd");
		sqlSession.update("com.team.Project.mapper.MemberMapper.modifypwd", member);
	}
//	@Transactional
//	public int deleteMember(MemberVO member) {
//
//		log.info("dao deleteMember");
//		return sqlSession.delete("com.team.Project.mapper.MemberMapper.deleteMember", member);
//	}
//	
//	@Override
//	public boolean isEnablePhone(String uId, String uPhon) {
//		
//		log.info("dao isEnablePhone");
//		
//		Map<String, String> map = new HashMap<>();
//		map.put("memberId", uId);
//		map.put("phone", uPhon);
//		
//		return (int)sqlSession.selectOne("com.team.Project.mapper.MemberMapper.isEnablePhoneUpdate", map) == 1 ? true : false;
//	}
//
//	@Override
//	public List<MemberVO> getAllMembers() {
//		log.info("dao.getAllMembers");
//		return sqlSession.selectList("com.team.Project.mapper.MemberMapper.getAllMembers");
//	}

	/*@Override
	public List<MemberVO> getMembersByPaging(int page, int limit) {
		log.info("dao.getMembersByPaging");
		PageDTO pageDto = new PageDTO();
		pageDto.setPage(page);
		pageDto.setLimit(limit);
		return sqlSession.selectList("mapper.MemberMapper.getMembersByPaging", pageDto);
	}*/

//	@Override
//	public int getCountAllMembers() {
//		log.info("dao getCountAllMembers");
//		return sqlSession.selectOne("com.team.Project.mapper.MemberMapper.getCountAllMembers");
//	}
	
}