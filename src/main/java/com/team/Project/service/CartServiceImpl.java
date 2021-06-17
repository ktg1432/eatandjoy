package com.team.Project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.Project.domain.CartDAO;
import com.team.Project.domain.CartDTO;
import com.team.Project.domain.CartVO;

@Service
public class CartServiceImpl implements CartService {

    @Inject
    CartDAO cartDao;

    // 1. 장바구니 추가
    @Override
    public void insertCart(CartVO vo) {
        cartDao.insert(vo);
    }
    // 2. 장바구니 목록
    @Override
    public List<CartDTO> listCart(String uId) {
        return cartDao.listCart(uId);
    }
    // 3. 장바구니 삭제
    @Override
    public void delete(int cartId) {
        cartDao.delete(cartId);
    }
    // 4. 장바구니 수정
    @Override
    public void modifyCart(CartVO vo) {
        cartDao.modifyCart(vo);
    }
    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(String uId) {
        return cartDao.sumMoney(uId);
    }
    // 6. 장바구니 상품 확인
    @Override
    public int countCart(int productId, String uId) {
        return cartDao.countCart(productId, uId);
    }
    // 7. 장바구니 상품 수량 변경
    @Override
    public void updateCart(CartVO vo) {
        cartDao.updateCart(vo);
    }
}