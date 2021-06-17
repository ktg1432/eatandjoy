/**
 * 
 */
package com.team.Project.domain;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 회원정보 VO(값 객체)
 * 
 * @author javateam
 * @version 1.0
 */
public class MemberDTO {
	
	/** 아이디 */
	private String uId;
	/** 패쓰워드 */
	private String uPwd;
	/** 이름 */
	private String uName;
	/** 이메일 */
	private String uEmail;
	/** 연락처 */
	private String uPhon;
	/** 우편주소*/
	private int uZip;
	/** 주소 */
	private String uAddr;
	/** 상세주소 */
	private String uAddrs;
	/** 가입일 */
	private Date uRegDate;
	/** 생년월일 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uBirth;
	/** 성별 */
	private String uGender;
	/** 이메일 수신동의 */
	private String rEmail;
	/** SMS 수신동의 */
	private String rSMS;
	
	
	/**
	 * 기본 생성자
	 */
	public MemberDTO() {
		
	}
	
	/**
	 * 멤버 필드 초기화 : 생성자
	 * 
	 * @param memberId 아이디
	 * @param memberPassword 패쓰워드
	 * @param memberNickname 별명
	 * @param memberName 이름
	 * @param memberGender 성별
	 * @param memberEmail 이메일
	 * @param memberPhone 연락처
	 * @param memberBirth 생년월일
	 * @param memberZip 우편번호
	 * @param memberAddressBasic 기본주소
	 * @param memberAddressDetail 상세주소
	 * @param memberJoinDate 가입일
	 */

	/**
	 * Map 형태(request.getParameterMap())로 인자를 받는 경우 인자 입력처리 생성자
	 *  
	 * @param map 인자 맵(Map)
	 */
	public MemberDTO(Map<String, String[]> map) throws IllegalAccessException {
		
		System.out.println("인자 입력 처리");
		
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		Field field; // reflection 정보 활용
		
		while (it.hasNext()) {
			
			String fldName = it.next();
			
			if (!fldName.equals("joinSubmitBtn"))  { // 버튼 필드 제외
				
			    try {
			    		// VO(MemberVO)와 1:1 대응되는 필드들 처리 
				    	try {
								field = this.getClass().getDeclaredField(fldName);
								System.out.println(fldName + " : "+field.getName());
								field.setAccessible(true);
								// System.out.println("field : "+field);
								
						} catch (NoSuchFieldException e) {
							
							// 만약 VO와 1:1 대응되지 않는 인자일 경우는 이 부분에서 입력처리합니다.
							System.out.println("인자와 필드가 일치하지 않습니다."); 
							
						} // try
						
				} catch (SecurityException | IllegalArgumentException e) { 
					e.printStackTrace();
				} // try
		    
			} // if
		    
		} // while
		
	} //
		public MemberDTO(MemberVO memberVO) {
		
		this.uId= memberVO.getuId();
		this.uName = memberVO.getuName();
		this.uEmail = memberVO.getuEmail();
		this.uPhon = memberVO.getuPhon();
		
		// 주소 -> 기본주소 + 상세주소 (분리)
		this.uZip = memberVO.getuZip();
		this.uAddr = memberVO.getuAddr();
		this.uAddrs = memberVO.getuAddrs();
		
		this.uRegDate = memberVO.getuRegDate();
		this.uBirth = memberVO.getuBirth();
		this.uGender = memberVO.getuGender();
		this.rEmail = memberVO.getrEmail();
		this.rSMS = memberVO.getrSMS();
	}

	

	public String getuId() {
			return uId;
		}

		public void setuId(String uId) {
			this.uId = uId;
		}

		public String getuPwd() {
			return uPwd;
		}

		public void setuPwd(String uPwd) {
			this.uPwd = uPwd;
		}

		public String getuName() {
			return uName;
		}

		public void setuName(String uName) {
			this.uName = uName;
		}

		public String getuEmail() {
			return uEmail;
		}

		public void setuEmail(String uEmail) {
			this.uEmail = uEmail;
		}

		public String getuPhon() {
			return uPhon;
		}

		public void setuPhon(String uPhon) {
			this.uPhon = uPhon;
		}

		public int getuZip() {
			return uZip;
		}

		public void setuZip(int uZip) {
			this.uZip = uZip;
		}

		public String getuAddr() {
			return uAddr;
		}

		public void setuAddr(String uAddr) {
			this.uAddr = uAddr;
		}
		
		public String getuAddrs() {
			return uAddrs;
		}
		
		public void setuAddrs(String uAddrs) {
			this.uAddrs = uAddrs;
		}

		public Date getuRegDate() {
			return uRegDate;
		}

		public void setuRegDate(Date uRegDate) {
			this.uRegDate = uRegDate;
		}

		public Date getuBirth() {
			return uBirth;
		}

		public void setuBirth(Date uBirth) {
			this.uBirth = uBirth;
		}

		public String getuGender() {
			return uGender;
		}

		public void setuGender(String uGender) {
			this.uGender = uGender;
		}
		
		public String getrEmail() {
			return rEmail;
		}

		public void setrEmail(String rEmail) {
			this.rEmail = rEmail;
		}

		public String getrSMS() {
			return rSMS;
		}

		public void setrSMS(String rSMS) {
			this.rSMS = rSMS;
		}

	@Override
	public String toString() {
		return String.format(
				"MemberVO [uId=%s, uPwd=%s, uName=%s, uEmail=%s, uPhon=%s, uZip=%s, uAddr=%s, uAddrs=%s, uRegDate=%s, uBirth=%YYYY-MM-DD, uGender=%s, rEmail=%s, rSMS=%s]",
				uId, uPwd, uName, uEmail, uPhon, uZip, uAddr, uAddrs, uRegDate, uBirth, uGender, rEmail, rSMS);
	}

	@Override
	public int hashCode() {
		return Objects.hash(uId, uPwd, uName, uEmail, uPhon, uZip, uAddr, uAddrs, uRegDate, uBirth, uGender, rEmail, rSMS);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof MemberDTO)) {
			return false;
		}
		MemberDTO other = (MemberDTO) obj;
		return Objects.equals(uAddr, other.uAddr)
				&& Objects.equals(uAddrs, other.uAddrs)
				&& Objects.equals(uEmail, other.uEmail)
				&& Objects.equals(uId, other.uId)
				&& Objects.equals(uRegDate, other.uRegDate) 
				&& Objects.equals(uName, other.uName)
				&& Objects.equals(uPwd, other.uPwd)
				&& Objects.equals(uPhon, other.uPhon)
				&& Objects.equals(uZip, other.uZip)
				&& Objects.equals(uBirth, other.uBirth)
				&& Objects.equals(uGender, other.uGender)
				&& Objects.equals(rEmail, other.rEmail)
				&& Objects.equals(rSMS, other.rSMS);
	}

}