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
    
    // security principal.name?????? ?????????. ?????? ????????? ???????????? HttpSession session,
    // 1. ???????????? ??????
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
        // ??????????????? ?????? ????????? ????????? ??????
        int count = cartService.countCart(vo.getProductId(), uId);
        
        if(count == 0){
            // ????????? insert
            cartService.insertCart(vo);
        } else {
            // ????????? update
            cartService.updateCart(vo);
        }
       
       // ?????? ????????????
        List<CartDTO> cartList = cartService.listCart(uId);
        
        model.addAttribute("cartList", cartList);
        return "/cart/list";
    }

    // 2. ???????????? ??????
    @RequestMapping("list.do")
    public ModelAndView list(HttpSession session, ModelAndView mav){
        String uId = (String) session.getAttribute("uId"); // session??? ????????? userId
        Map<String, Object> map = new HashMap<String, Object>();
        List<CartDTO> list = cartService.listCart(uId); // ???????????? ?????? 
        int sumMoney = cartService.sumMoney(uId); // ???????????? ?????? ?????? ??????
        // ???????????? ?????? ????????? ?????? ????????? ??????
        // ?????????(10???????????? => ??????, ?????? => 2500???)
        int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", list);                // ???????????? ????????? map??? ??????
        map.put("count", list.size());        // ???????????? ????????? ??????
        map.put("sumMoney", sumMoney);        // ???????????? ?????? ??????
        map.put("fee", fee);                 // ????????????
        map.put("allSum", sumMoney+fee);    // ?????? ?????? ?????? ??????
        mav.setViewName("shop/cartList");    // view(jsp)??? ?????? ??????
        mav.addObject("map", map);            // map ?????? ??????
        return mav;
    }

    // 3. ???????????? ??????
    @RequestMapping("delete.do")
    public String delete(@RequestParam int cartId){
        cartService.delete(cartId);
        return "/cart/list";
    }

    // 4. ???????????? ??????
    @RequestMapping("update.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] productId, HttpSession session) {
        // session??? id
        String uId = (String) session.getAttribute("uId");
        // ???????????? ?????? ?????? ????????? ??????
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
