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
  <div class="p-4">
    <form 
		enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/gw/board/anonymousSearch.do?" 
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
		      	<button class="btn btn-primary"><i class="fas fa-search"></i></button>		
		   </div>   
		</div>       
    </form>
  
  
  <table class="table file-board-table">
    <thead>
      <tr>
        <th>No</th>
        <th colspan="2">제목</th>
        <th>조회수</th>
        <th>날짜</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${anonymousPostList}" varStatus="vs">
      <tr>
        <td onclick="location.href='${pageContext.request.contextPath}/gw/board/anonymousDetail.do?postNo=${post.postNo}'">${fn:length(anonymousPostList)- vs.count+1}</td>
        <td colspan="2" class="text-left" onclick="location.href='${pageContext.request.contextPath}/gw/board/anonymousDetail.do?postNo=${post.postNo}'">${post.postTitle}
        	<c:forEach var="cnt" items="${replyCount}" >
        		<c:if test="${post.postNo == cnt.postNo}">
        			(${cnt.replyCnt})
        		</c:if>
        	</c:forEach>
        </td>
        <td onclick="location.href='${pageContext.request.contextPath}/gw/board/anonymousDetail.do?postNo=${post.postNo}'">${post.readCount}</td>
        <td onclick="location.href='${pageContext.request.contextPath}/gw/board/anonymousDetail.do?postNo=${post.postNo}'"><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></td>
        <td>
        <div class="deleteAnonymousList" onclick="deleteAnonymousPost(${post.postNo})">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="post-delete-btn bi bi-trash" viewBox="0 0 16 16">
	          <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	          <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
          </svg>
	        <span class ="delete-post-no">${post.postNo}</span>
        </div>
     	</td>
      </tr>
      </c:forEach>
     

    </tbody>
  </table>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end mr-2 ">
  <a href="${pageContext.request.contextPath}/gw/board/anonymousEnroll.do?boardNo=${boardNo}&groupNo=${groupNo} ">
    <button class="btn btn-primary me-md-2" type="button">글쓰기</button>
  </div>
  <div class="test-board-pagebar">
     ${pagebar} 
  </div>
</div>


<!-- 리스트에서 익명게시판 삭제하기 위한 모달창 -->
<div class="modal fade" id="deleteAnonymousModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">삭제하시려면 비밀번호를 입력해주세요</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="deleteAnonymousFrm" method="post" action="${pageContext.request.contextPath}/gw/board/deletePostAnonymous.do">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label  for="defaultForm-email">비밀번호</label>
	          <input type="text" name="postPassword" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
	        </div>
	      </div>
	      <input type="text" name="postNo" id="anonymous-post-no"/> 
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deleteAnonymousList">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
</div>

<script>

function checkNumber() {
	var objEv = event.srcElement;
	var numPattern = /([^0-9])/;
	var numPattern = objEv.value.match(numPattern);
	if (numPattern != null) {
		alert("숫자만 입력하세요");
		objEv.value = "";
		objEv.focus();
		return false;
	}

}

$(".modal-member-box").hide();

 $(".close-modal").click((e)=>{
	 $("#deleteAnonymousModal").modal('hide');
 });

 
 $(".btn-deleteAnonymousList").click((e)=>{
	 $(document.deleteAnonymousFrm).submit();
 });
 
 function deleteAnonymousPost(a) {
     $("#deleteAnonymousModal").modal('show');
     $("#anonymous-post-no").attr("value",a);
 }

 
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>
