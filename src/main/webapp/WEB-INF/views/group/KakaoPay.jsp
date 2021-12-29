<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<title>결제 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/76afde4c0b.js" crossorigin="anonymous"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>
<body style="text-align: center;">
 
<h1 style="padding-top: 70px;"> 유료 결제 </h1>
 
<form:form method="POST" action="${pageContext.request.contextPath}/kakao/kakaoPay.do">
	<p>클릭시 결제화면으로 이동합니다.</p>
	<img src="${pageContext.request.contextPath}/resources/upFile/kakao/pointer.png" alt="" width="100px;" />
	<br />
    <img src="${pageContext.request.contextPath}/resources/upFile/kakao/kakao_large.png" alt="" onclick="submit()" style="cursor: pointer;"/>
</form:form>
 
 
</body>
