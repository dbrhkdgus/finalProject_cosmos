<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
 
카카오페이 결제가 정상적으로 완료되었습니다.
<br/>
결제일시 : ${info.approved_at}<br/>
주문번호 : ${info.partner_order_id}<br/>
상품명 : ${info.item_name}<br/>
상품수량 : ${info.quantity}<br/>
결제금액 : ${info.amount.total}<br/>
결제방법 : ${info.payment_method_type}<br/>

<input type="hidden" id="cInput" value="P"> <input type="button" value="창닫기" onclick="setParentText()">

<script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("pInput").value = document.getElementById("cInput").value;
             window.close();
        }
   </script>
</body>
</html>

