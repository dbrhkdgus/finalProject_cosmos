<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>그룹웨어</title>
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="${pageContext.request.contextPath }/resources/css/groupware.css" rel="stylesheet" />


    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
    
    
    
  	<!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<!-- sock.js 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- stomp.js 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <!-- Chart.js CDN-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js" integrity="sha512-60KwWtZOhzgr840mc57MV8JqDZHAws3w61mhK45KsYHmhyNFJKmfg4M7/s2Jsn4PgtQ4Uhr9xItS+HCbGTIRYQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" integrity="sha512-mf78KukU/a8rjr7aBRvCa2Vwg/q0tUjJhLtcK53PHEbFwCEqQ5durlzvVTgQgKpv+fyNMT6ZQT1Aq6tpNqf1mg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>
  </head>
  <body>
<main>
  <header class="bg-light">

    <div id="cosmos-groupwear-header">
      <div class="groupwear-header-box">
        
        <div class="" style="width: 4.5rem;">
          <a href="#" class="d-block p-3 link-dark text-decoration-none" title="Icon-only" data-bs-toggle="tooltip" data-bs-placement="right">
            <img src="https://cdn.discordapp.com/attachments/912943660943962178/919420883179806740/cosmoslogo_black.png" width="40" alt="" onclick="location.href='${pageContext.request.contextPath}/'">
            <!-- <svg class="bi" width="40" height="32"><use xlink:href="#bootstrap"/></svg> -->
            <span class="visually-hidden">Icon-only</span>
          </a>
        </div>
        
        <div class="groupwear-study-title" style="width: 260px;">
          <a href="${pageContext.request.contextPath }/gw/gw.do?groupNo=${myGroup.groupNo}" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
            <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-5 fw-semibold">${myGroup.groupName }</span>
          </a>
        </div>
        <div class="groupwear-channel-title">

          <h5> ${title }</h5>

        </div>
          
      </div>  
    </div>
  </header>
  <section id="cosmos-groupwear-workspace">

  <div class="d-flex flex-column flex-shrink-0 bg-light" style="width: 4.5rem;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">

     <c:forEach var="group" items="${myGroupList}">
    	<c:forEach var="attach" items="${groupBannerAttachList }">

     	<c:if test="${group.groupNo == attach.groupNo }">
      <li class="nav-item">
        <a href="${pageContext.request.contextPath }/gw/gw.do?groupNo=${group.groupNo}" class="nav-link ${group.groupNo == currGroupNo ? 'active' : '' }" py-3 border-bottom" aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
          <div class="study-thumbnail-box">
            <img class="study-thumbnail" src="${pageContext.request.contextPath }/resources/upFile/group/${attach.renamedFilename}" width="30" alt="">
          </div>
        </a>
      </li>
    	</c:if> 
    	</c:forEach>
    </c:forEach>
    </ul>
    <div class="dropdown border-top">
      <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="${pageContext.request.contextPath }/resources/upFile/profile/${profile}" alt="mdo" width="24" height="24" class="rounded-circle">
      </a>
      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser3">
        <li><a class="dropdown-item" href="#">상태 변경</a></li>
        <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/memberUpdate.do">프로필 설정</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" id="gw-logout">로그아웃</a></li>
      </ul>
    </div>
  </div>
