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
    <script src="https://kit.fontawesome.com/76afde4c0b.js" crossorigin="anonymous"></script>
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
  <body >
<main>

<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MEMBER','ROLE_GW${currGroupNo}MASTER', 'ROLE_ADMIN')">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
	
</sec:authorize>
  <header class="bg-light">
    <div id="cosmos-groupwear-header"  style="background-color: #5288F2;">
      <div class="groupwear-header-box">
        
        <div class="" style="width: 4.5rem;">
          <a href="#" class="d-block p-3 link-dark text-decoration-none" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
            <img src="${pageContext.request.contextPath }/resources/images/cosmoslogo_white.png" width="40" alt="" onclick="location.href='${pageContext.request.contextPath}/'">
            <!-- <svg class="bi" width="40" height="32"><use xlink:href="#bootstrap"/></svg> -->
            <span class="visually-hidden">Icon-only</span>
          </a>
        </div>
        
        <div class="groupwear-study-title" style="width: 260px;">
          <a href="${pageContext.request.contextPath }/gw/gw.do?groupNo=${myGroup.groupNo}" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
            <span class="fs-5 fw-semibold" style="color: white;">${myGroup.groupName }</span>
          </a>
        </div>
        <div class="groupwear-channel-title">

          <h5 style="color: white;"> ${title }</h5>

        </div>
          
      </div>  
    </div>
  </header>
  <section id="cosmos-groupwear-workspace">

  <div class="d-flex flex-column flex-shrink-0 bg-light" style="width: 4.5rem;background-color: #5288F2 !important;">
    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">

     <c:forEach var="group" items="${myGroupList}">
    	<c:forEach var="attach" items="${groupBannerAttachList }">

     	<c:if test="${group.groupNo == attach.groupNo }">
      <li class="nav-item">
        <a href="${pageContext.request.contextPath }/gw/gw.do?groupNo=${group.groupNo}" class="nav-link ${group.groupNo == currGroupNo ? 'active' : '' }" py-3 border-bottom" aria-current="page" title="${group.groupName}" data-bs-toggle="tooltip" data-bs-placement="right">
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
      <a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false" >
        <c:choose>
	        <c:when test="${fn:startsWith(profile, 'http')}">
		        <img src="${profile}" alt="mdo" width="24" height="24" class="rounded-circle">
	        </c:when>
	        <c:otherwise>
	        	<img src="${pageContext.request.contextPath }/resources/upFile/profile/${profile}" alt="mdo" width="24" height="24" class="rounded-circle">
	        </c:otherwise>
        </c:choose>
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
  <div class="flex-shrink-0 p-3 bg-light" style="overflow-y: auto; width: 260px;background-color: #EBF0F3 !important;">
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" id="dropdownBoard" data-bs-target="#board-collapse" aria-expanded="false">
	          게시판 채널
	        </button>
	        <!-- 게시판 채널 생성 버튼 -->
	        <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
		        <div class="createBoardRoom" style="cursor: pointer; ">
	        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
				</div>
			</sec:authorize>
      	</div>
        <div class="collapse" id="board-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
           	<c:if test="${not empty boardList}">
           		<c:forEach var="boardRoom" items="${boardList}">
           			<div class="d-flex justify-content-between align-items-center" id="board-channel-list">
           				<c:choose>
           					<c:when test="${fn:contains(boardRoom.boardType, 'N')}">
			            		<li><a href="${pageContext.request.contextPath }/gw/board/notice.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
           					</c:when>
           					<c:otherwise>
			           			<c:if test="${fn:contains(boardRoom.boardType, 'B')}">
				            		<li><a href="${pageContext.request.contextPath }/gw/board/board.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName} </a></li>
				            	</c:if>
				            	<c:if test="${fn:contains(boardRoom.boardType, 'A')}">
				            		<li><a href="${pageContext.request.contextPath }/gw/board/anonymous.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
				            		
				            	</c:if>
			            		<c:if test="${fn:contains(boardRoom.boardType, 'F')}">
			            			<li><a href="${pageContext.request.contextPath }/gw/fileBoard/fileBoard.do?boardNo=${boardRoom.boardNo}&groupNo=${currGroupNo }" class="link-dark rounded">${boardRoom.boardName}</a></li>
			            		</c:if>
			            		<sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
				            		<div class="updateBoardRoom div_sub" style="cursor:pointer;" id="board-channel-admin-btn">
					            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
				  							<path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
				  							<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
										</svg>
									</div>
								</sec:authorize>
           						<span class="d-none">${boardRoom.boardNo}</span>
           					</c:otherwise>
           				</c:choose>
					</div>
           		</c:forEach>
            </c:if>	
            
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" id="dropdownChat" data-bs-target="#chatting-collapse" aria-expanded="false">
	          채팅 채널
	        </button>
	        <!-- 채팅 채널 생성 버튼 -->
	        <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
	        <div class="createChatRoom" style="cursor: pointer;">
		        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
	        </div>
	        </sec:authorize>
		</div>
        <div class="collapse" id="chatting-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	<c:choose>
	          	<c:when test="${not empty chattingChannelList}">
	          		<c:forEach var="chatRoom" items="${chattingChannelList }">
	          			<div class="d-flex justify-content-between align-items-center" id="chat-channel-list">
				            <li><a href="${pageContext.request.contextPath }/gw/chat/chatRoom.do?chatRoomNo=${chatRoom.chatRoomNo}&groupNo=${currGroupNo }" class="link-dark rounded">${chatRoom.chatRoomName }</a></li>
				            <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
			            		<div class="updateChatRoom div_sub" style="cursor:pointer;" id="chat-channel-admin-btn">
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
			  							<path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
			  							<path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
									</svg>
								</div>
								<span class="d-none">${chatRoom.chatRoomNo}</span>
							</sec:authorize>
	          			</div>
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
	        <!-- 화상 채널 생성 버튼 -->
	        <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
		        <div class="createVoiceChatRoom" style="cursor: pointer;">
			        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
					</svg>
				</div>
			</sec:authorize>
		</div>
        <div class="collapse" id="v-chatting-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small" id="voiceChat">
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" id="dropdownCalendar" data-bs-target="#schedule-collapse" aria-expanded="false">
	          일정 공유 채널
	        </button>
	        
		</div>
        <div class="collapse" id="schedule-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath }/gw/calendar/calendar.do?groupNo=${currGroupNo}" class="link-dark rounded">팀 일정공유</a></li>
            
          </ul>
        </div>
      </li>
      <li class="mb-1">
      	<div class="d-flex justify-content-between align-items-center">
	        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" id="dropdownApp" data-bs-target="#app-collapse" aria-expanded="false">
	          APP
	        </button>
	        
		</div>
        <div class="collapse" id="app-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath }/gw/app/ladder.do?groupNo=${currGroupNo}" class="link-dark rounded">사다리타기</a></li>
            <li><a href="${pageContext.request.contextPath }/gw/app/TDL.do?groupNo=${currGroupNo}" class="link-dark rounded">ToDoList</a></li>
            <li><a href="${pageContext.request.contextPath }/gw/vote/vote.do?groupNo=${currGroupNo}" class="link-dark rounded">투표</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>	
    <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER', 'ROLE_GW${currGroupNo}MANAGER','ROLE_ADMIN')">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" id="dropdownAdmin" data-bs-target="#account-collapse" aria-expanded="false">
          관리자 전용
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath }/gw/admin/groupManager.do?groupNo=${currGroupNo}" class="link-dark rounded">스터디 활동량</a></li>
            <li><a href="${pageContext.request.contextPath }/gw/admin/memberManager.do?groupNo=${currGroupNo}" class="link-dark rounded">그룹 가입 요청 & 멤버 관리</a></li>
             <sec:authorize access="hasAnyRole('ROLE_GW${currGroupNo}MASTER','ROLE_ADMIN')">
            	<li><a id="btn-delte-group" style="cursor: pointer;" class="link-dark rounded">그룹 삭제</a></li>
            </sec:authorize>
          </ul>
        </div>
      </li>
     </sec:authorize>
    </ul>
  </div>
 <!-- 게시판 개설하기 위한 모달창 --> 
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

