package com.team.Project.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class ProductVO2 {
    private int productId; // 상품번호
    private String productName; // 상품이름
    private int productPrice; // 상품가격
    private String productDesc; // 상품 상세정보
    private String productUrl; // 상품이미지 경로
    private MultipartFile productPhoto; // 상품이미지파일
    // Getter, Setter, toString() 생략
    // ....
}
