package com.team.Project.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;


@Repository
public class CartDAOImpl implements CartDAO {

    @Inject
    SqlSession sqlSession;

    // 1. 장바구니 추가
    @Override
    public void insert(CartVO vo) {
        sqlSession.insert("com.team.Project.mapper.CartMapper.insertCart", vo);
    }
    // 2. 장바구니 목록
    @Override
    public List<CartDTO> listCart(String uId) {
        return sqlSession.selectList("com.team.Project.mapper.CartMapper.listCart", uId);
    }
    // 3. 장바구니 삭제
    @Override
    public void delete(int cartId) {
        sqlSession.delete("com.team.Project.mapper.CartMapper.deleteCart", cartId);
    }
    // 4. 장바구니 수정
    @Override
    public void modifyCart(CartVO vo) {
        sqlSession.update("com.team.Project.mapper.CartMapper.modifyCart", vo);
    }
    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(String uId) {
        sqlSession.selectOne("com.team.Project.mapper.CartMapper.sumMoney", uId);
        return sqlSession.selectOne("com.team.Project.mapper.CartMapper.sumMoney", uId);
    }
    // 6. 장바구니 동일한 상품 레코드 확인
    @Override
    public int countCart(int productId, String uId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("productId", productId);
        map.put("uId", uId);
        return sqlSession.selectOne("com.team.Project.mapper.CartMapper.countCart", map);
    }
    // 7. 장바구니 상품수량 변경
    @Override
    public void updateCart(CartVO vo) {
        sqlSession.update("com.team.Project.mapper.CartMapper.updateCart", vo);
    }
}
	