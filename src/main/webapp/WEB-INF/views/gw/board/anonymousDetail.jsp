<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MANAGER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<div class="workspace-box">
  <div class="p-4">
    <hr>
    <div class="groupware-board-detail-title pl-2 pr-2">
    	<div class="d-flex justify-content-between align-items-center">
      		<h3 class="m-0">${post.postTitle}</h3>
		    
    	</div>
     	<div class="d-flex justify-content-between align-items-center">
     		<div class="post-info">
      			<span>[<fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/>]</span><br>
      			<span>조회수 : ${post.readCount}</span>
      		</div>
		    <div class="d-grid gap-2 d-md-block" style="text-align: right;">
				<button class="updateAnonymousPost btn btn-primary" type="button" style="margin:5px;" >수정</button>&nbsp;
				<button class="deleteAnonymousPost btn btn-primary" type="button" >삭제</button>
			</div>
      	</div>
   
    </div>
    <hr>

  <div class="groupware-board-detail-content ml-3 mt-3">
  		${post.postContent }
  </div>

    <!-- 댓글 작성 폼 -->  
  <div class="card mb-2">
	<div class="card-header bg-light">
  </div>
  <form:form name="anonymousReplyEnrollFrm" action="${pageContext.request.contextPath }/gw/board/anonymousReplyEnroll.do" method="post" >
	<div class="input-group mt-3 pl-2 pr-2 mx-auto">
		<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
		<input id="pw" name="replyPw" type="text" class="form-control" onChange="checkNumber()" maxlength="4" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="숫자 4자리를 입력해 주세요.">
	</div>
	<div class="d-flex mt-2 ml-2 mr-2">
		<input type="hidden" value="${post.postNo}" name ="postNo">
		<input type="hidden" value="1" name ="replyLevel">
		<input type="hidden" name="replyRef" value="0" />
		
		<input id="rep-con" type="text" class="form-control" placeholder="댓글을 입력하세요." name="content">
		<input type="button" id="btn-send" class="btn btn-dark ml-1" value="등록">
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
					  
					  <div class="rep-profile ml-3">
						<div class="p-0 bd-highlight">
							<c:choose>
								<c:when test="${post.memberId eq reply.memberId }">
									<span><strong>작성자</strong></span>
								</c:when>
								<c:otherwise>
									<span><strong>무명</strong></span>
								</c:otherwise>
							</c:choose>
							<span style="font-size: 10px;"><fmt:formatDate value="${reply.regDate}" pattern="yyyy.MM.dd" /></span>
						</div>
						<div class="p-0 flex-grow-1 bd-highlight"><span>${reply.content}</span></div>
					  </div>
				  </div>
				  <div class="rep-btn-box">
						<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
						<input type="button" value="등록" onclick="checkPasswordForUpdate(${reply.replyNo})" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
						<input type="button" value="삭제" onclick="checkPassword(${reply.replyNo})" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
						<button class="btn p-1 re-rep-btn" type="button" style="margin-bottom: 0px; font-size:12px">댓글쓰기</button>
				  </div>
			  </div>
				
				<!-- 대댓글 작성 폼 -->
				</form:form>
				<form:form name ="anonymousReRepEnrollFrm" action="${pageContext.request.contextPath }/gw/board/anonymousReplyEnroll.do" class="mt-2" method="post" >
					<div class="d-flex align-items-center">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi ml-3 mr-2 bi-arrow-return-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
					</svg>
					<div class="input-group mt-2 pr-2">
						<span class="input-group-text re-rep-pw ml-1" id="inputGroup-sizing-default">비밀번호</span><br>
						<input id="reRepPw" name="replyPw" type="text" class="form-control re-rep-pw" onChange="checkNumber()" maxlength="4" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="숫자 4자리를 입력해 주세요.">
					</div>
					</div>	
					<div class="d-flex mt-2 pl-6 pr-2" style="margin-left: 4%;">
						<input type="text" class="form-control re-rep-con" name="content" placeholder="댓글을 입력하세요." />
						<input type="hidden" value="${post.postNo}" name ="postNo">
						<input type="hidden" value="2" name ="replyLevel">
						<input type="hidden" name="replyRef" value="${reply.replyNo}" />
						<input type="submit" class="btn btn-dark ml-1" value="등록" />
					</div>
	            </form:form>
	            
	            <!-- 대댓글 수정/삭제 폼 -->
	            <c:forEach items="${replyList}" var="reRep">
					<c:if test="${reply.replyNo == reRep.replyRef && reRep.deleteYn eq 'N'}">
					
						<hr class="border-0">
							<form:form name="postReRepUpdateFrm" action="${pageContext.request.contextPath }/gw/board/deleteUpdateReply.do" method="post">
							<div class="d-flex justify-content-between align-items-end">
							
								<div class="d-flex align-items-center ml-3">
									  	<svg class="ml-3 mr-2 mb-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
										</svg>
									  <div class="rep-profile">
										<div class="p-0 bd-highlight">
											<c:choose>
												<c:when test="${post.memberId eq reRep.memberId }">
													<span><strong>작성자</strong></span>
												</c:when>
												<c:otherwise>
													<span><strong>무명</strong></span>
												</c:otherwise>
											</c:choose>
											<span style="font-size: 10px;"><fmt:formatDate value="${reRep.regDate}" pattern="yyyy.MM.dd" /></span>
										</div>
										<div class="p-0 flex-grow-1 bd-highlight">
											<span>${reRep.content}</span>
										</div>
									  </div>
								  </div>
								  <div class="rep-btn-box">
										<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="button" value="등록" onclick="checkPasswordForUpdate(${reRep.replyNo})" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="button" value="삭제" onclick="checkPassword(${reRep.replyNo})" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="hidden" name="type" value=""/>
										<input type="hidden" name="replyNo" value="${reRep.replyNo}"> 
										<input type="hidden" name="postNo" value="${post.postNo}">   
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
									  <div class="rep-profile">
										<div class="p-0 bd-highlight">
											<c:choose>
												<c:when test="${post.memberId eq reply.memberId }">
													<span><strong>작성자</strong></span>
												</c:when>
												<c:otherwise>
													<span><strong>무명</strong></span>
												</c:otherwise>
											</c:choose>
											<span style="font-size: 10px;"><fmt:formatDate value="${reRep.regDate}" pattern="yyyy.MM.dd" /></span>
										</div>
										<div class="p-0 flex-grow-1 bd-highlight"><span>${reRep.content}</span></div>
									  </div>
								  </div>
								  <div class="rep-btn-box">
										<input type="button" value="수정" class="btn-transform btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="button" value="등록" onclick="checkPasswordForUpdate(${reRep.replyNo})" class="btn-enroll btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="button" value="삭제" onclick="checkPassword(${reRep.replyNo})" class="btn-delete btn p-1" style="margin-bottom: 0px; font-size:12px" />
										<input type="hidden" name="type" value=""/>
										<input type="hidden" name="replyNo" value="${reRep.replyNo}"> 
										<input type="hidden" name="postNo" value="${post.postNo}"> 
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



