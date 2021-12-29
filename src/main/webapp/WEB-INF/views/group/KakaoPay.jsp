<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<title>결제 페이지</title>
</head>
<body>
 
<h1> 유료 결제 </h1>
 
<form:form method="POST" action="${pageContext.request.contextPath}/kakao/kakaoPay.do">
    <button>카카오페이로 결제하기</button>
</form:form>
 
 
</body>
