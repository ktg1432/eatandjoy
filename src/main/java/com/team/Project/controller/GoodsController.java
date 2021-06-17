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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
/**
*컨트롤러 여러개 만들어서 쓰는건 이미 servlet-context.xml에서 base-package 설정한것 이하는 다 읽어줌
*대신 리퀘스트 매핑이 똑같은게 들어있으면 오류남 중복제거
*/
@Controller
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*전체상품*/
	@RequestMapping("goods/goods_list")
	public String goods_list(Model model) {
		logger.info("logo image click");
		model.addAttribute("message","메인으로 이동합니다");
		return "goods/goods_list";
	}
}
