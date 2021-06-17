package com.team.Project.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.team.Project.domain.MemberDTO;
import com.team.Project.domain.MemberVO;

public interface MemberService {
	
	/**
	 * 회원 가입(회원정보 생성) 처리
	 * @param member 회원정보(객체)
	 */
	void insertMember(MemberVO member);
	
	/**
	 * 회원 존재 여부 점검(회원 아이디 중복 점검)
	 * @param id 회원 아이디
	 * @return 회원 존재 여부
	 * @throws Exception 
	 */
	
	int isMember(MemberVO member) throws Exception;
	/**
	 * 이메일 중복 점검
	 * @param email이메일
	 * @return 이메일 중복 여부
	 */
	int isEnableEmail(MemberVO member) throws Exception;
	
	/**
	 * 휴대폰 중복 점검
	 * @param phone 휴대전화 번호
	 * @return 휴대폰 중복 여부
	 */
	int isEnablePhone(MemberVO member) throws Exception;
	
	/**
	 * 개별 회원정보 레코드(튜플) 조회(read)
	 * 
	 * @param memberId 회원 아이디
	 * @return 회원정보
	 * @throws Exception 예외처리
	 */
	public MemberVO getMember(String uId) throws Exception;
	
	
	/**
	 * 개별 회원정보 레코드(튜플) 수정(갱신) (update)
	 * 
	 * @param member 회원정보
	 * @throws Exception 예외처리
	 */
	void updateMember(MemberVO member) throws Exception;

	
	/**
	 * 개별 회원정보 레코드(튜플) 삭제 (delete)
	 * @param response 
	 * 
	 * @param memberId 회원 아이디
	 * @throws Exception 예외처리
	 */

//	public boolean deleteMember(MemberVO member, HttpServletResponse response) throws Exception;
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	//비밀번호찾기
	public void findpwd(HttpServletResponse resp, MemberVO vo) throws Exception;
	
	void changepwd(MemberVO member) throws Exception;
//	/**
//	 * 주어진 회원 아이디의 이메일을 타 회원들과 중복하지 않고 사용가능한지 여부 점검
//	 * 
//	 * usage) 회원 가입/변경시 이메일 중복 점검
//	 * 
//	 * @param memberId 회원 아이디
//	 * @param email 이메일
//	 * @return 이메일 사용가능 여부
//	 * @throws Exception 예외처리
//	 */

//	List<MemberVO> getAllMembers();
//	
//	/**
//	 * 페이징 적용 회원정보 조회
//	 * 
//	 * @param page 현재 페이지
//	 * @param limit 페이지 당 출력 회원정보 수
//	 * @return 회원정보들
//	 */
//	List<MemberVO> getMembersByPaging(int page, int limit);
//	
//	/**
//	 * 전체 회원수 조회(획득)
//	 * 
//	 * @return 전체 회원수
//	 */
//	int getCountAllMembers();
}