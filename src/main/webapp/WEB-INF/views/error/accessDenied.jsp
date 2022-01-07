<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
	<div style="height: 52vh; " class="d-flex align-items-center" >
		<h1 class="text-center my-auto" style="font-size:100px; margin:auto;">No! 접근권한이 없습니다.</h1>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

