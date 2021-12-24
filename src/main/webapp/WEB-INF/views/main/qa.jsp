﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항" name="title"/>
</jsp:include>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

<div class="container">
<div>
	<h2 class="text-center">문의사항</h2>
	<div class="input-group mb-3 w-25 float-right" style="justify-content: flex-end;">
	<a href="${pageContext.request.contextPath}/main/selectQueListByMemberId.do">
	<sec:authorize access="isAuthenticated()">
	  <button class="btn btn-outline-secondary" type="submit" id="qa-my-qaList" >내가 쓴 글 보기</button>
	  </sec:authorize>
	  </a>
	</div>
</div>
<c:if test="${empty selectList}">
	<table class="table text-center">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th scope="col">카테고리</th>
	      <th class="w-50" scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">날짜</th>
	      <th scope="col">상태</th>
	    </tr>
	  </thead>
	  <tbody>

		
		<c:forEach var="que" items="${list }">
		    <tr>
		      <th scope="row">${que.queNo }</th>
		      <td>${que.queCategory }</td>
		      
		      <td> <a href="${pageContext.request.contextPath }/main/qaDetail.do?queNo=${que.queNo}"> 
		      <c:choose>
		      	<c:when test="${loginMember.id eq que.memberId ||loginMember.authorities eq '[ROLE_ADMIN]'}">
		      		${que.queTitle}
		      	</c:when>
		      	<c:otherwise>
			      <c:choose>
			      	<c:when test="${fn:length(que.queTitle) gt 4 }"> ${fn:substring(que.queTitle,0,4) }
			      		<c:forEach begin="2" end="${fn:length(que.queTitle)}" step="1">*</c:forEach></c:when>
			      	<c:otherwise>
			      		<c:forEach begin="2" end="${fn:length(que.queTitle)}" step="1">*</c:forEach>
			      	</c:otherwise>
			      </c:choose>
		      	</c:otherwise>
		      
		      </c:choose>
		      </a></td>
		      
		      <td>
		      <c:choose>
		      	<c:when test="${id eq que.memberId ||loginMember.authorities eq '[ROLE_ADMIN]'}">
					${que.memberName }		      	
		      	</c:when>
		      	<c:otherwise>
			      ${fn:substring(que.memberName,0,1) } 
			      <c:forEach begin="2" end="${fn:length(que.memberName)}" step="1">*</c:forEach>
		      	</c:otherwise>
		      </c:choose>
			  </td>
		      <td><fmt:formatDate value="${que.regDate }" pattern="yy-MM-dd"/></td>
		      <td>${que.status eq 'N' ? '미답변' : '답변완료' }</td>
		    </tr>
		</c:forEach>
	  </tbody>
	</table>
	</c:if>
	
		<c:if test="${not empty selectList }">
		<table class="table text-center">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th scope="col">카테고리</th>
	      <th class="w-50" scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">날짜</th>
	      <th scope="col">상태</th>
	    </tr>
	  </thead>
	  <tbody>

		
		<c:forEach var="select" items="${selectList}">
		    <tr>
		      <th scope="row">${select.queNo }</th>
		      <td>${select.queCategory }</td>
		      
		      <td> <a href="${pageContext.request.contextPath }/main/qaDetail.do?queNo=${select.queNo}"> 
		      <c:choose>
		      	<c:when test="${loginMember.id eq select.memberId ||loginMember.authorities eq '[ROLE_ADMIN]'}">
		      		${select.queTitle}
		      	</c:when>
		      	<c:otherwise>
			      <c:choose>
			      	<c:when test="${fn:length(select.queTitle) gt 4 }"> ${fn:substring(select.queTitle,0,4) }
			      		<c:forEach begin="2" end="${fn:length(select.queTitle)}" step="1">*</c:forEach></c:when>
			      	<c:otherwise>
			      		<c:forEach begin="2" end="${fn:length(select.queTitle)}" step="1">*</c:forEach>
			      	</c:otherwise>
			      </c:choose>
		      	</c:otherwise>
		      
		      </c:choose>
		      </a></td>
		      
		      <td>
		      <c:choose>
		      	<c:when test="${id eq select.memberId ||loginMember.authorities eq '[ROLE_ADMIN]' }">
					${select.memberName }		      	
		      	</c:when>
		      	<c:otherwise>
			      ${fn:substring(select.memberName,0,1) } 
			      <c:forEach begin="2" end="${fn:length(select.memberName)}" step="1">*</c:forEach>
		      	</c:otherwise>
		      </c:choose>
			  </td>
		      <td><fmt:formatDate value="${select.regDate }" pattern="yy-MM-dd"/></td>
		      <td>${select.status eq 'N' ? '미답변' : '답변완료' }</td>
		    </tr>
		</c:forEach>
	  </tbody>
	</table>
	</c:if>

		

		
		
	
	<button type="button" class="btn btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/main/qaForm.do';">작성하기</button>
	<c:if test="${empty selectList}">${pagebar}</c:if>
	<c:if test="${not empty selectList}"><div class="d-flex" style="height: 30px;"></div></c:if>
	 
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
