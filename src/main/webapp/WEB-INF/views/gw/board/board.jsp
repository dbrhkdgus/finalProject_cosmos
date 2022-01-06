<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<style>
 tr{cursor:pointer;}
</style>
 <div class="workspace-box">
	<div class="p-5">
	<form 
		enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/gw/board/boardSearch.do?" 
		method="get">
	    <div class="test-board-search d-flex float-right mb-4" style="margin-right: 6%">
	    	 <select name="searchType" class="form-select search-select" id="form-select-search" style="width: 35%;">
		        <option value="post_title" 
	        	<c:if test="${searcyType eq 'post_title'}">selected </c:if> 
		        >제목</option>
		        <option value="nickname" 
	        	<c:if test="${searcyType eq 'nickname'}">selected </c:if> 
		        >작성자</option>
		        <option value="post_content" 
	        	<c:if test="${searcyType eq 'post_content'}">selected </c:if> 
		        >내용</option>
		      
		     </select>
        	<div class="input-group mb-3"> 
        		<input type="hidden" name="boardNo" value="${boardNo}"/>
				<input type="hidden" name="groupNo" value="${groupNo}"/>
        		<input type="text"  class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요.">
        	<button class="btn btn-primary"><i class="fas fa-search"></i></button>
    		</div>
		</div>
 	</form>
		 
		 
		 <!--<div class="input-group mb-3 search-input">
		   		<input type="hidden" name="boardNo" value="${boardNo}"/>
		   		<input type="hidden" name="groupNo" value="${groupNo}"/>
      			<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력하세요." >
		      		
		   	  <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="검색"></input>
		   	</div>   
			</div>       
    	</form> -->
    <br>
  <table class="table table-sm file-board-table mx-auto mt-3 board-table-hover" style="width: 85%;">
    <thead class="board-thead">
      <tr>
        <th>No</th>
        <th colspan="2">제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th style="width: 12%">날짜</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${boardPostList}" varStatus="vs">
      <tr onclick="location.href='${pageContext.request.contextPath}/gw/board/boardDetail.do?postNo=${post.postNo}'">
        <td>${fn:length(boardPostList)- vs.count+1}</td>
        <td colspan="2" class="text-left">${post.postTitle}
        	<c:forEach var="cnt" items="${replyCount}" >
        		<c:if test="${post.postNo == cnt.postNo}">
        			(${cnt.replyCnt})
        		</c:if>
        	</c:forEach>
        </td>
        <td>${memberWithGroupMap[post.memberId]}</td>
        <td>${post.readCount}</td>
        <td><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></td>
      </tr>
      </c:forEach>
     

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 7%;">
	  <a href="${pageContext.request.contextPath}/gw/board/boardEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} ">
	    <button class="btn btn-primary me-md-2 mt-2" type="button">글쓰기</button>
      </a>
  </div>
  
  <div class="test-board-pagebar">
     ${pagebar} 
  </div>
</div>
</div>

<script>
/* $("#button-addon2").click((e)=>{
    const searchType = $("select[name=searchType]").val();
    const searchKeyword = $("input[name=searchKeyword]").val();
    location.href=`${pageContext.request.contextPath}/gw/board/boardSearch.do?boardNo=${boardNo}&groupNo=${groupNo}&searchType=\${searchType}&searchKeyword=\${searchKeyword}`; 
   
}); */
</script>
<script>
window.addEventListener("load", function(){
	$("#dropdownBoard").removeClass("collapsed");
	$("#board-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>
