<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
<style>
 tr{cursor:pointer;}
</style>
 <div class="workspace-box">
  <div class="p-5">
    <form 
		enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/gw/board/noticeSearch.do?" 
		method="get">
	    <div class="test-board-search d-flex float-right">
	    	 <select name="searchType" class="form-select search-select" id="form-select-search" style="width: 27%;">
		        <option value="post_title" 
	        	<c:if test="${searcyType eq 'post_title'}">selected </c:if> 
		        >제목</option>
		        <option value="post_content" 
	        	<c:if test="${searcyType eq 'post_content'}">selected </c:if> 
		        >내용</option>
		        
		     </select>
		     
		   <div class="input-group mb-3 search-input">
		   		<input type="hidden" name="boardNo" value="${boardNo}"/>
		   		<input type="hidden" name="groupNo" value="${groupNo}"/>
      			<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." >
		      		
		   	  <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색"></input>
		   </div>   
		</div>       
    </form>
  
  <table class="table table-sm">
    <tbody>
    <c:forEach var="post" items="${noticePostList}" varStatus="vs">
      <tr onclick="location.href='${pageContext.request.contextPath}/gw/board/boardDetail.do?postNo=${post.postNo}'">
        <td colspan="3">
	        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" fill="currentColor" class="bi bi-circle-fill" viewBox="0 0 16 16">
			  <circle cx="8" cy="8" r="8"/>
			</svg>
			 ${post.postTitle}
        	<c:forEach var="cnt" items="${replyCount}" >
        		<c:if test="${post.postNo == cnt.postNo}">
        			(${cnt.replyCnt})
        		</c:if>
        	</c:forEach>
        </td>
        <td><span class="text-secondary"><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span></td>
      </tr>
      </c:forEach>
      

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
	  <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">
	  	<a href="${pageContext.request.contextPath}/gw/board/boardEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} ">
		    <button class="btn btn-primary me-md-2" type="button">글쓰기</button>
	  	</a>
	  </sec:authorize>
  </div>


  <div class="test-board-pagebar">
	${pagebar }
  </div>
</div>
</div>
<script>
window.addEventListener("load", function(){
	$("#dropdownBoard").removeClass("collapsed");
	$("#board-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

</sec:authorize>
