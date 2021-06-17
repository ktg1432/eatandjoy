package com.team.Project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.Project.domain.MemberDao;
import com.team.Project.domain.MemberVO;
import com.team.Project.domain.UsersVO;
import com.team.Project.service.MemberService;

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
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MemberService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*주문조회*/
	@RequestMapping("member/mypage/order_list")
	public String order_list(Model model) {
		logger.info("move order_list page");
		return "member/mypage/order_list";
	}
	/*내정보수정*/
	@RequestMapping("member/mypage/mypage_info")
	public String mypage_info(Model model) {
		logger.info("move mypage_info page");
		return "member/mypage/mypage_info";
	}
	/*찜리스트*/
	@RequestMapping("member/mypage/wish_list")
	public String wish_list(Model model) {
		logger.info("move wish_list page");
		return "member/mypage/wish_list";
	}
	/*1대1문의*/
	@RequestMapping("member/mypage/mypage_qa")
	public String mypage_qa(Model model) {
		logger.info("move mypage_qa page");
		return "member/mypage/mypage_qa";
	}
	
	@RequestMapping("member/mypage/changepwd")
	public String changepwd(MemberVO member, Model model) throws Exception {
		log.info("open changepwd");
		return "member/mypage/changepwd";
	}

}
