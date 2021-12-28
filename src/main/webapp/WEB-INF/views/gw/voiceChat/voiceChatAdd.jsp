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
      <h1>화상 채널 추가</h1>
	<form:form name="my-form"
								action="${pageContext.request.contextPath}/group/insertGroup.do?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data" onsubmit ="EnrollFormSubmit();">
								<input type="hidden" name="memberId" value="<sec:authentication property="principal.id"/>"/>
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">그룹명</label>
									<div class="col-md-6 group-text-input">
										<input type="text" id="group-name" class="form-control"
											name="groupName">
									</div>
								</div>


								
								<div class="col-md-6 offset-md-4 group-create-button">
									<button type="submit" class="btn btn-primary">그룹생성</button>
								</div>
							</form:form>
    </div>
  </div>
</div>







<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>