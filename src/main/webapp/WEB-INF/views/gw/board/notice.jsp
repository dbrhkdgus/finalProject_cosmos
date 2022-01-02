<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
<style>
 tr{cursor:pointer;}
</style>
 <div class="test-notice-outter">
  <div class="test-board-title-container">
    <div class="test-board-title">
    </div>
    <div class="test-board-search">
      <img src="data:image/png;base64,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" alt="">
      <input type="text">
      <input type="button" value="검색">
    </div>
  </div>
  <table class="table table-borderless">
    <tbody>
    <c:forEach var="post" items="${noticePostList}" varStatus="vs">
      <tr onclick="location.href='${pageContext.request.contextPath}/gw/board/boardDetail.do?postNo=${post.postNo}'">
        <td colspan="3">•${post.postTitle}</td>
        <td><span class="text-secondary"><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span></td>
      </tr>
      </c:forEach>
      

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
  	<a href="${pageContext.request.contextPath}/gw/board/boardEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} ">
	    <button class="btn btn-primary me-md-2" type="button">글쓰기</button>
  	</a>
  </div>


  <div class="test-board-pagebar">
	${pagebar }
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

