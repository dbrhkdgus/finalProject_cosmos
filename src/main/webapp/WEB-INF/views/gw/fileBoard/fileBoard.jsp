<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
<script>
$("#button-addon2").click((e)=>{
    const searchType = $("select[name=searchType]").val();
    const searchKeyword = $("input[name=searchKeyword]").val();
   
});
</script>
 <div class="test-notice-outter">
  <div class="test-board-title-container">
    <div class="test-board-title">
      <!-- <h1>파일 게시판</h1> -->
    </div>
    <!-- 정렬 및 검색 -->
    <form action="${pageContext.request.contextPath}/gw/fileBoard/fileBoard.do?boardNo=${boardNo}&groupNo=${groupNo}" method="get">
	    <div class="test-board-search">
	    	 <select name="searchType" class="form-select search-select" aria-label="Default select example">
		        <option value="all" ${searchType == 'all' ? "selected":'' }> 전체보기 </option>
		        <option value="img" ${searchType == 'img' ? "selected":'' }>이미지</option>
		        <option value="document" ${searchType == 'document' ? "selected":'' }>문서</option>
		        <option value="zip" ${searchType == 'zip' ? "selected":'' }>압축파일</option>
		        <option value="code" ${searchType == 'code' ? "selected":'' }>코드파일</option>
		        <option value="etc" ${searchType == 'etc' ? "selected":'' }>기타</option>
		     </select>
		     
		   <div class="input-group mb-3 search-input">
		      <input type="text" class="form-control" name="searchKeyword" value="${searchKeyword }" placeholder="작성자 또는 제목으로 검색"  aria-describedby="button-addon2">
		   		<button class="btn btn-outline-secondary" type="button" id="button-addon2" >검색</button>
		   </div>   
		</div>       
    </form>
  </div>
  <table class="table file-board-table">
    <thead>
      <tr>
        <th>No</th>
        <th>카테고리</th>
        <th colspan="2">제목</th>
        <th>첨부파일</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>

  <c:forEach var="post" items="${fileboardPostList}" varStatus="status">
            <tr>
                <td>${fn:length(fileboardPostList)- status.count+1}</td>
                
                <td>${post.boardCategory}</td>
                <td colspan="2">${post.postTitle}</td>
                <td><a href="${pageContext.request.contextPath}/gw/fileBoard/fileDown.do?attachNo=${post.attachNo}" >
				  <c:forEach var="attach" items="${attach}" varStatus="status">
					  	<c:if test="${post.attachNo eq attach.attachNo}">
					                ${attach.originalFilename}
					    </c:if>
	                  </c:forEach>
                </a></td>
                <td>${post.memberId}</td>
                <td ><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/>
	                <c:if test="${loginMember.id eq post.memberId}">
		                <form  action="${pageContext.request.contextPath}/gw/fileBoard/deletefilePost.do?postNo=${post.postNo}" method="GET">
						  <c:forEach var="attach" items="${attach}" varStatus="status">
							  	<c:if test="${post.attachNo eq attach.attachNo}"> 
			                		<button>삭제</button>
				                	<input type="hidden" value="${groupNo}" name ="groupNo">
				                	<input type="hidden" value="${post.postNo}"  name="postNo">
				                	<input type="hidden" value="${boardNo}" name = "boardNo">		                	
				                	<input type="hidden" value="${attach.attachNo}" name = "attachNo">		                	
				     		    </c:if>
		                  </c:forEach>
		                </form>
	                </c:if>
                </td>
             </tr>
        </c:forEach>      

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
   <a href="${pageContext.request.contextPath}/gw/fileBoard/fileEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} "> <button class="btn btn-primary me-md-2" type="button">글쓰기</button></a>
  </div>
  <div class="test-board-pagebar">
    
    <nav aria-label="Page navigation example test-board-pagebar">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
      </ul>
    </nav> 
  </div>
</div>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

