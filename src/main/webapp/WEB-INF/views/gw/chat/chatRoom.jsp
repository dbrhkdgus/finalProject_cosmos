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

        <!-- 채팅1 시작 -->
        <c:choose>
	        <c:when test="${not empty messageList }">
		        <div class="chat-profile-container">
		          <div class="chat-user-profile">
		            <img class="chat-user-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
		          </div>
		          <div class="chat-message-box">
		            <div class="chat-message-sender">
		              <span><strong>홍길동</strong></span>
		              <span>11:10</span>
		            </div>
		            <div class="chat-message-content">
		              <p>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</p>
		            </div>
		          </div>
		        </div>
	        </c:when>
	        <c:otherwise>
		        <div class="chat-message-content">
			              <p>새로운 채팅을 시작해보세요!</p>
			    </div>
	        </c:otherwise>
        </c:choose>
        <!-- 채팅1  끝 -->
        
 
       
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
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
///chat/chatId
//1. Stomp Client 객체 생성(websocket)

	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);
	
	// 2. 연결요청
	stompClient.connect({}, (frame) =>{
		console.log("Stomp Connected : ", frame);
		
	// 3. 구독요청
	stompClient.subscribe(`/chat/${chatRoomNo}`, (chatMessageContent) =>{
		console.log("chatMessageContent : ", chatMessageContent);
		const obj = JSON.parse(chatMessageContent.body);
		console.log(obj);
		const {memberId, msg} = obj;
		//$(data).append(`<li class="list-group-item">\${memberId} : \${msg}</li>`);
	});
	
});

$("#btn-message-send").click((e) =>{
	const obj = {
		chatRoomNo : "${chatRoomNo}",
		memberId : "${loginMember.id}",
		msg : $(chatMessageContent).val(),
		logTime : Date.now()
	};
	
	stompClient.send("/app/chat/${chatRoomNo}", {}, JSON.stringify(obj));
	$(chatMessageContent).val(''); // #message 초기화
});
</script>
      


<jsp:include page="/WEB-INF/views/common/gw_footer.jsp"></jsp:include>

