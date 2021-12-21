﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항" name="title"/>
</jsp:include>

<div class="container">
<div>
	<h2 class="text-center">문의사항</h2>
	<div class="input-group mb-3 w-25 float-right">
	  <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
	</div>
</div>
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
		      	<c:when test="${loginMember.memberId eq que.memberId}">
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
		      	<c:when test="${loginMember.memberId eq que.memberId }">
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
	<button type="button" class="btn btn-primary float-right" onclick="location.href='${pageContext.request.contextPath}/main/qaForm.do';">작성하기</button>
	${pagebar}
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
