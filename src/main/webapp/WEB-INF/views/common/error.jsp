<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
		
		<div class="error-box" style="height: 300px; text-align: center;">
			<h1>해당 페이지는 존재하지 않습니다.</h1>
			<br /><br />
			<p>5초 후 메인페이지로 되돌아갑니다.</p>
		</div>
<script>

setTimeout(function() {
	  location.href = "${pageContext.request.contextPath}/"
	}, 5000);
	
</script>
		
		
		
		
		
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