<!-- 익명게시글 삭제하기 위한 모달창 -->
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
      <form:form name="deleteAnonymousFrm" method="post" action="${pageContext.request.contextPath}/gw/board/deletePostAnonymous.do?postNo=${post.postNo}">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label for="defaultForm-email">비밀번호</label>
	          <input id="deletePostPw" type="text" name="postPassword" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo}" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deleteAnonymousPost">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 익명게시글 수정하기 위한 모달창 -->
<div class="modal fade" id="updateAnonymousModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">수정하시려면 비밀번호를 입력해주세요</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="updateAnonymousFrm" method="post" action="${pageContext.request.contextPath}/gw/board/checkPassword.do?postNo=${post.postNo}">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label for="defaultForm-email">비밀번호</label>
	          <input id="updatePostPw" type="text" name="postPassword" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo}" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-updateAnonymousPost">수정</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 댓글 삭제하기 위한 모달창 -->
<div class="modal fade" id="deleteAnonymousReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">삭제하시려면 비밀번호를 입력해주세요</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="deleteAnonymousReplyFrm" method="post" action="${pageContext.request.contextPath}/gw/board/deleteUpdateAnonymousReply.do">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label  for="defaultForm-email">비밀번호</label>
	          <input id="pw" type="text" name="replyPw" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
	        </div>
	      </div>
	      <input type="hidden" class="deleteReplyNo" name="replyNo" />
	      <input type="hidden" name="type" value="delete" />
	      <input type="hidden" name="postNo" value="${post.postNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-delete-anonymous-reply">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 댓글 수정하기 위한 모달창 -->
<div class="modal fade" id="updateAnonymousReplyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">수정하시려면 비밀번호를 입력해주세요</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="updateAnonymousReplyFrm" method="post" action="${pageContext.request.contextPath}/gw/board/deleteUpdateAnonymousReply.do">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label  for="defaultForm-email">비밀번호</label>
	          <input type="text" name="replyPw" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
	        </div>
	      </div>
	      <input type="text" class="updateReplyNo" name="replyNo" />
	      <input type="text" class="updateReplyContent" name="content" />
	      <input type="text" name="type" value="update" />
	      <input type="text" name="postNo" value="${post.postNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-update-anonymous-reply">수정</button>
        <button class="btn close-modal">취소</button>
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

