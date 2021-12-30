<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<html xmlns:th="http://www.thymeleaf.org">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/76afde4c0b.js" crossorigin="anonymous"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/upFile/kakao/pay.png" alt="" width="100%" style="margin-top: 30px;margin-bottom: 30px;"/>
 카카오페이 결제가 완료되었습니다.
<br/>
 - 결제일시 : ${info.approved_at}<br/>
 - 주문번호 : ${info.partner_order_id}<br/>
 - 결제상품 : ${info.item_name}<br/>
 - 상품수량 : ${info.quantity} 개<br/>
 - 결제금액 : ${info.amount.total} 원<br/>
 - 결제방법 : 카카오${info.payment_method_type}<br/>
<br />
<input type="hidden" id="cInput" value="P"> <button class="btn btn-warning" type="button" onclick="setParentText()" style="width: 100%; margin-top:50px; text-align: center;">창닫기</button>

<script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("pInput").value = document.getElementById("cInput").value;
             window.close();
        }
   </script>
</body>
</html>

