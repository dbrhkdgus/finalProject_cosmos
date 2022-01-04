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
    
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
  	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- stomp.js 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="${pageContext.request.contextPath }/resources/css/groupware.css" rel="stylesheet" />
</head>
<body style="overflow-x: hidden;">
	<div class="dmPopup-box">
    <div class="chat-content" style="margin-bottom: 25px;">
	        <c:if test="${not empty messageList }">
		        <c:forEach var="message" items="${messageList }">
				        <div class="chat-profile-container">
				          <div class="chat-user-profile">
              <c:choose>
	          	<c:when test="${fn:startsWith(message.dmSenderProfileRenamedFilename,'http')}">
					<img class="btn-profile chat-user-profile-img" src="${message.dmSenderProfileRenamedFilename}" alt="" style="width: 1px; zoom : 30;"/>
				</c:when>
				<c:otherwise>
					<img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${message.dmSenderProfileRenamedFilename}" alt="">
	            </c:otherwise>
	          </c:choose>				          
				            
				          </div>
				          <div class="chat-message-box">
				            <div class="chat-message-sender">
				              <span><strong>${message.dmSenderNickname }</strong></span>
				              <span><fmt:formatDate value="${message.dmMessageAt}" pattern="HH:mm"/></span>
				            </div>
				            <div class="chat-message-content">
				              <p>${message.dmContent}</p>
				            </div>
				          </div>
				        </div>
				        
		        </c:forEach>
	        </c:if>
        </div>
        
		    <div class="chat-input-box" style="width: 80vh;">
		      <div class="chat-txt border-top">
		        <input id="dm-chatMessageContent" type="text" class="form-control" name="chatMessageContent" style="width: 100%%;">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button> -->
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-dm-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		    </div> 
	</div>
		    
<script>
window.scrollTo(0,document.body.scrollHeight);
///chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	stompClient.subscribe(`/dm/${loginMember.id}`, (chatMessageContent) =>{
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 //dmWriter(obj);
		 
		location.reload();
		
	});
	
/* dm 메시지 전송 처리 */
$("#btn-dm-message-send").click((e) =>{
		var receiver = "${sender}";
		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes();  // 분
		const obj = {
			sender : "${loginMember.id}",
			receiver : receiver,
			msg : $("#dm-chatMessageContent").val()
		};
			
		stompClient.send(`/app/dm/${sender}`, {}, JSON.stringify(obj));
		setTimeout(function() { location.reload()}
		, 90);
		
		
		
		$("#dm-chatMessageContent").val(''); // #message 초기화
	});	

	
});


</script>
</body>
</html>
