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
    <hr>
    <div class="groupware-board-detail-title pl-2 pr-2">
      <div class="d-flex justify-content-between align-items-center">
      	  <h3 class="m-0">${post.postTitle}</h3>
	      
      </div>
   	  <div class="d-flex justify-content-between align-items-center">
   	  	<div class="post-info">
	        <span>작성자 : ${memberWithGroupMap[post.memberId]}</span>
	        <span>[<fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/>]</span>
   	  	</div>
        <div class="post-button-set">
			<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/gw/board/postModify.do?postNo=${post.postNo}'">수정</button>&nbsp;
			<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/gw/board/deletePostBoard.do?postNo=${post.postNo}'">삭제</button>
        </div>
  	  </div>
    </div>
    <hr>
  

  <div class="groupware-board-detail-content ml-3 mt-3">
  		${post.postContent }
		<img class="post-content-img" src="${pageContext.request.contextPath }/resources/upFile/fileboard/${attach.renamedFilename}" alt="">
  </div>

  <!-- 댓글 작성 폼 -->  
  <div class="card mb-2">
	<div class="card-header bg-light">
  </div>
  <form:form action="${pageContext.request.contextPath }/gw/board/postReplyEnroll.do" method="post" >
	<div class="d-flex mt-3 ml-2 mr-2">
		<input type="hidden" value="${post.postNo}" name ="postNo">
		<input type="hidden" value="1" name ="replyLevel">
		<input type="hidden" name="replyRef" value="0" />
		<input type="text" class="form-control" placeholder="댓글을 입력하세요." name="content">
		<button type="submit" class="btn btn-dark ml-1 board-post-rep-btn-enroll">등록</button>
	</div>
  </form:form>
  
  	<!-- 댓글 수정/삭제 폼 -->
	<div class="post-rep-box ml-2 mr-2 mb-2">
		<c:forEach items="${replyList}" var="reply">
		  <c:if test="${reply.replyLevel == 1 && reply.deleteYn eq 'N'}">
			<hr class="border-0">
			<form:form name="postRepUpdateFrm" action="${pageContext.request.contextPath }/gw/board/deleteUpdateReply.do" method="post">
			<div class="d-flex justify-content-between align-items-end">
			
				<div class="d-flex align-items-center">
					  <div class="chat-user-profile m-0 mr-2 d-flex">
						<c:forEach items="${attachmentList}" var="attach">
							<c:if test="${reply.memberId eq attach.memberId}">
							  <c:choose>
								<c:when test="${fn:startsWith(attach.renamedFilename,'http')}">
									<img class="btn-profile chat-user-profile-img" src="${attach.renamedFilename}" alt=""/>
								</c:when>
								<c:otherwise>
					            	<img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${attach.renamedFilename}" alt="">
					            </c:otherwise>
							  </c:choose>
							</c:if>
						</c:forEach>
					  </div>
					  <div class="rep-profile">
						<div class="p-0 bd-highlight">
							<span><strong>${memberWithGroupMap[reply.memberId]}</strong></span>
							<span style="font-size: 10px;"><fmt:formatDate value="${reply.regDate}" pattern="yyyy.MM.dd" /></span>
						</div>
						<div class="p-0 flex-grow-1 bd-highlight"><span>${reply.content}</span></div>
					  </div>
				  </div>
				  <div class="rep-btn-box">
						<c:if test="${reply.memberId eq loginMember.id}">
							<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
							<input type="button" value="등록" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
							<input type="button" value="삭제" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
							<input type="hidden" name="type" value=""/>
							<input type="hidden" name="replyNo" value="${reply.replyNo}"> 
							<input type="hidden" name="postNo" value="${post.postNo}"> 
						</c:if>
						<button class="btn p-1 re-rep-btn" type="button" style="margin-bottom: 0px; font-size:12px">댓글쓰기</button>
				  </div>
			  </div>
				
				<!-- 대댓글 작성 폼 -->
				</form:form>
				<form:form name ="postReRepEnrollFrm" action="${pageContext.request.contextPath }/gw/board/postReplyEnroll.do" method="post" >	
		            <div class="d-flex align-items-center mt-2">
		            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi mr-1 bi-arrow-return-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
						</svg>
						<input type="text" class="form-control" name="content" placeholder="댓글을 입력하세요." />
						<input type="hidden" value="${post.postNo}" name ="postNo">
						<input type="hidden" value="2" name ="replyLevel">
						<input type="hidden" name="replyRef" value="${reply.replyNo}" />
						<input type="submit" class="btn btn-dark ml-2" value="등록" />
		            </div>
	            </form:form>
	            
	            <!-- 대댓글 수정/삭제 폼 -->
	            <c:forEach items="${replyList}" var="reRep">
					<c:if test="${reply.replyNo == reRep.replyRef && reRep.deleteYn eq 'N'}">
					
						<hr class="border-0">
							<form:form name="postReRepUpdateFrm" action="${pageContext.request.contextPath }/gw/board/deleteUpdateReply.do" method="post">
							<div class="d-flex justify-content-between align-items-end">
							
								<div class="d-flex align-items-center">
									  	<svg class="ml-3 mr-2 mb-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
										</svg>
									  <div class="chat-user-profile m-0 mr-2 d-flex">
										<c:forEach items="${attachmentList}" var="attach">
											<c:if test="${reRep.memberId eq attach.memberId}">
											  <c:choose>
												<c:when test="${fn:startsWith(attach.renamedFilename,'http')}">
													<img class="btn-profile chat-user-profile-img" src="${attach.renamedFilename}" alt=""/>
												</c:when>
												<c:otherwise>
									            	<img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${attach.renamedFilename}" alt="">
									            </c:otherwise>
											  </c:choose>
											</c:if>
										</c:forEach>
									  </div>
									  <div class="rep-profile">
										<div class="p-0 bd-highlight">
											<span><strong>${memberWithGroupMap[reRep.memberId]}</strong></span>
											<span style="font-size: 10px;"><fmt:formatDate value="${reRep.regDate}" pattern="yyyy.MM.dd" /></span>
										</div>
										<div class="p-0 flex-grow-1 bd-highlight">
											<span>${reRep.content}</span>
										</div>
									  </div>
								  </div>
								  <div class="rep-btn-box">
										<c:if test="${reRep.memberId eq loginMember.id}">
											<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="button" value="등록" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="button" value="삭제" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="hidden" name="type" value=""/>
											<input type="hidden" name="replyNo" value="${reRep.replyNo}"> 
											<input type="hidden" name="postNo" value="${post.postNo}">  
										</c:if>
								  </div>
							  </div>
								
							</form:form>
	            	</c:if>
	            	<c:if test="${reply.replyNo == reRep.replyRef && reRep.deleteYn eq 'Y'}">
	            		<hr class="border-0">
	            		<div class="d-flex">
		            		<svg class="ml-3 mt-2 mb-2" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
							</svg>
		            		<p class="mt-2 mb-2 ml-2">삭제된 댓글입니다.</p>
	            		</div>
	            	</c:if>
	            </c:forEach>
	            </c:if>
	            
	            <!-- 삭제된 댓글 -->
	            <c:if test="${reply.replyLevel == 1 && reply.deleteYn eq 'Y'}">
	            	<hr class="border-0">
	            	<p class="mt-4 mb-4 ml-2">삭제된 댓글입니다.</p>
	            	<c:forEach items="${replyList}" var="reRep">
					<c:if test="${reply.replyNo == reRep.replyRef && reRep.deleteYn eq 'N'}">
					
						<hr class="border-0">
							<form:form action="${pageContext.request.contextPath }/gw/board/deleteUpdateReply.do" method="post">
							<div class="d-flex justify-content-between align-items-end">
							
								<div class="d-flex align-items-center">
									  	<svg class="ml-3 mr-2 mb-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
										</svg>
									  <div class="chat-user-profile m-0 mr-2 d-flex">
										<c:forEach items="${attachmentList}" var="attach">
											<c:if test="${reRep.memberId eq attach.memberId}">
											  <c:choose>
												<c:when test="${fn:startsWith(attach.renamedFilename,'http')}">
													<img class="btn-profile chat-user-profile-img" src="${attach.renamedFilename}" alt=""/>
												</c:when>
												<c:otherwise>
									            	<img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${attach.renamedFilename}" alt="">
									            </c:otherwise>
											  </c:choose>
											</c:if>
										</c:forEach>
									  </div>
									  <div class="rep-profile">
										<div class="p-0 bd-highlight">
											<span><strong>${memberWithGroupMap[reRep.memberId]}</strong></span>
											<span style="font-size: 10px;"><fmt:formatDate value="${reRep.regDate}" pattern="yyyy.MM.dd" /></span>
										</div>
										<div class="p-0 flex-grow-1 bd-highlight"><span>${reRep.content}</span></div>
									  </div>
								  </div>
								  <div class="rep-btn-box">
										<c:if test="${reRep.memberId eq loginMember.id}">
											<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="button" value="등록" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="button" value="삭제" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
											<input type="hidden" name="type" value=""/>
											<input type="hidden" name="replyNo" value="${reRep.replyNo}"> 
											<input type="hidden" name="postNo" value="${post.postNo}"> 
										</c:if>
								  </div>
							  </div>
								
							</form:form>
	            	</c:if>
	            	<c:if test="${reply.replyNo == reRep.replyRef && reRep.deleteYn eq 'Y'}">
	            		<hr class="border-0">
	            		<div class="d-flex">
		            		<svg class="ml-3 mt-2 mb-2" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
							</svg>
		            		<p class="mt-2 mb-2 ml-2">삭제된 댓글입니다.</p>
	            		</div>
	            	</c:if>
	            </c:forEach>
	            </c:if>
			</c:forEach>
	</div>
	  
  	</div>
  </div>
</div>
<script>
/* 댓글 스크립트 */
$(".btn-enroll").hide();

$(".btn-enroll").click((e)=> {
	$("input[name=type]").val("update");
	
	$(e.target).parent().parent().parent().eq(0).submit();
})

$(".btn-transform").on('click', (e)=> {
	$(e.target).hide();
	$(e.target).next().show();
	var oldContent = $(e.target).parent().parent("div").find("span").eq(2).text();
	$(e.target).parent().parent("div").find("span").eq(2).html('');
	$(e.target).parent().parent("div").find("span").eq(2).html(`<input type="text" name="content" class="form-control" value = "\${oldContent}" />`);
});

$(".btn-delete").click((e) => {
	if(confirm("정말 삭제하시겠습니까?")) {
		$("input[name=type]").val("delete");
		$(e.target).parent().parent().parent().eq(0).submit();
	}
});

/* 대댓글 스크립트 */
$(document.postReRepEnrollFrm).hide();

$('.re-rep-btn').on('click', (e)=> {
	$(e.target).parent().parent().parent().next().slideToggle(500);
});

	
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>
</sec:authorize>
