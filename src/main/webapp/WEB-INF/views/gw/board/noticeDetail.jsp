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
#btn{
 	
 	
}
</style>
<div class="groupware-board-detail-outter">
  <div class="groupware-board-detail-title-outter">

    <div class="groupware-board-detail-title">
      <hr>
      <p class="text-secondary"></p>
      <h3>${post.postTitle}</h3>
      <p>${post.memberId}<span><fmt:formatDate value="${post.postRegDate}" pattern="yy-MM-dd"/></span></p>
      <hr>
    </div>
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

  </div>
  <div class="card mb-2">
	<div class="card-header bg-light">
	       
	</div>
	<div class="card-body groupware-board-detail-rep">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-3 groupware-board-detail-rep-profile">
				<img class="member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
			</div>
			<div class="d-grid gap-2 d-md-block" style="text-align: right;">
				<button class="btn btn-primary" type="button" style="margin:20px;">수정</button>&nbsp;
				<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/gw/board/deletePostBoard.do?postNo=${post.postNo}'">삭제</button>
			</div>
				
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="1"></textarea>
			<button type="button" class="btn btn-dark ml-1   groupware-board-detail-rep-btn-enroll" onClick="javascript:addReply();">등록</button>
		    </li>
		</ul>
	</div>
</div>
</div>
  
<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

