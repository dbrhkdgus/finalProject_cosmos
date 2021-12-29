<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<fmt:requestEncoding value="utf-8"/> 
<jsp:include page="/WEB-INF/views/common/gw_header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>

  <div class="workspace-box" >
    <div class="chat-content">
	        <c:if test="${not empty messageList }">
		        <c:forEach var="message" items="${messageList }">
		        	<c:forEach var="user" items="${chatUserList }">
		        		<c:if test="${message.chatUserNo == user.chatUserNo }">
				        <div class="chat-profile-container">
				          <div class="chat-user-profile">
				            <img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
				          </div>
				          <div class="chat-message-box">
				            <div class="chat-message-sender">
				              <span><strong>${user.memberName }</strong></span>
				              <span><fmt:formatDate value="${message.chatMessageAt}" pattern="HH:mm"/></span>
				            </div>
				            <div class="chat-message-content">
				              <p>${message.chatMessageContent}</p>
				            </div>
				          </div>
				        </div>
		        		</c:if>
		        	</c:forEach>
		        </c:forEach>
	        </c:if>
        </div>
        
		    <div class="chat-input-box">
		
		      <div class="chat-txt border-top">
		        <input id="chatMessageContent" type="text" class="form-control" name="chatMessageContent">
		      </div>
		      <div class="btn-group">
		        <i class="fa fa-meh-o" aria-hidden="true"></i>
		        <!-- <button type="button" class="btn btn-white" data-original-title="" title="">
		        </button> -->
		          <i class="fa fa-paperclip"></i>
		      </div>
		      <button id="btn-message-send" class="btn btn-danger" data-original-title="" title="">Send</button>
		    </div> 
        
        
      </div>
<!-- jquery.form.js  -->
<!-- <script src="http://malsup.github.com/jquery.form.js"></script> -->
<script>
//저장된 채팅 내역이 없는 경우 (처음 만들엉진 채팅방인 경우)
if($(".chat-content").children().length == 0){
	$(".chat-content").append(`<div class="chat-message-box">
            <p>새로운 채팅을 시작해보세요!</p>
          </div>
        </div>`);
}
///chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	stompClient.subscribe(`/chat/${chatRoomNo}`, (chatMessageContent) =>{
		
		
		
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 console.log(obj); 
		 const {memberName, msg, profileRenamedFilename, messageAt, logTime} = obj;
		 
		$(".chat-content").append(`<div class="chat-profile-container">
		          <div class="chat-user-profile">
	            <img class="chat-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${profileRenamedFilename}" alt="">
	          </div>
	          <div class="chat-message-box">
	            <div class="chat-message-sender">
	              <span><strong>\${memberName}</strong></span>
	              <span>\${logTime}</span>
	            </div>
	            <div class="chat-message-content">
	              <p>\${msg}</p> 
	            </div>
	          </div>
	        </div>
				
				`); 
	});
	
});

$("#btn-message-send").click((e) =>{
	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	const obj = {
		chatRoomNo : "${chatRoomNo}",
		memberId : "${loginMember.id}",
		msg : $(chatMessageContent).val(),
		logTime : hours + ":" + minutes
	};
	
	stompClient.send("/app/chat/${chatRoomNo}", {}, JSON.stringify(obj));
	$(chatMessageContent).val(''); // #message 초기화
});
</script>
      


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

