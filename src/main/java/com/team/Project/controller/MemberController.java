package com.team.Project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.Project.domain.AuthMyBatisDao;
import com.team.Project.domain.MemberDTO;
import com.team.Project.domain.MemberDao;
import com.team.Project.domain.MemberVO;
import com.team.Project.domain.UsersVO;
import com.team.Project.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.log4j.Log4j2;


/**
 * Handles requests for the application home page.
 */
/**
*컨트롤러 여러개 만들어서 쓰는건 이미 servlet-context.xml에서 base-package 설정한것 이하는 다 읽어줌
*대신 리퀘스트 매핑이 똑같은게 들어있으면 오류남 중복제거
*/
@Controller
@Log4j2
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
   
//   @Inject MemberService service;
   
   @Autowired
   private MemberService service;
   
   @Autowired
   private MemberDao dao;
   
   @Autowired
   @Qualifier("authMyBatisService")
   private AuthMyBatisDao svc;
   
   // 아이디 중복 검사
   @ResponseBody
   @RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
   public int isMember(MemberVO member) throws Exception{
      log.info("isMember :" + member.getuId());
      int result = service.isMember(member);
      return result;
   }
   // 이메일 중복 검사
   @ResponseBody
   @RequestMapping(value = "/EmailCheck.do", method = RequestMethod.POST)
   public int isEnableEmail(MemberVO member) throws Exception{
      log.info("isEnableEmail :" + member.getuEmail());
      int result = service.isEnableEmail(member);
      return result;
   }
   // 핸드폰번호 중복 검사
   @ResponseBody
   @RequestMapping(value = "/PhoneCheck.do", method = RequestMethod.POST)
   public int isEnablePhone(MemberVO member) throws Exception{
      log.info("isEnablePhone :" + member.getuPhon());
      int result = service.isEnablePhone(member);
      return result;
   }
   
   @RequestMapping(value = "/getMember.do", method = RequestMethod.POST)
   public String getMember(HttpSession session, Model model) throws Exception{
      String id = (String) session.getAttribute("uId");
      log.info("GetMember : " + id);
      
      MemberVO member = service.getMember(id);
      
      log.info("######member : " + member);
      
      model.addAttribute("memvo",member);
      log.info("get vo : " + member);
      
      return "/member/mypage/mypage_main";
   }

   @RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
   public String updateMember(@ModelAttribute MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception{
      log.info("updateMember Controller : " + member);
      service.updateMember(member);
      rttr.addFlashAttribute("msg", "회원정보 수정 완료");
      return "/";
   }
   
   /* 비밀번호 찾기 */
   @RequestMapping(value = "/updatepwd.do", method = RequestMethod.POST)
   public void updatepwd(@ModelAttribute MemberVO member, HttpSession session) throws Exception{

   }
   
   /* 비밀번호 찾기 */
   @RequestMapping(value = "/findpwd", method = RequestMethod.GET)
   public void findPwGET() throws Exception{
   }

   @RequestMapping(value = "/findpwd", method = RequestMethod.POST)
   public void findPwPOST(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception{
   	service.findpwd(response, member);
   }
   
	@RequestMapping(value="/mypage/modifypwd", method = RequestMethod.POST)
	public String modifypwd(MemberVO member, Model model) throws Exception {
		String vo = member.getuId();
		log.info("vo : " + vo);
		model.addAttribute("memvo", service.getMember(vo));
		log.info("model : " + model);
		service.changepwd(member);
		log.info("vo :" + member);
		
		 String hashedPassword = ""; 
	      BCryptPasswordEncoder passwordEncoder 
	         = new BCryptPasswordEncoder();
	      hashedPassword = passwordEncoder.encode(member.getuPwd());
	      UsersVO user = new UsersVO(member.getuId(),
                  hashedPassword, 1);
	      log.info("hashedPassword : "+hashedPassword);
	      svc.updatetUser(user);
	      log.info("users :" + user);
		return "redirect:/member/login";

	}
  }