<!-- 게시판 수정하기 위한 모달창 -->
<div class="modal fade" id="updateBoardRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">게시판 채널 관리</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form id="updateDeleteBoardFrm" name="updateBoardRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/board/updateBoardRoom.do">
	      <div class="modal-body mx-3 my-2">
	        <div class="md-form mb-3">
	          <label  for="defaultForm-email">게시판 이름</label>
	          <input type="text" name="boardName" class="form-control validate" placeholder="${boardName}" id="changingBoardName">
	        </div>
	      </div>
	      <input type="hidden" name="groupNo" value="${currGroupNo}" />
	      <input type="hidden" name="boardNo" id="board-no-for-update-delete" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-updateBoardRoom">수정</button>
        <button class="btn btn-deleteBoardRoom">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 채팅방 개설 모달창 -->
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

<!-- 채팅방 수정하기 위한 모달창 -->
<div class="modal fade" id="updateChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">채팅 채널 관리</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form id="updateDeleteChatRoomFrm" name="updateDeleteChatRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/chat/updateChatRoom.do">
	      <div class="updateDeleteChatRoomForm-height-set" style="overflow-y: auto; height: 69vh;">
		      <div class="modal-body mx-3 my-2">
		        <div class="md-form mb-3">
		          <label  for="defaultForm-email">채널 이름</label>
		          <input type="text" name="chatRoomName" class="form-control validate" placeholder="${boardName}" id="changingChatRoomName">
		        </div>
		      </div>
		      <input type="hidden" name="groupNo" value="${currGroupNo}" />
		      <input type="hidden" name="chatRoomNo" id="chat-room-no-for-update-delete" />
		      <div class="selected-chat-user-box" style="margin-left:5%;">
		      	<p>현재 채팅 참여 멤버</p>
		      </div>
		      <div class="add-selected-chat-user-box" style="margin-left:5%;">
		      
		      </div>
		      <div class="udChatRoom-script">
		      
		      </div>
	      </div>
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-updateChatRoom">수정</button>
        <button class="btn btn-deleteChatRoom">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- DM 모달창 -->
