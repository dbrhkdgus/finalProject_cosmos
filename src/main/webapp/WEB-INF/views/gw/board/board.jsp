<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<style>
 tr{cursor:pointer;}
</style>
 <div class="test-notice-outter">
	<div class="test-board-title-container">
	 <div class="test-board-title">
	</div> 
	<form action="${pageContext.request.contextPath}/gw/board/board.do?boardNo=${boardNo}&groupNo=${groupNo}" method="get">
	    <div class="test-board-search">
	    	 <select name="searchType" class="form-select search-select" aria-label="Default select example">
		        <option value="all" ${searchType == 'all' ? "selected":'' }> 전체보기 </option>
		        <option value="title" ${searchType == 'title' ? "selected":'' }>제목</option>
		        <option value="writer" ${searchType == 'writer' ? "selected":'' }>작성자</option>
		        <option value="date" ${searchType == 'date' ? "selected":'' }>날짜</option>
		     </select>
		     
		   <div class="input-group mb-3 search-input">
		      <input type="text" class="form-control" name="searchKeyword" value="${searchKeyword }" placeholder="검색어를 입력하세요"  aria-describedby="button-addon2">
		   		<button class="btn btn-outline-secondary" type="button" id="button-addon2" >검색</button>
		   </div>   
		</div>       
    </form>
    </div>

  <table class="table file-board-table">
    <thead>
      <tr>
        <th>No</th>
        <th colspan="2">제목</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${boardPostList}" varStatus="vs">
      <tr onclick="location.href='${pageContext.request.contextPath}/gw/board/boardDetail.do?postNo=${post.postNo}'">
        <td>${fn:length(boardPostList)- vs.count+1}</td>
        <td colspan="2" class="text-left">${post.postTitle}</td>
        <td>${memberWithGroupMap[post.memberId]}</td>
        <td><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></td>
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
     ${pagebar} 
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

