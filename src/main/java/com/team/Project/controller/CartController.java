package com.team.Project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import net.coobird.thumbnailator.Thumbnailator;

import com.team.Project.domain.BoardVO;
import com.team.Project.domain.CartDTO;
import com.team.Project.domain.CartVO;
import com.team.Project.domain.Criteria;
import com.team.Project.domain.CustomUserVO;
import com.team.Project.domain.PageDTO;
import com.team.Project.domain.ProductAttachVO;
import com.team.Project.service.BoardService;
import com.team.Project.service.CartService;
import com.team.Project.service.ProductService;
import com.team.Project.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Controller
@RequestMapping("/cart")
public class CartController {

    @Inject
    CartService cartService;
    
    // security principal.name으로 받는다. 일반 로그인 방식에서 HttpSession session,
    // 1. 장바구니 추가
    @RequestMapping("/insert")
    public String insert(@ModelAttribute CartVO vo,  Model model){
    	
    	Authentication auth 
    	= SecurityContextHolder.getContext()
    						   .getAuthentication();

    	log.info("auth : "+auth.getPrincipal());
    	
    	CustomUserVO customVO = (CustomUserVO)auth.getPrincipal();
    	
    	log.info("customVO" + customVO);
    	
        //String uId = (String) session.getAttribute("uId");
    	String uId = customVO.getUsername();
        log.info("uid :" + uId);
        log.info("vo :" + vo);
        vo.setUId(uId);
        // 장바구니에 기존 상품이 있는지 검사
        int count = cartService.countCart(vo.getProductId(), uId);
        
        if(count == 0){
            // 없으면 insert
            cartService.insertCart(vo);
        } else {
            // 있으면 update
            cartService.updateCart(vo);
        }
       
       // 개별 카트정보
        List<CartDTO> cartList = cartService.listCart(uId);
        
        model.addAttribute("cartList", cartList);
        return "/cart/list";
    }

    // 2. 장바구니 목록
    @RequestMapping("list.do")
    public ModelAndView list(HttpSession session, ModelAndView mav){
        String uId = (String) session.getAttribute("uId"); // session에 저장된 userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = cartService.listCart(uId); // 장바구니 정보 
        int sumMoney = cartService.sumMoney(uId); // 장바구니 전체 금액 호출
        // 장바구니 전체 긍액에 따라 배송비 구분
        // 배송료(10만원이상 => 무료, 미만 => 2500원)
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // 장바구니 정보를 map에 저장
        map.put("count", list.size());        // 장바구니 상품의 유무
        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
        map.put("fee", fee);                 // 배송금액
        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
        mav.setViewName("shop/cartList");    // view(jsp)의 이름 저장
        mav.addObject("map", map);            // map 변수 저장
        return mav;
    }

    // 3. 장바구니 삭제
    @RequestMapping("delete.do")
    public String delete(@RequestParam int cartId){
        cartService.delete(cartId);
        return "/cart/list";
    }

    // 4. 장바구니 수정
    @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) {
        // session의 id
        String uId = (String) session.getAttribute("uId");
        // 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i<productId.length; i++){
            CartVO vo = new CartVO();
            vo.setUId(uId);
            vo.setAmount(amount[i]);
            vo.setProductId(productId[i]);
            cartService.modifyCart(vo);
        }

        return "/cart/list";
    }
}