<div class="modal fade" id="gwDMModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">DM</h4>
        <button type="button" class="close close-dm-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	      <div class="dm-modal-body modal-body mx-3">
	        <div class="md-form mb-5">
	          	<div class="dm-profile-container mb-3">


		        </div>
		        
	        </div>
	        
	      </div>
	       <div class="modal-body mx-3">
	       
	        <div class="modal-dm-input-box">
		
		      <div class="modal-dm-txt border-top">
		        <input id="dm-chatMessageContent" type="text" class="form-control" name="chatMessageContent">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button> -->
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-dm-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		      <input type="hidden" name="dm-memberId" value="" />
		      
		    </div> 
	       </div>

      <div class="modal-footer d-flex justify-content-center">
        <button class="btn close-dm-modal">닫기</button>
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
          <input type="hidden" name="roomAdmin" value="<sec:authentication property="principal.nickname"/>" readonly/>
          <input type="hidden" name="groupNo" value="${currGroupNo }" />
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-createVoiceChatRoom">생성</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 그룹 삭제 모달 -->
<div class="modal fade" id="deleteGroupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold text-danger" >그룹 삭제</h4>
        <button type="button" class="close close-modal" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form:form id="updateDeleteChatRoomFrm" name="updateDeleteChatRoomFrm" method="post" action="${pageContext.request.contextPath }/gw/chat/updateChatRoom.do">
	      <div class="updateDeleteChatRoomForm-height-set" style="overflow-y: auto; height: 69vh;">
		      <div class="modal-body mx-3 my-2">
		        <div class="md-form mb-3" style="text-align: center;">

			        	<p>그룹 삭제 시, 그룹과 관련한 모든 정보가 삭제됩니다.</p>
			        	<p>그룹 삭제는 신중하게 진행해 주시기 바랍니다.</p>
						<hr />
		        
		          <label  for="defaultForm-email">삭제를 위해 다음 문장을 정확히 기입해주세요.</label>
		          <p>"<span class="delete-group-sentence text-info">${myGroup.groupName }을 삭제합니다.</span>"</p>
		          
		          <label for="delete-group-check">입력란 : </label>
		          <input type="text" id="delete-group-check" />
		        </div>
		      </div>
		      <input type="hidden" name="groupNo" value="${currGroupNo}" />
	      </div>
      </form:form>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-deleteGroup">삭제</button>
        <button class="btn close-modal">취소</button>
      </div>
    </div>
  </div>
</div>
 <script>

 $(".div_sub").click((e)=>{
	var boardName = e.target.parentNode.children[0].children[0].innerText;
	console.log(boardName);
	$("#changingBoardName").val(boardName);
 })
 
 
 