/* 댓글 스크립트 */
$(".btn-enroll").hide();

$(".btn-transform").on('click', (e)=> {
	$(e.target).hide();
	$(e.target).next().show();
	var oldContent = $(e.target).parent().parent("div").find("span").eq(2).text();
	$(e.target).parent().parent("div").find("span").eq(2).html('');
	$(e.target).parent().parent("div").find("span").eq(2).html(`<input type="text" id="re-rep-modify-input" name="content" class="re-rep-modify-con form-control" value = "\${oldContent}" />`);
});



/* 대댓글 스크립트 */
$(document.anonymousReRepEnrollFrm).hide();

$('.re-rep-btn').on('click', (e)=> {
	$(e.target).parent().parent().parent().next().slideToggle(500);
});

/* 비밀번호 유효성 */
function checkNumber() {
	var objEv = event.srcElement;
	var numPattern = /([^0-9])/;
	var numPattern = objEv.value.match(numPattern);
	if (numPattern != null) {
		alert("비밀번호는 숫자 4자리로 입력해주세요.");
		objEv.value = "";
		objEv.focus();
		return false;
	}
}



/* 댓글 대댓글 제출 */
$("[name=anonymousReplyEnrollFrm]").submit(function(){
	var $pw = $("#pw");
	if(/^\w{4}$/.test($pw.val()) == false) {
		alert("비밀번호는 숫자 4자리로 입력해주세요.");
		$pw.focus();
		return false;
	}
		return true;
});
$("#btn-send").click((e)=>{
	if($('#rep-con').val() != null && $('#rep-con').val() != ''){
	}else{
		alert("내용을 입력해주세요.");
		return;
	}
 	if($(pw).val() != null && $(pw).val() != ''){
	}else{
		alert("비밀번호는 숫자 4자리로 입력해주세요.");
		return;
	}

	$(document.anonymousReplyEnrollFrm).submit();
});

 /* $("[name=anonymousReRepEnrollFrm]").submit(function(){
	var pw = $('.re-rep-pw');
	if(/^\w{4}$/.test(pw.val()) == false) {
		alert("비밀번호는 숫자 4자리로 입력해주세요.ㅇㅇ");
		pw.focus();
		return false;
	}
		return true;
});   */
$('.board-post-rep-btn-enroll').click((e)=>{
	if($('.re-rep-con').val() != null && $('.re-rep-con').val() != ''){
	}else{
		alert("내용을 입력해주세요.");
		return;
	}
 	if($(".re-rep-pw").val() != null && $(".re-rep-pw").val() != ''){
	}else{
		alert("비밀번호는 숫자 4자리로 입력해주세요.");
		return;
	}

	$(document.anonymousReRepEnrollFrm).submit();
});

 $(".close-modal").click((e)=>{
	 $("#deleteAnonymousModal").modal('hide');
	 $("#updateAnonymousModal").modal('hide');
	 $("#deleteAnonymousReplyModal").modal('hide');
	 $("#updateAnonymousReplyModal").modal('hide');
 });

/* 댓글 삭제 */
function checkPassword(i) {
	$("#deleteAnonymousReplyModal").modal('show');
	$('.deleteReplyNo').attr("value", i);
} 
$(".btn-delete-anonymous-reply").click((e)=> {
	$(document.deleteAnonymousReplyFrm).submit();
});

/* 댓글 수정 */
function checkPasswordForUpdate(i) {
	var updateContent = document.getElementById('re-rep-modify-input').value;
	console.log(updateContent);
	$("#updateAnonymousReplyModal").modal('show');
	$('.updateReplyNo').attr("value", i);
	$('.updateReplyContent').attr("value", updateContent);
}

$(".btn-update-anonymous-reply").click((e)=> {
	$(document.updateAnonymousReplyFrm).submit();
});

/* 게시글 수정삭제 */
 $(".btn-deleteAnonymousPost").click((e)=>{
	if($(deletePostPw).val() != null && $(deletePostPw).val() != '' ){
	}else{
		alert("비밀번호를 입력해주세요.");
		return;
	}
	$(document.deleteAnonymousFrm).submit();
 });
 
 $(".deleteAnonymousPost").click((e)=>{
	 $("#deleteAnonymousModal").modal('show');
 });
 $(".btn-updateAnonymousPost").click((e)=>{
	 if($(updatePostPw).val() != null && $(updatePostPw).val() != '' ){
		}else{
			alert("비밀번호를 입력해주세요.");
			return;
	 }
	 $(document.updateAnonymousFrm).submit();
 });
 $(".updateAnonymousPost").click((e)=>{
	 $("#updateAnonymousModal").modal('show');
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
