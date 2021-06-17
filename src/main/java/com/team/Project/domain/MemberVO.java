package com.team.Project.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * 회원정보 VO(값 객체)
 * 
 * @author javateam
 * @version 1.0
 */

public class MemberVO {
	
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
	

	
	public MemberVO() {}
	
	/**
	 * DTO -> VO 치환
	 * @param memberDTO
	 */
	public MemberVO(MemberDTO memberDTO) {
		this.uId=memberDTO.getuId();
		this.uPwd = memberDTO.getuPwd();
		this.uName = memberDTO.getuName();
		this.uEmail = memberDTO.getuEmail();
		this.uPhon = memberDTO.getuPhon();
		this.uZip = memberDTO.getuZip();
		this.uAddr = memberDTO.getuAddr();
		this.uRegDate = memberDTO.getuRegDate();
		this.uBirth = memberDTO.getuBirth();
		this.uGender = memberDTO.getuGender();
		this.rEmail = memberDTO.getrEmail();
		this.rSMS = memberDTO.getrSMS();
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
		return "MemberVO [uId=" + uId + ", uPwd=" + uPwd + ", uName=" + uName + ", uEmail=" + uEmail + ", uPhon="
				+ uPhon + ", uZip=" + uZip + ", uAddr=" + uAddr + ", uAddrs=" + uAddrs + ", uRegDate=" + uRegDate
				+ ", uBirth=" + uBirth + ", uGender=" + uGender + ", rEmail=" + rEmail + ", rSMS=" + rSMS + "]";
	}

	
}