<form:form method="POST" action="${pageContext.request.contextPath}/member/memberLogout.do" id="memberLogoutFrm" class="d-inline"></form:form>
  <div class="flex-shrink-0 p-3 bg-light" style="width: 260px;">
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="true">
	          게시판 채널
	        </button>
	        <div class="createBoardRoom" style="cursor: pointer;">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
			</svg>
			</div>
      	</div>
        <div class="collapse show" id="board-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath }/gw/board/notice.do?groupNo=${currGroupNo}" class="link-dark rounded">공지사항</a></li>
           	<c:if test="${not empty boardList}">
           		<c:forEach var="boardRoom" items="${boardList}">
           			<c:if test="${fn:contains(boardRoom.boardType, 'B')}">
	            		<li><a href="${pageContext.request.contextPath }/gw/board/board.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
	            	</c:if>
	            	<c:if test="${fn:contains(boardRoom.boardType, 'A')}">
	            		<li><a href="${pageContext.request.contextPath }/gw/board/anonymous.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
	            	</c:if>
	            	<c:if test="${fn:contains(boardRoom.boardType, 'F')}">
	            		<li><a href="${pageContext.request.contextPath }/gw/fileBoard/fileBoard.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
	            	</c:if>
           		</c:forEach>
            </c:if>	
            
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#chatting-collapse" aria-expanded="false">
	          채팅 채널
	        </button>
	        <div class="createChatRoom" style="cursor: pointer;">
		        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
	        </div>
		</div>
        <div class="collapse" id="chatting-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	<c:choose>
	          	<c:when test="${not empty chattingChannelList}">
	          		<c:forEach var="chatRoom" items="${chattingChannelList }">
			            <li><a href="${pageContext.request.contextPath }/gw/chat/chatRoom.do?chatRoomNo=${chatRoom.chatRoomNo}&groupNo=${currGroupNo }" class="link-dark rounded">${chatRoom.chatRoomName }</a></li>
	          		</c:forEach>
	          	</c:when>
	          	<c:otherwise>
	          	    <li><a class="createChatRoom link-dark rounded text-secondary">(채팅방 개설하기)</a></li>
	          	</c:otherwise>
          	</c:choose>
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button id="selectAllZoomRoomList" class="btn btn-toggle align-items-center rounded collapsed" data-group-no="${currGroupNo}" data-bs-toggle="collapse" data-bs-target="#v-chatting-collapse" aria-expanded="false">
	          화상 채널
	        </button>
	        <div class="createVoiceChatRoom" style="cursor: pointer;">
		        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
			</div>
		</div>
        <div class="collapse" id="v-chatting-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small" id="voiceChat">
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#schedule-collapse" aria-expanded="false">
	          일정 공유 채널
	        </button>
	        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
			</svg>
		</div>
        <div class="collapse" id="schedule-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath }/gw/calendar/calendar.do?groupNo=${currGroupNo}" class="link-dark rounded">팀 일정공유</a></li>
            
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          관리자 전용
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">그룹 관리</a></li>
            <li><a href="#" class="link-dark rounded">그룹 가입 요청</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
  
<div class="modal fade" id="createBoardRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">게시판 개설하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createBoardRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/board/createBoardRoom.do">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label  for="defaultForm-email">게시판 이름</label>
	          <input type="text" name="boardName" class="form-control validate" placeholder="게시판 이름 작성">
	          <label for="boardType">게시판 종류</label>
	          <select class="boardType form-select" name="boardType" required>
	          	<option value="B">일반 게시판</option>
	          	<option value="A">익명 게시판</option>
	          	<option value="F">파일 게시판</option>
	          </select>
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createBoardRoom">개설</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="createChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">채팅방 개설하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createChatRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/chat/createChatRoom.do">
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <label  for="defaultForm-email">채팅방 이름</label>
              <input type="text" name="chatRoomName" class="form-control validate" placeholder="새로운 채팅방">
            </div>
            <div class="md-form mb-5">
              <label  for="defaultForm-email">채팅방 인원을 선택하세요.</label>
              <div class="create-chat-radio-box mb-3">
	              <input type="radio" name="chatRoomOpenType"  value="all" >전체
	              <input type="radio" name="chatRoomOpenType" value="select">선택
              </div>
              <div class="modal-member-box" style="border: 1px solid black; ">
              
              
		              	<div class="modal-member-profile">
		              		<input class="ml-2 mr-2"type="checkbox" name="memberId" value=""/>
		              		<div class="modal-member-profile-box">
			              		<img src="${pageContext.request.contextPath }/resources/upFile/profile/" alt="" class="modal-member-profile-img" />
		              		</div>
		              		<span class="modal-member-name"></span>
		              	</div>
            
              	
              	
              </div>
            </div>
          </div>
          <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createChatRoom">개설</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="createVoiceChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">화상 채팅방 개설하기</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form name="createVoiceChatRoomFrm" method="post" action="${pageContext.request.contextPath}/gw/voiceChat/roomEnroll.do">
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <label  for="room-name">채널명</label>
              <input type="text" id="room-name" class="form-control" name="roomName" required/>
            </div>
            <div class="md-form mb-5">
              <label  for="zoom-id">zoom 회의실 ID</label>
              <input type="text" id="zoom-id" class="form-control" name="zoomId" required/>
            </div>
            <div class="md-form mb-5">
              <label  for="zoom-password">zoom 회의실 password</label>
              <input type="text" id="zoom-password" class="form-control" name="zoomPassword" required/>
            </div>
          </div>
          <input type="hidden" name="roomAdmin" value="<sec:authentication property="principal.id"/>" readonly/>
          <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createVoiceChatRoom">생성</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>


 <script>