/* 채팅방 개설 modal 제어 */
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
	 $("#updateBoardRoomModal").modal('hide');
	 $("#createVoiceChatRoomModal").modal('hide');
	 $("#updateChatRoomModal").modal('hide');
	 $("#deleteGroupModal").modal('hide');
 });

 $("input[name=chatRoomOpenType]").change((e)=>{
	 var val = $("input[name=chatRoomOpenType]:checked").val();
	 if(val == 'all'){
		 $(".modal-member-box").hide();
	 }else{
		 var $groupNo = ${currGroupNo};
		 var script = document.createElement("script");
		 script.innerHTML = `var radioVal = '';
		 radioVal += $("input[name=memberId]:checked").val();
		 $("input[name=selectedMemberId]").val(radioVal);`
		 
		 $.ajax({
			url: `${pageContext.request.contextPath}/gw/chat/selectMember.do`,
			method : "get",
			data: {'groupNo' : $groupNo},
			contentType: "application/json; charset=utf-8",
		 	success(res){
		 		$.each(res,(k,v)=>{
		    	    	if(v.profileRenamedFilename.indexOf('http') == 0){
		 					$(".modal-member-box").append(`
		 					<div class="modal-member-profile">
		              		<input class="ml-2 mr-2"type="checkbox" name="memberId" value="\${v.memberId}"/>
		              		<div class="modal-member-profile-box">
		    	          	<img src="\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
		    	          	</div>
		              		<span class="modal-member-name">\${v.nickname}</span>
		              	</div>`);
		    	          	}else{
		 					$(".modal-member-box").append(`
		 					<div class="modal-member-profile">
		              		<input class="ml-2 mr-2"type="checkbox" name="memberId" value="\${v.memberId}"/>
		              		<div class="modal-member-profile-box">
		    	          	<img src="${pageContext.request.contextPath }/resources/upFile/profile/\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
		    	          	</div>
		              		<span class="modal-member-name">\${v.nickname}</span>
		              	</div>`);
		    	          	}

		 		});
		 		$(".modal-member-box").append(`<input type="hidden" name="selectedMemberId" value="" />`);
		 		$(".modal-member-box").append(script);
		 	},
		 	error : console.log
			
		 });
		 
		 
		 
		 
		 
		 $(".modal-member-box").show();
	 }
	 
 });

 /* 게시판 채널 생성 변경 삭제 */
 $(".btn-createBoardRoom").click((e)=>{
	 $(document.createBoardRoomFrm).submit();
 });
 $(".createBoardRoom").click((e)=>{
	 $("#createBoardRoomModal").modal('show');
 });
 
 $(".btn-updateBoardRoom").click((e)=>{
	 $(document.updateBoardRoomFrm).submit();
 });
 $(".updateBoardRoom").click((e)=>{
	 $("#updateBoardRoomModal").modal('show');
	 var boardNo = $(e.target).next().eq(0).text();
	 console.log(boardNo);
	 $("#board-no-for-update-delete").val(boardNo);
 });
 
 $(".btn-deleteBoardRoom").click((e)=>{
	 $("#updateDeleteBoardFrm").attr("action", `${pageContext.request.contextPath }/gw/board/deleteBoardRoom.do`);
	 $(document.updateBoardRoomFrm).submit();
 });
 
 /* 채팅 채널 생성 변경 삭제 */
 $(".updateChatRoom").click((e)=> {
	 $(".selected-chat-user-box").text('');
	 $(".add-selected-chat-user-box").text('');
	 var chatRoomName = e.target.parentNode.children[0].children[0].innerText;
	 $("#changingChatRoomName").val(chatRoomName);
	 var chatRoomNo = $(e.target).next().eq(0).text();
	 $("#chat-no-for-update-delete").val(chatRoomNo);
	 var groupNo = ${currGroupNo}
	 $("#chat-room-no-for-update-delete").val(chatRoomNo);
		 
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/chat/selectChatUser.do`,
			method : "get",
			data: {'chatRoomNo' : chatRoomNo},
			contentType: "application/json; charset=utf-8",
		 	success(res){
				console.log(res);
				var chatRoomNo = "";
				$.each(res, (k, v)=>{
					chatRoomNo += v.chatRoomOpenType == undefined? '' : v.chatRoomOpenType;
				});
					if(chatRoomNo == 'select'){
						$.each(res, (k, v)=>{
							if(v.nickname != undefined){
								if(v.profileRenamedFilename.indexOf('http') == 0){
				 					$(".selected-chat-user-box").append(`
				 					<div class="modal-member-profile">
				              		<div class="modal-member-profile-box">
				    	          	<img src="\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
				    	          	</div>
				              		<span class="modal-member-name">\${v.nickname}</span>
				              	</div>`);
				    	          	}else{
				 					$(".selected-chat-user-box").append(`
				 					<div class="modal-member-profile">
				              		<div class="modal-member-profile-box">
				    	          	<img src="${pageContext.request.contextPath }/resources/upFile/profile/\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
				    	          	</div>
				              		<span class="modal-member-name">\${v.nickname}</span>
				              	</div>`);
								}
							}
						});
						$(".selected-chat-user-box").append(`<hr />`);
	 					
					};
		 	},
		 	error : console.log
		 });
	 
	 $.ajax({
			url: `${pageContext.request.contextPath}/gw/chat/selectMemberExceptSelected.do`,
			method : "get",
			data: {'groupNo' : groupNo,
				'chatRoomNo' : chatRoomNo
			},
			contentType: "application/json; charset=utf-8",
		 	success(res){
		 		$.each(res,(k,v)=>{
	    	    	if(v.profileRenamedFilename.indexOf('http') == 0){
	 					$(".add-selected-chat-user-box").append(`
	 					<div class="modal-member-profile">
	              		<input class="ml-2 mr-2" type="checkbox" name="memberId" value="\${v.memberId}"/>
	              		<div class="modal-member-profile-box">
	    	          	<img src="\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
	    	          	</div>
	              		<span class="modal-member-name">\${v.nickname}</span>
	              	</div>`);
	    	          	}else{
	 					$(".add-selected-chat-user-box").append(`
	 					<div class="modal-member-profile">
	              		<input class="ml-2 mr-2" type="checkbox" name="memberId" value="\${v.memberId}"/>
	              		<div class="modal-member-profile-box">
	    	          	<img src="${pageContext.request.contextPath }/resources/upFile/profile/\${v.profileRenamedFilename}" alt="" class="modal-member-profile-img" style="width: 1px; zoom : 30;"/>
	    	          	</div>
	              		<span class="modal-member-name">\${v.nickname}</span>
	              	</div>`);

	    	          	};
	    	          	

	 		});
	 	},
	 	error : console.log
		
	 });

	 $("#updateChatRoomModal").modal('show');
 });
 
 
 $(".btn-updateChatRoom").click((e)=>{
		var form = $('#updateDeleteChatRoomFrm')[0];
	    var formData = new FormData(form);
	     $.ajax({
	        url : "${pageContext.request.contextPath}/gw/chat/updateChatRoom.do",
	        type : 'POST',
	        data : formData,
	        contentType : false,
	        processData : false,
	        headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 	},
		 	success(data){
		 		if(data > 0){
		 			alert("채팅방 정보가 변경되었습니다.");
		 			location.reload();
		 		}
		 	},
		 	error : console.log
	    });  
	});
 
	$(".btn-deleteChatRoom").click((e)=>{
		var chatRoomNo = $("#chat-room-no-for-update-delete").val();
		console.log(chatRoomNo);
 	 	if(confirm("모든 채팅 내역이 사라집니다. 삭제하시겠습니까?")){
			$.ajax({
				url : "${pageContext.request.contextPath}/gw/chat/deleteChatRoom.do",
				data : {
					chatRoomNo : chatRoomNo
				},
				success(res){
					if(res > 0){
						alert("채팅방이 삭제되었습니다.");
						location.reload();
					}
				},
				error : console.log
			});
			
		}
		
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
 
 window.addEventListener("load", function(){
		let $target = $("#selectAllZoomRoomList");
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
 /* 그룹삭제 */
 $("#btn-delte-group").click((e)=>{
	$("#deleteGroupModal").modal('show');
 });
 $(".btn-deleteGroup").click((e)=>{
	 if($(".delete-group-sentence").text() == $("#delete-group-check").val()){
		 $.ajax({
			url : "${pageContext.request.contextPath}/group/deleteGroup.do",
			method : "post",
			headers: {
				"${_csrf.headerName}" : "${_csrf.token}"
		 	},
			data : {
				groupNo : "${currGroupNo}"
			},
			success(res){
				if(res > 0){
					alert("그룹이 삭제되었습니다.");
					location.href = "${pageContext.request.contextPath}/";
				}
			},
			error : console.log
		 });
		 
		 
		 
		 
	 }else{
		 alert("입력 정보가 일치하지 않습니다.");
	 }
 });
 
 </script>
 </sec:authorize>
