<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
		
<div class="test-board-outter">
  <div class="test-board-title-container">
    <div class="test-board-title">
      <h1>화상 채널 관리</h1>
		${roomList}
    </div>
  </div>
</div>


<script>

</script>




<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>