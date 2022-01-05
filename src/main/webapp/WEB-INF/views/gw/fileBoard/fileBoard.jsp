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

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>


 <div class="workspace-box">
  <div class="p-4">

    <!-- 정렬 및 검색 -->
    <form action="${pageContext.request.contextPath}/gw/fileBoard/fileBoard.do?boardNo=${boardNo}&groupNo=${groupNo}" method="get">
	    <div class="test-board-search d-flex float-right">
	    	 <select name="searchType" class="form-select search-select" id="form-select-search" style="width: 38%;" aria-label="Default select example">
		        <option value="all" ${searchType == 'all' ? "selected":'' }> 전체보기 </option>
		        <option value="img" ${searchType == 'img' ? "selected":'' }>이미지</option>
		        <option value="document" ${searchType == 'document' ? "selected":'' }>문서</option>
		        <option value="zip" ${searchType == 'zip' ? "selected":'' }>압축파일</option>
		        <option value="code" ${searchType == 'code' ? "selected":'' }>코드파일</option>
		        <option value="etc" ${searchType == 'etc' ? "selected":'' }>기타</option>
		     </select>
		     
		   <div class="input-group mb-3 search-input">
		      <input type="text" class="form-control" name="searchKeyword" value="${searchKeyword }" placeholder="작성자 또는 제목검색"  aria-describedby="button-addon2">
		   		<button class="btn btn-outline-secondary" type="button" id="button-addon2" >검색</button>
		   </div>   
		</div>       
    </form>
  
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
<!--  -->
  <c:if test="${not empty fileBoardList}">
  <c:forEach var="post" items="${fileBoardList}" varStatus="status">
 <%--  <c:set var="count" value="${count + 1}" /> --%>
		
            <tr>      
           		<td>${fn:length(fileBoardList)- status.count+1}</td>	
                <td>${post.boardCategory}</td>
                <td colspan="2">${post.postTitle}</td>
                <td><a href="${pageContext.request.contextPath}/gw/fileBoard/fileDown.do?attachNo=${post.attachNo}" >
				  <c:forEach var="attach" items="${attach}" varStatus="status">
					  	<c:if test="${post.attachNo eq attach.attachNo}">
					                ${attach.originalFilename}
					    </c:if>
	                  </c:forEach>
                </a></td>
               	
                 <c:forEach items="${idnicknameList}" var="list" varStatus="status">
                	<c:if test="${list.id eq post.memberId}">
                		<td>${list.nickName}</td>
                	</c:if>
                </c:forEach>
                <td ><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/>
	                <c:if test="${loginMember.id eq post.memberId}">
		                <form  action="${pageContext.request.contextPath}/gw/fileBoard/deletefilePost.do?postNo=${post.postNo}" method="GET">
						  <c:forEach var="attach" items="${attach}" varStatus="status">
							  	<c:if test="${post.attachNo eq attach.attachNo}"> 
			                		<button id="fileBoard-delete">삭제</button>
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
	</c:if>

<!--  -->
	<c:if test="${empty fileBoardList and !isListempty}">
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
				                		<button id="fileBoard-delete">삭제</button>
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
	 </c:if>
    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
   <a href="${pageContext.request.contextPath}/gw/fileBoard/fileEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} "> <button class="btn btn-primary me-md-2" type="button">글쓰기</button></a>
  </div>
  <div class="test-board-pagebar">
     ${pagebar} 
  </div>
 </div>
</div>
<script>
$("#button-addon2").click((e)=>{
    const searchType = $("select[name=searchType]").val();
    const searchKeyword = $("input[name=searchKeyword]").val();
    location.href=`${pageContext.request.contextPath}/gw/fileBoard/fileBoard.do?boardNo=${boardNo}&groupNo=${groupNo}&searchType=\${searchType}&searchKeyword=\${searchKeyword}`; 
   
});
</script>
<script>
window.addEventListener("load", function(){
	$("#dropdownBoard").removeClass("collapsed");
	$("#board-collapse").addClass("show");
	});
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

</sec:authorize>