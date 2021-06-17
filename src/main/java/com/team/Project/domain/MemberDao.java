/**
 * 
 */
package com.team.Project.domain;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.team.Project.domain.MemberVO;


public interface MemberDao {
	
	
	/**
	 * 회원 가입 처리
	 * @param member 회원정보
	 */
	void insertMember(MemberVO member);
	
	/**
	 * 회원 존재 여부 점검(회원 아이디 중복 점검)
	 * @param id 회원 아이디
	 * @return 회원 존재 여부
	 */
	int isMember(MemberVO member) throws Exception;
	
	/**
	 * 이메일 중복 점검
	 * @param email 이메일
	 * @return 이메일 중복 점검 여부
	 */
	int isEnableEmail(MemberVO member) throws Exception;
	
	/**
	 * 휴대폰 중복 점검
	 * @param phone
	 * @return 휴대폰 중복 점검 여부
	 */
	int isEnablePhone(MemberVO member) throws Exception;
	
	/**
	 * 개별 회원정보 레코드(튜플) 조회(read)
	 * 
	 * @param memberId 회원 아이디
	 * @return 회원정보
	 * @throws Exception 예외처리
	 */
	public MemberVO getMember(String uId);	
	
	/**
	 * 개별 회원정보 레코드(튜플) 수정(갱신) (update)
	 * 
	 * @param member 회원정보
	 * @throws Exception 예외처리
	 */
	void updateMember(MemberVO member);
	
	/**
	 * 개별 회원정보 레코드(튜플) 삭제 (delete)
	 * 
	 * @param memberId 회원 아이디
	 * @throws Exception 예외처리
	 */

//	public int deleteMember(MemberVO member);
	/**
	 * 비밀번호 찾기(findpwd)
	 * 
	 * @param member
	 * @throws Exception
	 */
	
	// 비밀번호 변경
	public int updatepwd(MemberVO vo) throws Exception;

	public void setpwd(MemberVO vo) throws Exception;
	
	public void changepwd(MemberVO vo) throws Exception;
//	
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
//	boolean isEnableEmail(String memberId, String email);
//	
//	/**
//	 * 연락처가 타 회원들과 중복하지 않고 사용가능한지 여부 점검
//	 * 
//	 * usage) 회원 수정  연락처 중복 점검
//	 * 
//	 * @param memberId 회원 아이디
//	 * @param phone 연락처
//	 * @return 연락처 사용가능 여부
//	 * @throws Exception 예외처리
//	 */
//	boolean isEnablePhone(String memberId, String phone);
//	
//	/**
//	 * 전체 회원정보 조회
//	 * 
//	 * @return 전체 회원정보(리스트)
//	 */
//	List<MemberVO> getAllMembers();
	
	/**
	 * 페이징 적용 회원정보 조회
	 * 
	 * @param page 현재 페이지
	 * @param limit 페이지 당 출력 회원정보 수
	 * @return 회원정보들
	 */
	/*List<MemberVO> getMembersByPaging(int page, int limit);*/
	
	/**
	 * 전체 회원수 조회(획득)
	 * 
	 * @return 전체 회원수
	 */
//	int getCountAllMembers();
	
}