/* modal 제어 */
$(".modal-member-box").hide();
 $(".btn-createChatRoom").click((e)=>{
	 $(document.createChatRoomFrm).submit();
 });
 $(".createChatRoom").click((e)=>{
	 $("#createChatRoomModal").modal('show');
 });
 $(".close-modal").click((e)=>{
	 $("#createChatRoomModal").modal('hide');
	 $("#createBoardRoomModal").modal('hide');
	 $("#createVoiceChatRoomModal").modal('hide');
 });
 $("input[name=chatRoomOpenType]").change((e)=>{
	 console.log("click");
	 var val = $("input[name=chatRoomOpenType]:checked").val();
	 if(val == 'all'){
		 $(".modal-member-box").hide();
	 }else{
		 
		 
		 
		 $(".modal-member-box").show();
	 }
	 
 });
 
 
 $(".btn-createBoardRoom").click((e)=>{
	 $(document.createBoardRoomFrm).submit();
 });
 $(".createBoardRoom").click((e)=>{
	 $("#createBoardRoomModal").modal('show');
 });
 
 
 $(".btn-createVoiceChatRoom").click((e)=>{
	 $(document.createVoiceChatRoomFrm).submit();
 });
 $(".createVoiceChatRoom").click((e)=>{
	 $("#createVoiceChatRoomModal").modal('show');
 });
 
 $("#gw-logout").click((e)=>{
	 $("#memberLogoutFrm").submit();
 });
 
 $("#selectAllZoomRoomList").click((e)=>{
		let $target = $(e.target);
		let $groupNo = $target.data("groupNo");
		
		$.ajax({
			url: `${pageContext.request.contextPath}/gw/voiceChat/selectAllZoomRoomList.do`,
			data: {'groupNo' : $groupNo},
			type: "GET",
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success(List){
				const $Chatli = $(`<ul class="btn-toggle-nav list-unstyled fw-normal pb-1"></ul>`);
				console.log(List);
				$.each(List,(k,v)=>{
					let html = `<li><a href="${pageContext.request.contextPath}/gw/voiceChat/zoomConnecting.do?roomNo=\${v.roomNo}" onclick="window.open(this.href, '\${v.roomName}','width=980,height=600'); return false;" class='link-dark rounded'>\${v.roomName}</a></li>`
					$Chatli.append(html);
				});
				let html = `<li><a href='${pageContext.request.contextPath}/gw/voiceChat/voiceChatEdit.do?groupNo=${currGroupNo}' class='link-dark rounded'>채널 관리</a></li>`
					$Chatli.append(html);
				$("#voiceChat").html($Chatli);
			},
			error(xhr,textStatus,err){
				console.log(xhr,textStatus,err);
			}
		});
	}); 
 </script>