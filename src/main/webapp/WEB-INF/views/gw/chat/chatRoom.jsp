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
					          <c:choose>
					          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
									<img class="btn-profile chat-user-profile-img" src="${user.renamedFilename}" alt=""/>
									<input type="hidden" id="chat-profile-memberId" value="${user.memberId }" />
								</c:when>
								<c:otherwise>
					            <img class="btn-profile chat-user-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
					          	<input type="hidden" id="chat-profile-memberId" value="${user.memberId }" />
					            </c:otherwise>
					          </c:choose>
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
<!-- Footer-->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember"/>
</sec:authorize>
    <!-- 그룹원 리스트(축약버전) (오른쪽) -->
    
     <div class="test-member-list-small bg-light">
      <div class="online-member-list">
		<c:forEach var="user" items="${chatUserList }">
	        <div class="test-member-profile">
	          <div class="member-profile-img-box btn-profile2">
	            <c:choose>
	          	<c:when test="${fn:startsWith(user.renamedFilename,'http')}">
					<img class="member-profile-img" src="${profile}" alt="" style="width: 150px"/>
					<input type="hidden" name="profile_owner" value="${user.memberId }"/>
				</c:when>
				<c:otherwise>
	            	<img class="member-profile-img" src="${pageContext.request.contextPath }/resources/upFile/profile/${user.renamedFilename}" alt="">
	            	<input type="hidden" name="profile_owner" value="${user.memberId }"/>
	            </c:otherwise>
	          </c:choose>
	          </div>
	        </div>
		</c:forEach>
        
        

      </div>


      <div class="offline-member-list">
  
        <div class="test-member-profile">
          <div class="member-profile-img-box">
            <img class="offline member-profile-img" src="https://i.pinimg.com/564x/9e/60/60/9e6060db90687be57c52ca5c5566c487.jpg" alt="">
          </div>
        </div>

      </div>
    </div> 

  </section>
</main>
<div class="subscribe">

</div>
<!-- jquery.form.js  -->
<!-- <script src="http://malsup.github.com/jquery.form.js"></script> -->
<script>
// 스크롤 최하단 유지
 $(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); 
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
		var script = document.createElement("script");
		script.innerHTML = `$(".workspace-box").scrollTop($(".workspace-box")[0].scrollHeight); `;
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 console.log(obj); 
		 const {memberName, msg, profileRenamedFilename, messageAt, logTime} = obj;
		 
		$(".chat-content").append(`<div class="chat-profile-container">
		      <div class="chat-user-profile">
		
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
	        </div>`); 
	
		if(profileRenamedFilename.startsWith('http')){
			$(".chat-user-profile").append(`<img class="chat-user-profile-img" src="\${profileRenamedFilename}" alt="" style="height : 40px; width : 40px;"/> `);
			
		}else{
			$(".chat-user-profile").append(`<img class="chat-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${profileRenamedFilename}" alt="">`);
		}
		$(".subscribe").append(script);
	});
	stompClient.subscribe(`/dm/${loginMember.id}`, (chatMessageContent) =>{
		/* console.log("chatMessageContent : ", chatMessageContent); */
		const obj = JSON.parse(chatMessageContent.body);
		 //dmWriter(obj);
		 
		 loadDM(obj);

	});
	
	

	
});
/* DM modal 제어 */
$(".btn-profile").click((e)=>{
	$("input[name=dm-memberId]").val($(e.target).siblings().val());
	const obj = {
			sender : "${loginMember.id}",
			receiver : $(e.target).siblings().val()
		};
	 loadDM(obj);
	 var script = document.createElement("script");
	 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
	 $(".subscribe").append(script);

	$("#gwDMModal").modal('show');
    
 
});
$(".btn-profile2").click((e)=>{
	var receiver = $(e.target).next().val();
	$("input[name=dm-memberId]").val(receiver);
	console.log(receiver);
	const obj = {
			sender : "${loginMember.id}",
			receiver : receiver
		};
	 loadDM(obj);
	 var script = document.createElement("script");
	 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
	 $(".subscribe").append(script);

	$("#gwDMModal").modal('show');
     
}); 
$(".close-dm-modal").click((e)=>{
	$(".dm-profile-container").text('');
	 $(".subscribe").text('\n\n');
	$("#gwDMModal").modal('hide');

});

/* dm 메시지 전송 처리 */
$("#btn-dm-message-send").click((e) =>{
	var receiver = $(e.target).siblings("input").val();

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes();  // 분
	const obj = {
		sender : "${loginMember.id}",
		receiver : receiver,
		msg : $("#dm-chatMessageContent").val()
	};
		
	stompClient.send(`/app/dm/\${$("input[name=dm-memberId]").val()}`, {}, JSON.stringify(obj));
	setTimeout(function() { loadDM(obj)}
	, 90);
	
	
	$("#dm-chatMessageContent").val(''); // #message 초기화
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
/* DM DB 조회 ajax */
function loadDM(obj){
	$(".dm-profile-container").text('');
	const {receiver, sender, senderName, msg, profileRenamedFilename, messageAt, logTime} = obj;
	$.ajax({
		url: `${pageContext.request.contextPath}/gw/chat/loadDM.do`,
		data: {
			sender: sender,
			receiver: receiver
		},
		dataType: "json",
		success(data){
			
			$.each(data, (k,v)=>{
				$(".dm-profile-container").append(`<div class="dm-message-content-box">
			          	
				          <div class="dm-user-profile">
				            <img class="dm-user-profile-img" src="${pageContext.request.contextPath}/resources/upFile/profile/\${v.dmSenderProfileRenamedFilename}" alt="">
				          </div>
				          
				          <div class="dm-message-box">
				          
				            <div class="dm-message-sender">
				              <span><strong>\${v.dmSenderName}</strong></span>
				              <span>\${v.dmMessageAt}</span>
				            </div>
				            
				            <div class="dm-message-content">
				              <p>\${v.dmContent}</p>
				            </div>
				            
				          </div>
			        </div>	
						
						`);
			});
			var script = document.createElement("script");
			 script.innerHTML = `$(".dm-modal-body").scrollTop($(".dm-modal-body")[0].scrollHeight);`;
			 $(".subscribe").append(script);
			
		},
		error: console.log
	});
}
</script>
  </body>

</html>

      




