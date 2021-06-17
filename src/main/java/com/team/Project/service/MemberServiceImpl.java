package com.team.Project.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.Project.domain.MemberDao;
import com.team.Project.domain.MemberVO;
import com.team.Project.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Autowired
	MemberDao dao;
	
	// 회원 가입
	@Transactional(readOnly=true) 
	@Override
	public void insertMember(MemberVO member) {
		
		log.info("register...." + member);
		dao.insertMember(member);
	//	mapper.insertMember(member);
	

	}
	// 아이디 중복 검사
	@Override
//	public boolean isMember(String uId) {
	public int isMember(MemberVO member) throws Exception {
		log.info("isMember : " + member.getuId());
		int result = dao.isMember(member);
		return result;
	}
	// 이메일 중복 검사
	@Override
	public int isEnableEmail(MemberVO member) throws Exception {
		
		log.info("isEnableEmail : " + member.getuEmail());
		int result = dao.isEnableEmail(member);
		return result;
	}
	// 핸드폰번호 중복 검사
	@Override
	public int isEnablePhone(MemberVO member) throws Exception {
		
		log.info("isEnablePhone : " + member.getuPhon());
		int result = dao.isEnablePhone(member);
		return result;
	}
	@Override
	public MemberVO getMember(String uId) {
		log.info("GetMember");
		MemberVO vo = dao.getMember(uId);
		
		return vo;		
	}

	@Override
	public void updateMember(MemberVO member) {
		log.info("MemberUpdate : " + member.getuId());
		dao.updateMember(member);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "gd32project@gmail.com";
		String hostSMTPpwd = "goodee1!";
		String SMPTPort = "587";
		Boolean ssl = false;
		

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "gd32project@gmail.com";
		String fromName = "gd32project";
		String subject = "";
		String msg = "";

		if(div.equals("findpwd")) {
			subject = "잇앤조이 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getuId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getuPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getuEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			
			email.setDebug(true);
			email.setSSL(ssl);
			email.setSmtpPort(587);
			email.setSslSmtpPort(SMPTPort);
			email.setCharset(charSet);
			email.setHostName(hostSMTP);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findpwd(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		log.info("vo : " + vo);
		log.info("vo : " + vo.getuId());
		MemberVO ck = dao.getMember(vo.getuId());
		PrintWriter out = response.getWriter();
		log.info("ck : " +  ck);
		// 가입된 아이디가 없으면
		if(dao.getMember(vo.getuId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getuEmail().equals(ck.getuEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setuPwd(pw);
			// 비밀번호 변경
			dao.updatepwd(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	@Override
	public void changepwd(MemberVO member) throws Exception {
		log.info("vo : " + member);
		log.info("chagnepwd : " + member.getuId());
		log.info("pwd : " + member.getuPwd());
		dao.changepwd(member);
	}
//
//	@Override
//	public boolean isEnableEmail(String memberId, String email) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean isEnablePhone(String memberId, String phone) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public List<MemberVO> getAllMembers() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<MemberVO> getMembersByPaging(int page, int limit) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int getCountAllMembers() {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
