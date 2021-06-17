 
package com.team.Project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
// import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.Project.service.AuthJdbcService;
import com.team.Project.service.MemberService;
import com.team.Project.domain.AuthMyBatisDao;
import com.team.Project.domain.CustomUserVO;
import com.team.Project.domain.MemberDao;
import com.team.Project.domain.UsersVO;
import com.team.Project.domain.MemberVO;
import lombok.extern.log4j.Log4j2;
 
@Controller
@Log4j2
@RequestMapping("/member")
public class AuthController {
   
   @Inject MemberService service;
   
   @Autowired
   private AuthJdbcService authJdbcService;
   
   @Autowired
   @Qualifier("authMyBatisService")
   private AuthMyBatisDao svc;
   
   @Autowired
   private MemberDao memberDao;
   
   @RequestMapping("/joinAction")
   public String join(/*@RequestParam("username") String username,*/
                 /* @RequestParam("password") String password,*/
                  MemberVO memberVO,
                  Model model) {
      
      log.info("join Action");
      String path = "redirect:/member/login";
      
      log.info("VO : " + memberVO);
      
      String hashedPassword = ""; 
      BCryptPasswordEncoder passwordEncoder 
         = new BCryptPasswordEncoder();
      hashedPassword = passwordEncoder.encode(memberVO.getuPwd());

      log.info("hashedPassword : "+hashedPassword);
      
      UsersVO users = new UsersVO(memberVO.getuId(),
                        hashedPassword, 1);
      
      // authJdbcService.insertUsers(users, "ROLE_USER");
      memberDao.insertMember(memberVO);
      svc.insertUsers(users);
      
      try {
            svc.insertUserRoles(memberVO.getuId(), "ROLE_USER");
      } catch (Exception e) {
         log.error("db 에러 발생 : " + e.getMessage());
         model.addAttribute("db_error", e.getMessage());
         path = "/error/db-err";
      } 
      
      return path;
   } // 
   
   @RequestMapping(value = "/welcome", 
               method = RequestMethod.GET)
   public ModelAndView defaultPage() {
   
      log.info("welcome");
      
      ModelAndView model = new ModelAndView();
      model.addObject("title", "Spring Security Password Encoder");
      model.addObject("message", "This is default page!");
      model.setViewName("welcome");
      return model;
   } //
    
    @RequestMapping(value="/helloworld", 
                method = RequestMethod.GET)
    public String helloWorld(ModelMap model) {
       
       log.info("hellowWolrd");
       
       model.addAttribute("message", "Welcome to the Hello World page");
       return "helloworld";
    }
    
    @RequestMapping(value= {"/admin/home", "/admin"}, 
               method = RequestMethod.GET)
   public String securedAdminHome(ModelMap model) {
   
       log.info("/admin/home");
       
      Object principal = SecurityContextHolder.getContext()
                                    .getAuthentication()
                                    .getPrincipal();
      
      CustomUserVO user = null;
      
      if (principal instanceof CustomUserVO) {
         user = ((CustomUserVO)principal);
      }
      
      log.info("user : " +user);
      
      String name = user.getUsername();
      model.addAttribute("username", name);
      model.addAttribute("message", "관리자 페이지에 들어오셨습니다.");
      
      return "/admin/home";
    }
    
    @RequestMapping(value= {"/secured/home", "/secured"}, 
                method = RequestMethod.GET)
    public String securedHome(ModelMap model) {
       
       log.info("/secured/home");
       
        Object principal = SecurityContextHolder.getContext()
                                      .getAuthentication()
                                      .getPrincipal();
        
        CustomUserVO user = null;
        
        if (principal instanceof CustomUserVO) {
           user = ((CustomUserVO)principal);
        }
        
        log.info("user : "+user);
     
       String name = user.getUsername();
       model.addAttribute("username", name);
       model.addAttribute("message", "일반 사용자 페이지에 들어오셨습니다.");
       
       return "/secured/home";
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

       return "/";
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
    
/*   
    @RequestMapping("/access-denied")
    public String accessDenied() {
       
       log.info("403");
       
       return "redirect:/login";
    }
*/
    
   
 
} //