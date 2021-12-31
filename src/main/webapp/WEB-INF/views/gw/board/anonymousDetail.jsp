<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<div class="groupware-board-detail-outter">
  <div class="groupware-board-detail-title-outter">
    <div class="groupware-board-detail-title">
     
      <hr>
      <p class="text-secondary"></p>
      <h3>${post.postTitle}</h3>
      <p><span><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span></p>
      <hr>
   
    </div>
        <%--   </c:forEach> --%>
    <div class="groupware-board-detail-title-btns">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
        <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
      </svg>
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
      </svg>
    </div>
  </div>

  <div class="groupware-board-detail-content ml-3 mt-3">
  		${post.postContent }
     
    <div class="d-grid gap-2 d-md-block" style="text-align: right;">
				<button class="btn btn-primary" type="button" style="margin:5px;">수정</button>&nbsp;
				<button class="deleteAnonymousPost btn btn-primary" type="button" >삭제</button>
			</div>
  </div>
  <div class="card mb-2">
	<div class="card-header bg-light">
	       
	</div>
	<div class="card-body groupware-board-detail-rep">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			
			
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="1"></textarea>
			<button type="button" class="btn btn-dark ml-1   groupware-board-detail-rep-btn-enroll" onClick="javascript:addReply();"> 등록</button>
		    </li>
		</ul>
	</div>
</div>
</div>

<!-- 익명게시판 삭제하기 위한 모달창 -->
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
	          <label  for="defaultForm-email">비밀번호</label>
	          <input type="text" name="postPassword" class="form-control validate"  maxlength="4" onChange="checkNumber()" id="deleteanonymous">
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

 
 $(".btn-deleteAnonymousPost").click((e)=>{
	 $(document.deleteAnonymousFrm).submit();
 });
 $(".deleteAnonymousPost").click((e)=>{
	 $("#deleteAnonymousModal").modal('show');
 });

 
</script>
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

