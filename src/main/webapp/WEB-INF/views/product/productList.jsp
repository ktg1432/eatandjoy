<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>

</head>
<body>

    <h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${row.productId}
            </td>
            <td>
                <a href="${path}/product/productdetail/${row.productId}">
                    <img src="${path}/images/${row.productUrl}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}/product/productdetail/${row.productId}">${row.productName}</a>
            </td>
            <td>
                <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>