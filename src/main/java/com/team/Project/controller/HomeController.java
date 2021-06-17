package com.team.Project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.Project.domain.CriteriaMain;
import com.team.Project.service.MemberService;
import com.team.Project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

// import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
@AllArgsConstructor
public class HomeController {
	

   
   @Autowired
   MemberService service1;
   
   @Autowired
   ProductService service;
   //로고 클릭시 메인 페이지
   @RequestMapping("/")
   public ModelAndView logo(CriteriaMain cri, Model model) {
      log.info("main");
      ModelAndView mv= new ModelAndView();
      mv.addObject("message","메인으로 이동합니다");
      mv.setViewName("main");
      model.addAttribute("listBest", service.getListMainBest(cri));
      model.addAttribute("listNew", service.getListMainNew(cri));
  	
  	log.info("Criteria  : " + cri);
      
      return mv;
   }
   
   /*@RequestMapping("/main")
   public String main(CriteriaMain cri, Model model) {
	   log.info("main");
	   model.addAttribute("listBest", service.getListMainBest(cri));
	      model.addAttribute("listNew", service.getListMainNew(cri));
	  	
	  	log.info("Criteria  : " + cri);
	      
      //model.addAttribute("message","메인으로 이동합니다");
      return "main";
   }*/
	
	/*@GetMapping("/main")
	public void productAll(CriteriaMain cri, Model model) {
	
	model.addAttribute("listBest", service.getListMainBest(cri));
	
	model.addAttribute("listNew", service.getListMainNew(cri));
	
	log.info("Criteria  : " + cri);
	
	
	}*/
   
   @RequestMapping("/demo")
   public String demo() {
      log.info("demo");
      //model.addAttribute("message","메인으로 이동합니다");
      return "demo";
   }
   
   @RequestMapping("/payment")
   public String purchase() {
      
      return "payment";
   }
   
   @RequestMapping("/region")
   public String region() {
      
      return "region";
   }
   
   @RequestMapping("/login")
   public String login() {
      log.info("login");
      //model.addAttribute("message","메인으로 이동합니다");
      return "/member/login";
   }
   @RequestMapping("/member/login")
   public String perchase01(Model model) {
      log.info("move login page");
      model.addAttribute("message","로그인페이지로 이동");
      return "/member/login";
   }
   
   @RequestMapping(value="/logoutProc", method = RequestMethod.GET)
    public String logout(ModelMap model,
                    HttpServletRequest request,
                    HttpServletResponse response) {
       
       log.info("logout");
       
       Authentication auth 
             = SecurityContextHolder.getContext()
                               .getAuthentication();
       
       log.info("auth : "+auth);
       
       // logout !
       if (auth != null) {    
           new SecurityContextLogoutHandler().logout(request, response, auth);
       }

       return "redirect:/";
    } //
    
    @RequestMapping(value="/loginError", method = RequestMethod.GET)
    // public String loginError(ModelMap model) {
    public String loginError(ModelMap model, HttpSession session) {
       
       // model.addAttribute("error", "true");
       // model.addAttribute("msg", "로그인 정보가 잘못되었습니다.");
       
      // Spring CustomProvider 인증(Auth) 에러 메시지 처리
      Object secuSess = session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
   
      log.info("#### 인증 오류 메시지 : " + secuSess);
      log.info("#### 인증 오류 메시지 : " + secuSess.toString());
   
      model.addAttribute("error", "true");
      // model.addAttribute("msg", "로그인 인증 정보가 잘못되었습니다.");
      model.addAttribute("msg", secuSess);
   
      return "member/login";
    } //
   
   @RequestMapping("/member/cart")
   public String cart(Model model) {
      log.info("move cart page");
      model.addAttribute("message","장바구니로 이동");
      return "member/cart";
   }
   
   @RequestMapping("/member/join")
   public String join(Model model) {
      log.info("move join page");
      model.addAttribute("message","회원가입 페이지로 이동");
      return "member/join";
   }
   

      @RequestMapping("/member/mypage/mypage_main")
   public String mypage(@RequestParam("id") String id,Model model ) throws Exception {
      log.info("move mypage");
      model.addAttribute("memvo",service1.getMember(id));
      log.info("##### model ###### : " + model);
      return "member/mypage/mypage_main";
   }
   
   @RequestMapping("/member/update")
   public String update(@RequestParam("id") String id,Model model) throws Exception {
      log.info("move update");
      model.addAttribute("memvo", service1.getMember(id));
      return "member/update";
   }
   
}